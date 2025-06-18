import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BridalCollectionsDesktop extends StatelessWidget {
  const BridalCollectionsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final title = args['title'];
    // ignore: unused_local_variable
    final videoUrl = args['videoUrl'];

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title')),
    );
  }
}
