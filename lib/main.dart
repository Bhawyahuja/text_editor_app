import 'package:flutter/material.dart';
import 'package:text_editor_app/app_config/app.dart';
import 'package:text_editor_app/app_config/app_theme.dart';
import 'package:text_editor_app/canvas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: const AppStart(),
    );
  }
}

class AppStart extends StatefulWidget {
  const AppStart({super.key});

  @override
  State<AppStart> createState() => _AppStartState();
}

class _AppStartState extends State<AppStart> {
  @override
  void didChangeDependencies() {
    App.init(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const CanvasPage();
  }
}
