import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/theme/app_theme.dart';
import 'package:flutter_challenge/app/theme/icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnTapTabCallback = Function(int);

class NavBar extends StatelessWidget {
  final int activeIndex;
  final OnTapTabCallback onTapTabCallback;

  const NavBar({
    Key? key,
    this.activeIndex = 0,
    required this.onTapTabCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: AppTheme.primaryGreen,
        currentIndex: activeIndex,
        onTap: onTapTabCallback,
        selectedItemColor: AppTheme.green[95],
        unselectedItemColor: AppTheme.green[65],
        selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
        unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Read Me',
            icon: SvgPicture.asset(
              DISPENSARY_SVG,
            ),
            activeIcon: SvgPicture.asset(
              DISPENSARY_SVG,
              color: AppTheme.green[95],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Challenge',
            icon: SvgPicture.asset(
              CHALLENGE_SVG,
            ),
            activeIcon: SvgPicture.asset(
              CHALLENGE_SVG,
              color: AppTheme.green[95],
            ),
          ),
          BottomNavigationBarItem(
            label: 'Result',
            icon: SvgPicture.asset(
              RESULT_SVG,
            ),
            activeIcon: SvgPicture.asset(
              RESULT_SVG,
              color: AppTheme.green[95],
            ),
          ),
        ],
      );
}
