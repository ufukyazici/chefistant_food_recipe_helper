import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view/recipe_navigation_view.dart';
import 'package:chefistant_food_recipe_helper/product/service/product_service.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class RecipeDetailsView extends StatelessWidget {
  RecipeDetailsView({super.key, required this.documentId});
  final String documentId;
  final IProductService _service = ProductService();
  late final RecipeNavigationModel? recipeNavigation;
  getRecipeNavigation(String documentId) async {
    recipeNavigation = await _service.getRecipeNavigation(documentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: ingredients.length,
              //   itemBuilder: (context, index) {
              //     return Card(
              //         child: ListTile(
              //       title: Text(ingredients[index].name ?? ""),
              //       subtitle: Text(ingredients[index].amount ?? ""),
              //     ));
              //   },
              // ),
              ProjectDefaultButton(
                  buttonText: "Start recipe",
                  isBackgroundWhite: true,
                  onPressed: () async {
                    await getRecipeNavigation(documentId);
                    if (!context.mounted) return;
                    if (recipeNavigation != null) {
                      context.route.navigateToPage(
                          RecipeNavigationView(recipeNavigation: recipeNavigation!, documentId: documentId));
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
