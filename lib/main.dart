import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_image_search/presentation/images_screen/images_screen.dart';
import 'package:getx_image_search/presentation/images_screen/images_view_model.dart';

void main() {
  Get.put(ImagesViewModel());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagesScreen(),
    );
  }
}
