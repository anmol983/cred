// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imageUrl;
  double width = 80;
  double height = 80;
  ImageContainer(
      {required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(imageUrl),
    );
  }
}
