import 'package:flutter_test/flutter_test.dart';
import 'package:image_viewer_ca/data/photo_api_repository.dart';
import 'package:image_viewer_ca/model/photo.dart';
import 'package:image_viewer_ca/ui/page/home_screen/home_screen_view_model.dart';

void main() {
  test('stream 작동 확인용', () {
    final viewModel = HomeScreenViewModel(FakePhotoApiRepository());

    viewModel.fetch('apple');
    viewModel.fetch('ronaldo');

    final result = fakeData.map((e) => Photo.fromJson(e)).toList();

    expect(
      viewModel.photoStream,
      emitsInOrder(
        [
          // isA<List<Photo>>(),
          equals([]),
          equals(result),
          equals(result),
        ],
      ),
    );
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(seconds: 1));

    return fakeData.map((e) => Photo.fromJson(e)).toList();
  }
}

List fakeData = [
  {
    "id": 195893,
    "pageURL": "https://pixabay.com/en/blossom-bloom-flower-195893/",
    "type": "photo",
    "tags": "blossom, bloom, flower",
    "previewURL":
        "https://cdn.pixabay.com/photo/2013/10/15/09/12/flower-195893_150.jpg",
    "previewWidth": 150,
    "previewHeight": 84,
    "webformatURL": "https://pixabay.com/get/35bbf209e13e39d2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 360,
    "largeImageURL": "https://pixabay.com/get/ed6a99fd0a76647_1280.jpg",
    "fullHDURL": "https://pixabay.com/get/ed6a9369fd0a76647_1920.jpg",
    "imageURL": "https://pixabay.com/get/ed6a9364a9fd0a76647.jpg",
    "imageWidth": 4000,
    "imageHeight": 2250,
    "imageSize": 4731420,
    "views": 7671,
    "downloads": 6439,
    "likes": 5,
    "comments": 2,
    "user_id": 48777,
    "user": "Josch13",
    "userImageURL":
        "https://cdn.pixabay.com/user/2013/11/05/02-10-23-764_250x250.jpg",
  },
];
