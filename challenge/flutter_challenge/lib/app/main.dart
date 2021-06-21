import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages/home_page.dart';
import 'package:flutter_challenge/app/theme/app_theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      home: HomePage(),
    );
  }
}

void main() {
  runApp(App());
}
