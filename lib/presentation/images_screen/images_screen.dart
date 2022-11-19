import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_image_search/presentation/images_screen/simple_controller.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("이미지서치 with GetX"),
      ),
      floatingActionButton: GetBuilder<SimpleController>(
        builder: (controller) {
          return AnimSearchBar(
            width: MediaQuery.of(context).size.width - 40,
            textController: searchController,
            suffixIcon: const Icon(Icons.search),
            rtl: true,
            onSuffixTap: () {
              controller.search.value = searchController.text;
              log(controller.search.value);
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      // final movie = viewModel.state.movies[index];
                      // Navigator.push(
                      //   context,
                      //   PageRouteBuilder(
                      //     transitionDuration:
                      //         const Duration(milliseconds: 1),
                      //     pageBuilder: (_, __, ___) =>
                      //         MovieDetailScreen(movie),
                      //   ),
                      // );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              "http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg"),
                        ),
                        const Text(
                          "헬로",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
