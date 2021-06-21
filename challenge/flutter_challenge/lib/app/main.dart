import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages/home/home_page.dart';
import 'package:flutter_challenge/app/theme/app_theme.dart';
import 'package:get/route_manager.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.themeData,
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      );
}

void main() {
  runApp(App());
}
