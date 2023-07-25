import 'package:flutter/material.dart';
import 'ui/page/home_screen.dart';

void main() {
  runApp(const ImageViewerCaApp());
}

class ImageViewerCaApp extends StatelessWidget {
  const ImageViewerCaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
