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
            },
          );
        },
      ),
      body: GetBuilder<SimpleController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 130,
                            childAspectRatio: 2 / 3.5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: controller.pictureList.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          // TODO : Detail 화면으로 이동
                          // final picture = controller.pictureList[index];
                        },
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                controller.pictureList[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              controller.pictureList[index].tags,
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
          );
        },
      ),
    );
  }
}
