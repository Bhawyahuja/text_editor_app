import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/toolbar/components/font_family_editor.dart';
import 'package:text_editor_app/toolbar/ui/tool_enum.dart';
import 'package:text_editor_app/toolbar/ui/toolbar.dart';

class CanvasPage extends StatefulWidget {
  const CanvasPage({super.key});

  @override
  State<CanvasPage> createState() => _CanvasPageState();
}

class _CanvasPageState extends State<CanvasPage> {
  Tool _selectedTool = Tool.fontFamily;
  TextStyle _textStyle = const TextStyle();
  TextAlign _textAlign = TextAlign.start;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InteractiveViewer(
            child: TextField(),
          ),
          Toolbar(
            selectedTool: _selectedTool,
            onToolSelected: (tool) => setState(() => _selectedTool = tool),
          ),
          SizedBox(
            height: App.screenHeight * 0.3,
            child: _getEditor(),
          ),
        ],
      ),
    );
  }

  Widget _getEditor() {
    switch (_selectedTool) {
      case Tool.fontFamily:
        return FontFamilyEditor(
          selectedFont: _textStyle.fontFamily,
          onFontSelected: (font) {
            setState(() => _textStyle = _textStyle.copyWith(fontFamily: font));
          },
        );
      case Tool.fontOption:
        return Container();
      default:
        return Container();
    }
  }
}
