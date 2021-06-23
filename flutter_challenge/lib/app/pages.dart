import 'package:flutter_challenge/app/pages/home/home_page.dart';
import 'package:flutter_challenge/app/routes.dart';
import 'package:get/get.dart';

abstract class Pages {
  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.HOME,
      page: () => HomePage(),
    )
  ];
}
