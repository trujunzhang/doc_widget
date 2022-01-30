import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/item_preview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemPreview extends StatelessWidget {
  ItemPreview(this.previews, this.scrollDirection);

  final List<WidgetPreview> previews;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: Spaces.goldenDream),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextPreview(text: 'Preview'),
          _buildPreviewList(),
          SizedBox(height: 200),
        ],
      ),
    );
  }

  Widget _buildPreviewList() {
    if (scrollDirection == Axis.horizontal && isMobile() == false) {
      return Container(
        height: 600,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: previews.length,
          itemBuilder: (BuildContext context, int index) {
            final preview = previews[index];
            return ItemPreviewItem(preview);
          },
        ),
      );
    }
    return Column(
      children: [
        ...List.generate(
          previews.length,
          (index) {
            final preview = previews[index];
            return ItemPreviewItem(preview);
          },
        ),
      ],
    );
  }
}
