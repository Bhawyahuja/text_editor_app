import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/toolbar/components/toolbar_item.dart';

class FontFamilyEditor extends StatelessWidget {
  FontFamilyEditor({
    super.key,
    required this.selectedFont,
    required this.onFontSelected,
  });

  final String? selectedFont;
  final Function(String font) onFontSelected;

  final List<String> _fonts = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: _fonts
          .map(
            (font) => ToolbarItem(
              onPressed: () => onFontSelected(font),
              isActive: selectedFont == font,
              height: 40,
              width: App.screenWidth / 4,
              child: Text(font, style: TextStyle(fontFamily: font)),
            ),
          )
          .toList(),
    );
  }
}
