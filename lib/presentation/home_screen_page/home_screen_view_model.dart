import 'package:flutter/material.dart';
import 'package:image_viewer_ca/data/api.dart';
import 'package:image_viewer_ca/model/photo.dart';

class HomeScreenViewModel with ChangeNotifier {
  final PixabayApi api;
  HomeScreenViewModel(this.api);

  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  void fetch(String query) {
    api.fetch(query).then((value) {
      _photos = value;
      notifyListeners();
    });
  }
}
