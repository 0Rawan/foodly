import 'package:dofd_user_panel/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';

class ImageCard extends StatelessWidget {
  final String text;
  String image;

  ImageCard({
    Key? key,
    required this.text,
    this.image = AppConstants.DEFAULT_IMAGE,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(Dimensions.radius20), // Adjust the value to control the roundness
      ),
      elevation: 4, // Add elevation for a shadow effect
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              image, // Replace with your image URL
              fit: BoxFit.cover, // Image will cover the entire card, maintaining aspect ratio
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigText(text: text,)
          ),
        ],
      ),
    );
  }
}
