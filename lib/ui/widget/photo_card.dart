import 'package:flutter/material.dart';
import 'package:image_viewer_ca/model/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({required this.photo, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: Image.network(photo.previewURL).image, fit: BoxFit.cover)),
    );
  }
}
