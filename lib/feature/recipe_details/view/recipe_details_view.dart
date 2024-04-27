import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view/recipe_navigation_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:flutter/material.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, required this.recipe, required this.ingredients});
  final RecipeModel recipe;
  final List<Ingredients> ingredients;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: ListTile(
                    title: Text(ingredients[index].name ?? ""),
                    subtitle: Text(ingredients[index].amount ?? ""),
                  ));
                },
              ),
              ProjectDefaultButton(
                buttonText: "Start recipe",
                isBackgroundWhite: true,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RecipeNavigationView(recipeNavigation: recipe.recipeNavigation ?? []);
                    },
                  ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
