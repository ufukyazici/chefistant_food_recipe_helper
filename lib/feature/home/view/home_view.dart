import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:chefistant_food_recipe_helper/feature/home/service/firebase.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view/recipe_navigation_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<RecipeModel>? recipes;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    recipes = await Firebase().getRecipes();
    setState(() {});
  }

  var text1 = "";
  var text2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: recipes?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(recipes?[index].recipe?.name ?? ""),
                    subtitle: Text(recipes?[index].recipe?.description ?? ""),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return RecipeNavigationView(recipeNavigation: recipes?[index].recipeNavigation ?? []);
                        },
                      ));
                    },
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
