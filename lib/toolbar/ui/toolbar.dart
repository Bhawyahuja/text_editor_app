import 'package:flutter/material.dart';
import 'package:text_editor_app/toolbar/components/toolbar_item.dart';
import 'package:text_editor_app/toolbar/ui/tool_enum.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    super.key,
    required this.selectedTool,
    required this.onToolSelected,
  });

  final Tool selectedTool;
  final Function(Tool) onToolSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Tool.values.length,
        itemBuilder: (context, index) {
          var tool = Tool.values[index];
          return ToolbarItem(
            onPressed: () => onToolSelected(tool),
            isActive: selectedTool == tool,
            child: Icon(tool.icon),
          );
        },
      ),
    );
  }
}
