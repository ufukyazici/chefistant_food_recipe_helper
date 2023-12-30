import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';

class OnBoardPageView extends StatelessWidget {
  final String imagePath;
  final String pageDescription;
  const OnBoardPageView({super.key, required this.imagePath, required this.pageDescription});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.smallAll(),
      child: Column(children: [
        Image.asset(imagePath),
        Text(
          pageDescription,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
