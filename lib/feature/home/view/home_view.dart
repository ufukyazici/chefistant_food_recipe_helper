import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:chefistant_food_recipe_helper/feature/home/service/firebase_service.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view/recipe_navigation_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<RecipeModel>? recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            StreamBuilder(
              stream: FirebaseService().getRecipesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  List recipes = snapshot.data!.docs;
                  List<RecipeModel> recipe = recipes.map((document) => RecipeModel.fromJson(document.data())).toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 140 / 150),
                    itemCount: recipe.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = recipes[index];
                      final documentID = document.id;
                      return Card(
                        child: ListTile(
                          title: Text(recipe[index].recipe?.name ?? ""),
                          subtitle: Text(recipe[index].recipe?.description ?? ""),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RecipeNavigationView(recipeNavigation: recipe[index].recipeNavigation ?? []);
                              },
                            ));
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("No data available");
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
