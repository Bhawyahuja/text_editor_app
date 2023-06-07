import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';
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
      child: ListView.separated(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: Tool.values.length,
        itemBuilder: (context, index) {
          var tool = Tool.values[index];
          return ToolbarItem(
            onPressed: () => onToolSelected(tool),
            isActive: selectedTool == tool,
            child: Icon(tool.icon, color: App.theme.indicatorColor),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 12),
      ),
    );
  }
}
