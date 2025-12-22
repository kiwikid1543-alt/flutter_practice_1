import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20), //circular(원의 반지름)
      child: Image.network(
        imageUrl, //?
        fit: BoxFit.cover,
      ),
    );
  }
}
