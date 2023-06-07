import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';

class ToolbarItem extends StatelessWidget {
  const ToolbarItem({
    super.key,
    required this.onPressed,
    required this.child,
    this.isActive = false,
    this.height = 40,
    this.width = 40,
    this.showBorder = true,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool isActive;
  final double height;
  final double width;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: showBorder ? App.theme.indicatorColor : App.theme.primaryColor,
        ),
      ),
      color: isActive ? App.theme.primaryColor : App.theme.disabledColor,
      onPressed: onPressed,
      height: height,
      minWidth: width,
      child: child,
    );
  }
}
