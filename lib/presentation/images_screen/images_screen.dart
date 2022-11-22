import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getx_image_search/presentation/images_screen/images_view_model.dart';

class ImagesScreen extends GetView<ImagesViewModel> {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("이미지서치 with GetX"),
      ),
      body: Center(
        child: GetBuilder<ImagesViewModel>(
          builder: (controller) {
            return Column(
              children: [
                TextField(
                  controller: controller.searchController,
                  onChanged: (value) {
                    controller.setQuery();
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MasonryGridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      itemCount: controller.pictureList.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          controller.pictureList[index].url,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
