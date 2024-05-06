import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IRecipeService {
  Stream<QuerySnapshot> getRecipesStream();
}

class RecipeService implements IRecipeService {
  final _instance = FirebaseFirestore.instance;
  // Future<List<RecipeModel>?> getRecipes() async {
  //   List<RecipeModel> result = await FirebaseFirestore.instance
  //       .collection('recipes')
  //       .get()
  //       .then((snapshot) => snapshot.docs.map((document) => RecipeModel.fromJson(document.data())).toList());
  //   return result;
  // }

  @override
  Stream<QuerySnapshot> getRecipesStream() {
    return _instance.collection('recipes').snapshots();
  }

  Future<RecipeNavigationModel> getRecipeNavigation(String documentId) async {
    RecipeNavigationModel result = await _instance
        .collection('recipe-navigation')
        .doc(documentId)
        .get()
        .then((snapshot) => RecipeNavigationModel.fromJson(snapshot.data()!));
    print(result);
    return result;
  }
}
