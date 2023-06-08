import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/toolbar/components/font_family_editor.dart';
import 'package:text_editor_app/toolbar/components/font_option_edior.dart';
import 'package:text_editor_app/toolbar/ui/tool_enum.dart';
import 'package:text_editor_app/toolbar/ui/toolbar.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  Tool _selectedTool = Tool.fontFamily;
  String? fontFamily;
  TextStyle _textStyle = const TextStyle(color: Colors.black);
  TextAlign _textAlign = TextAlign.start;
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: App.theme.indicatorColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    style: _textStyle,
                    focusNode: _focusNode,
                    onSubmitted: (value) => _focusNode.unfocus(),
                    decoration: const InputDecoration.collapsed(
                      hintText: "Enter text here",
                    ),
                  ),
                ),
              ),
            ),
            Toolbar(
              selectedTool: _selectedTool,
              onToolSelected: (tool) => setState(() => _selectedTool = tool),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: App.screenHeight * 0.3,
              child: _getEditor(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getEditor() {
    switch (_selectedTool) {
      case Tool.fontFamily:
        return FontFamilyEditor(
          selectedFont: fontFamily,
          onFontSelected: (font) {
            setState(() {
              fontFamily = font;
              _textStyle = GoogleFonts.getFont(font, textStyle: _textStyle);
            });
          },
        );
      case Tool.fontOption:
        return FontOptionEditor(
          bold: _textStyle.fontWeight == FontWeight.bold,
          italic: _textStyle.fontStyle == FontStyle.italic,
          underline: _textStyle.decoration == TextDecoration.underline,
          strikethrough: _textStyle.decoration == TextDecoration.lineThrough,
          onFontOptionEdited: (bold, italic, underline, strikethrough) {
            setState(
              () {
                _textStyle = _textStyle.copyWith(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                  decoration: underline
                      ? TextDecoration.underline
                      : strikethrough
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                );
              },
            );
          },
        );
      default:
        return Container();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
