import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_home_model.dart';
import 'package:chefistant_food_recipe_helper/feature/home/service/recipe_service.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_details/view/recipe_details_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            StreamBuilder(
              stream: RecipeService().getRecipesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  List recipes = snapshot.data!.docs;
                  List<RecipeHomeModel> recipe =
                      recipes.map((document) => RecipeHomeModel.fromJson(document.data())).toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 140 / 150),
                    itemCount: recipe.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = recipes[index];
                      final documentId = document.id;
                      return Card(
                        child: ListTile(
                          title: Text(recipe[index].name ?? ""),
                          subtitle: Text(recipe[index].description ?? ""),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RecipeDetailsView(documentId: documentId);
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
