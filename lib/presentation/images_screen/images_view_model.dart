import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_image_search/domain/model/picture.dart';

class ImagesViewModel extends GetxController with StateMixin<List<Picture>> {
  TextEditingController searchController = TextEditingController();
  final _query = ''.obs;
  List<Picture> pictureList = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    _searchImagesFromPixabay();

    debounce(
      _query,
      (callback) {
        _searchImagesFromPixabay();
      },
    );

    // ever(
    //   query,
    //   (callback) => _searchImagesFromPixabay(),
    // );

    super.onInit();
  }

  void setQuery() {
    _query.value = searchController.text;
  }

  Future<void> _searchImagesFromPixabay() async {
    change(pictureList, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 1));
    final connect = GetConnect();
    final response = await connect.get(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=${searchController.value.text}&image_type=photo');

    // log(response.body as String);

    Iterable hits = response.body['hits'];
    pictureList = hits.map((e) => Picture.fromJson(e)).toList();

    change(pictureList, status: RxStatus.success());
  }
}
