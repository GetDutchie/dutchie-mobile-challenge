import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeTabIndex = 0;

  String get title {
    switch (_activeTabIndex) {
      case 0:
        return 'Read Me First';

      case 1:
        return 'The Challenge';

      case 2:
        return 'The Result';

      default:
        return '';
    }
  }

  void onTapTab(int index) {
    setState(() {
      _activeTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: PageView(
          children: [],
        ),
      ),
      bottomNavigationBar: NavBar(
        activeIndex: _activeTabIndex,
        onTapTabCallback: onTapTab,
      ),
    );
  }
}
