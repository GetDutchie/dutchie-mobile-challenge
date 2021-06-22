import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ResultTab extends StatelessWidget {
  final GraphQLClient client = Get.find();

  ResultTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text('Add Product Grid Here!'),
      );
}
