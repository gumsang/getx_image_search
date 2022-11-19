import 'package:get/get.dart';
import 'package:getx_image_search/domain/model/picture.dart';

class SimpleController extends GetxController {
  var search = ''.obs;
  List<Picture> pictureList = [];

  @override
  void onInit() {
    _sendGetRequest();

    ever(
      search,
      (callback) => _sendGetRequest(),
    );

    super.onInit();
  }

  void _sendGetRequest() async {
    final connect = GetConnect();
    final response = await connect.get(
        'https://pixabay.com/api/?key=10711147-dc41758b93b263957026bdadb&q=${search.value}&image_type=photo');

    // log(response.body as String);

    Iterable hits = response.body['hits'];
    pictureList = hits.map((e) => Picture.fromJson(e)).toList();

    update();
  }
}
