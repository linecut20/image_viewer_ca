import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:image_viewer_ca/data/api.dart';
import 'package:image_viewer_ca/data/result.dart';
import 'package:image_viewer_ca/model/photo.dart';
import 'package:image_viewer_ca/use_case/get_photos_use_case.dart';

class HomeScreenViewModel with ChangeNotifier {
  final PixabayApi api;
  List<Photo> _photos = [];
  List<Photo> get photos => _photos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final StreamController eventController = StreamController<String>();
  Stream get eventStream => eventController.stream;

  HomeScreenViewModel(this.api);

  void fetch(String query) {
    _isLoading = true;
    notifyListeners();

    GetPhotosUseCase(api).execute(query).then((Result result) {
      if (result is Success) {
        _photos = result.value;
      } else if (result is Error) {
        if (kDebugMode) {
          print(result.e);
        }
        eventController.add(result.e);
        _photos = [];
      }

      _isLoading = false;

      notifyListeners();
    });

    // api.fetch(query).then((Result<List<Photo>> result) {
    //   if (result is Success<List<Photo>>) {
    //     _photos = result.value;
    //   } else if (result is Error<List<Photo>>) {
    //     if (kDebugMode) {
    //       print(result.e);
    //     }
    //     eventController.add(result.e);
    //     _photos = [];
    //   }

    //   _isLoading = false;

    //   notifyListeners();
    // });
  }
}
