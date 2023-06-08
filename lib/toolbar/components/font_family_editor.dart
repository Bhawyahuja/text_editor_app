import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/toolbar/components/toolbar_item.dart';

class FontFamilyEditor extends StatelessWidget {
  const FontFamilyEditor({
    super.key,
    required this.selectedFont,
    required this.onFontSelected,
  });

  final String? selectedFont;
  final Function(String font) onFontSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      padding: const EdgeInsets.all(16),
      itemCount: GoogleFonts.asMap().keys.toList().length,
      itemBuilder: (context, index) {
        String? font = GoogleFonts.asMap().keys.toList()[index];
        return ToolbarItem(
          onPressed: () => onFontSelected(font),
          isActive: selectedFont == font,
          height: 40,
          width: App.screenWidth / 4,
          showBorder: false,
          child: Text(
            font,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.getFont(font, color: App.theme.indicatorColor),
          ),
        );
      },
    );
  }
}
