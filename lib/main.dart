import 'package:flutter/material.dart';
import 'package:image_viewer_ca/data/api.dart';
import 'package:image_viewer_ca/data/photo_provider.dart';
import 'package:image_viewer_ca/ui/page/home_screen/home_screen_view_model.dart';
import 'ui/page/home_screen/home_screen.dart';

void main() {
  runApp(const ImageViewerCaApp());
}

class ImageViewerCaApp extends StatelessWidget {
  const ImageViewerCaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PhotoProvider(
          homeScreenViewModel: HomeScreenViewModel(PixabayApi()),
          child: const HomeScreen()),
    );
  }
}
