import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge/app/pages.dart';
import 'package:flutter_challenge/app/routes.dart';
import 'package:flutter_challenge/app/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class App extends StatelessWidget {
  final GraphQLClient client = Get.put(
    GraphQLClient(
      link: HttpLink('http://127.0.0.1:5000/graphql'),
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => GraphQLProvider(
        client: ValueNotifier<GraphQLClient>(client),
        child: GetMaterialApp(
          title: 'Flutter Challenge',
          theme: AppTheme.themeData,
          initialRoute: Routes.HOME,
          getPages: Pages.pages,
          debugShowCheckedModeBanner: false,
        ),
      );
}

void main() async {
  await initHiveForFlutter();

  runApp(App());
}
