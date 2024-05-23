import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';

final class RecipeHomeCardWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String duration;

  const RecipeHomeCardWidget({super.key, required this.imageUrl, required this.name, required this.duration});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.23,
        width: MediaQuery.of(context).size.width * 0.55,
        child: Card(
          child: Padding(
            padding: const ProjectPadding.smallAll(),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.of(context).size.height * 0.14,
                      width: MediaQuery.of(context).size.width * 0.65,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Align(alignment: Alignment.centerLeft, child: Text(name, textAlign: TextAlign.start)),
                ),
                Align(alignment: Alignment.centerLeft, child: Text(duration)),
              ],
            ),
          ),
        ));
  }
}
