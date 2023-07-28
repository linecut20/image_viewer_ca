import 'package:flutter/material.dart';
import 'package:image_viewer_ca/ui/page/home_screen/home_screen_view_model.dart';

class PhotoProvider extends InheritedWidget {
  final HomeScreenViewModel homeScreenViewModel;

  const PhotoProvider(
      {super.key, required super.child, required this.homeScreenViewModel});

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'api is null');

    return result!;
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.homeScreenViewModel != homeScreenViewModel;
  }
}
