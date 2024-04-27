import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // Future<List<RecipeModel>?> getRecipes() async {
  //   List<RecipeModel> result = await FirebaseFirestore.instance
  //       .collection('recipes')
  //       .get()
  //       .then((snapshot) => snapshot.docs.map((document) => RecipeModel.fromJson(document.data())).toList());
  //   return result;
  // }

  Stream<QuerySnapshot> getRecipesStream() {
    return FirebaseFirestore.instance.collection('recipes').snapshots();
  }
}
