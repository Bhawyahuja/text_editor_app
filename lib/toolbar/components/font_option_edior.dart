import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/toolbar/components/toolbar_item.dart';

class FontOptionEditor extends StatelessWidget {
  const FontOptionEditor({
    super.key,
    required this.bold,
    required this.italic,
    required this.underline,
    required this.strikethrough,
    required this.onFontOptionEdited,
  });

  final bool bold;
  final bool italic;
  final bool underline;
  final bool strikethrough;
  final Function(
    bool bold,
    bool italic,
    bool underline,
    bool strikethrough,
  ) onFontOptionEdited;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      children: [
        _item(
          Icons.format_bold_outlined,
          "Bold",
          bold,
          () => onFontOptionEdited(!bold, italic, underline, strikethrough),
        ),
        _item(
          Icons.format_italic_outlined,
          "Italics",
          italic,
          () => onFontOptionEdited(bold, !italic, underline, strikethrough),
        ),
        _item(
          Icons.format_underline_outlined,
          "Underline",
          underline,
          () => onFontOptionEdited(bold, italic, !underline, false),
        ),
        _item(
          Icons.format_strikethrough_outlined,
          "Strikethrough",
          strikethrough,
          () => onFontOptionEdited(bold, italic, false, !strikethrough),
        ),
      ],
    );
  }

  ToolbarItem _item(
    IconData icon,
    String title,
    bool value,
    VoidCallback onPressed,
  ) {
    return ToolbarItem(
      onPressed: onPressed,
      isActive: value,
      height: 60,
      showBorder: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: App.theme.indicatorColor),
          Text(title, style: TextStyle(color: App.theme.indicatorColor)),
        ],
      ),
    );
  }
}
