import 'package:flutter/widgets.dart';

abstract class Documentation {
  String get name;

  List<PropertyDoc> get properties;

  bool get hasState;

  String get snippet;
}

class PropertyDoc {
  PropertyDoc({
    required this.name,
    required this.type,
    required this.isRequired,
    required this.isNamed,
    this.description,
    this.defaultValue,
  });

  final String name;
  final String type;
  final bool isRequired;
  final bool isNamed;
  final String? description;
  final String? defaultValue;
}

class ElementPreview {
  ElementPreview({
    required this.document,
    required this.previews,
    this.scrollDirection = Axis.vertical,
    this.height = 600,
  });

  final double height;
  final Axis scrollDirection;
  final Documentation document;
  final List<WidgetPreview> previews;
}

class WidgetPreview {
  WidgetPreview({
    required this.widget,
    this.description,
    this.cardBox = false,
    this.width = double.infinity,
  });

  final Widget widget;
  final String? description;
  final double width;
  final bool cardBox;
}
