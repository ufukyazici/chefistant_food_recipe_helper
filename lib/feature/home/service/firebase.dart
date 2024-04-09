import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {
  Future<List<RecipeModel>?> getRecipes() async {
    List<RecipeModel> result = await FirebaseFirestore.instance
        .collection('recipes')
        .get()
        .then((snapshot) => snapshot.docs.map((document) => RecipeModel.fromJson(document.data())).toList());
    return result;
  }
}
