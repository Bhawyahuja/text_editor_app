import 'package:flutter/material.dart';

enum Tool {
  fontFamily(Icons.font_download_outlined),
  fontOption(Icons.format_strikethrough_outlined),
  fontSize(Icons.text_fields_outlined),
  textAlign(Icons.format_align_justify_outlined),
  color(Icons.text_format_outlined),
  backgroundColor(Icons.format_color_fill_outlined);

  final IconData icon;

  const Tool(this.icon);
}
