import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:doc_widget/src/elements.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/widgets/title.dart';
import 'package:mix/mix.dart';

class ItemPreviewItem extends StatelessWidget {
  ItemPreviewItem(this.preview);

  final WidgetPreview preview;

  Widget _buildPreview() {
    if (preview.cardBox) {
      Mix style = Mix.fromList([
        if (preview.width != double.infinity) width(preview.width),
        padding(12),
      ]);

      return CardX(
        mix: style,
        children: [preview.widget],
      );
    }
    return preview.widget;
  }

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
          _buildPreview(),
        ],
      ),
    );
  }
}
