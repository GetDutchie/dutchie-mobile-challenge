import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages/home/widgets/challenge_tab.dart';
import 'package:flutter_challenge/app/pages/home/widgets/read_me_tab.dart';
import 'package:flutter_challenge/app/pages/home/widgets/result_tab.dart';
import 'package:flutter_challenge/app/widgets/nav_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeTabIndex = 0;
  late PageController _pageController;

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

  @override
  void initState() {
    _pageController = PageController(initialPage: _activeTabIndex);

    super.initState();
  }

  void onTapTab(int index) {
    setState(() {
      _activeTabIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          height: Get.height,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              ReadMeTab(),
              ChallengeTab(),
              ResultTab(),
            ],
          ),
        ),
        bottomNavigationBar: NavBar(
          activeIndex: _activeTabIndex,
          onTapTabCallback: onTapTab,
        ),
      );
}
