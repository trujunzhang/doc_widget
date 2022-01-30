import 'package:doc_widget/doc_widget.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/app_bar.dart';
import 'package:doc_widget/src/widgets/drawer.dart';
import 'package:doc_widget/src/widgets/item.dart';
import 'package:flutter/material.dart';

/// Flutter application responsible to show all elements that are generated.
class DocPreview extends StatefulWidget {
  DocPreview({required this.elements, this.title, this.selectedIndex = -1});

  final List<ElementPreview> elements;
  final String? title;
  final int selectedIndex;

  @override
  _DocPreviewState createState() => _DocPreviewState();
}

class _DocPreviewState extends State<DocPreview> {
  late ElementPreview _selectedItem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ElementPreview get selectedItem {
    if (widget.selectedIndex != -1 &&
        widget.selectedIndex < widget.elements.length - 1) {
      return widget.elements[widget.selectedIndex];
    }
    return widget.elements.last;
  }

  @override
  void initState() {
    _selectedItem = selectedItem;
    super.initState();
  }

  void setSelectedItem(ElementPreview selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderBody() {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spaces.goldenDream,
            vertical: Spaces.geraldine,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: Item(_selectedItem),
          ),
        ),
      );
    }

    Widget renderDrawer() {
      return DrawerCustom(
        title: widget.title,
        elements: widget.elements,
        onTap: (selectedItem) {
          setSelectedItem(selectedItem);
          if (_scaffoldKey.currentState!.isDrawerOpen && isMobile()) {
            _scaffoldKey.currentState!.openEndDrawer();
          }
        },
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile() ? renderDrawer() : null,
      appBar: isMobile()
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppBarCustom(title: _selectedItem.document.name),
            )
          : null,
      body: isMobile()
          ? renderBody()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                renderDrawer(),
                Expanded(child: renderBody()),
              ],
            ),
    );
  }
}
