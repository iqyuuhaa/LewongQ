import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  const GalleryDetailScreen({Key? key, required this.image}) : super(key: key);

  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Center(child: Image.network(image)),
    ));
  }
}
