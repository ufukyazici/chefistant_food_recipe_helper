import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_home_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/product/utility/firebase/firebase_base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'product_service_path.dart';

abstract class IProductService {
  Stream<QuerySnapshot> getRecipes();
  Future<RecipeNavigationModel?> getRecipeNavigation(String documentId);
  // Future<RecipeDetailsModel> getRecipeDetails(String documentId);
  Future<List<BaseFirebaseModel<RecipeHomeModel>>> getRecipesv2();
}

class ProductService implements IProductService {
  final _instance = FirebaseFirestore.instance;
  // Future<List<RecipeModel>?> getRecipes() async {
  //   List<RecipeModel> result = await FirebaseFirestore.instance
  //       .collection('recipes')
  //       .get()
  //       .then((snapshot) => snapshot.docs.map((document) => RecipeModel.fromJson(document.data())).toList());
  //   return result;
  // }

  @override
  Stream<QuerySnapshot> getRecipes() {
    return _instance.collection(ProductServicePath.recipes.value).snapshots();
  }

  @override
  Future<RecipeNavigationModel?> getRecipeNavigation(String documentId) async {
    RecipeNavigationModel? result;
    try {
      result = await _instance
          .collection(ProductServicePath.recipeNavigation.value)
          .doc(documentId)
          .get()
          .then((snapshot) => RecipeNavigationModel.fromJson(snapshot.data()!));
      return result;
    } catch (e) {
      return result;
    }
  }

  @override
  Future<List<BaseFirebaseModel<RecipeHomeModel>>> getRecipesv2() async {
    final items = await _instance.collection(ProductServicePath.recipes.value).withConverter(
      fromFirestore: (snapshot, options) {
        if (snapshot.data()?.isEmpty ?? true) return null;
        return BaseFirebaseModel(id: snapshot.id, data: RecipeHomeModel.fromJson(snapshot.data()!));
      },
      toFirestore: (value, options) {
        throw Exception("-");
      },
    ).get();
    final recipes = items.docs
        .map((e) => e.data())
        .where((element) => element != null)
        .cast<BaseFirebaseModel<RecipeHomeModel>>()
        .toList();
    return recipes;
  }

  // @override
  // Future<RecipeDetailsModel> getRecipeDetails(String documentId) async {
  //   RecipeDetailsModel result = await _instance
  //       .collection("recipe-details")
  //       .doc(documentId)
  //       .get()
  //       .then((snapshot) => RecipeDetailsModel.fromJson(snapshot.data()!));
  //   return result;
  // }
}
