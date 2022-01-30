import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';

class ItemPreviewItem extends StatelessWidget {
  ItemPreviewItem(this.preview);

  final WidgetPreview preview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Spaces.springGreen,
        bottom: Spaces.goldenDream,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (preview.description != null)
            TextPreview(
              text: preview.description!,
              size: 14,
              color: ColorsDoc.darkGray,
            ),
          preview.widget,
        ],
      ),
    );
  }
}
