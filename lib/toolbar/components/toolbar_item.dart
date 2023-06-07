import 'package:flutter/material.dart';

class ToolbarItem extends StatelessWidget {
  const ToolbarItem({
    super.key,
    required this.onPressed,
    required this.child,
    this.isActive = false,
    this.height = 40,
    this.width = 40,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool isActive;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Theme.of(context).colorScheme.surface),
      ),
      onPressed: onPressed,
      height: height,
      minWidth: width,
      child: child,
    );
  }
}
