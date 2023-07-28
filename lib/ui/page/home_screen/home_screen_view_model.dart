import 'dart:async';

import 'package:image_viewer_ca/data/photo_api_repository.dart';
import 'package:image_viewer_ca/model/photo.dart';

class HomeScreenViewModel {
  final PhotoApiRepository repository;
  HomeScreenViewModel(this.repository);

  final StreamController<List<Photo>> streamController =
      StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => streamController.stream;

  void fetch(String query) {
    repository.fetch(query).then((value) {
      streamController.add(value); //photoStream이 변경을 감지
    });
  }
}
