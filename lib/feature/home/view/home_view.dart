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
  final IRecipeService _service = RecipeService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            StreamBuilder(
              stream: _service.getRecipes(),
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
                        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 140 / 160),
                    itemCount: recipe.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = recipes[index];
                      final documentId = document.id;
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return RecipeDetailsView(documentId: documentId);
                            },
                          ));
                        },
                        child: Card(
                          child: Column(
                            children: [
                              Image.network(recipe[index].imageUrl ?? "", fit: BoxFit.fill),
                              Text(recipe[index].name ?? ""),
                              Text(recipe[index].duration.toString()),
                            ],
                          ),
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
