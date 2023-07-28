import 'package:flutter/material.dart';
import 'package:image_viewer_ca/data/api.dart';
import 'package:image_viewer_ca/presentation/home_screen_page/home_screen.dart';
import 'package:image_viewer_ca/presentation/home_screen_page/home_screen_view_model.dart';
import 'package:provider/provider.dart';

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
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => HomeScreenViewModel(PixabayApi()),
        ),
      ], child: const HomeScreen()),
    );
  }
}
