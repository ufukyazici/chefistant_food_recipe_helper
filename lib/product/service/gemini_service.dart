// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/gemini_recipe_text.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  Future<RecipeNavigationModel> sendMessage({required String apiKey, required promptText}) async {
    final textModel = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
    GenerateContentResponse response;
    try {
      response = await textModel
          .generateContent([Content.text(GeminiRectipeText(recipeName: promptText).recipeWithNavigationText)]);
      final responseJson = jsonDecode(response.text ?? "");
      return RecipeNavigationModel.fromJson(responseJson);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  RecipeNavigationModel? responseToModel(String response) {
    try {
      final responseJson = jsonDecode(response);
      return RecipeNavigationModel.fromJson(responseJson);
    } catch (e) {
      return null;
    }
  }
}
