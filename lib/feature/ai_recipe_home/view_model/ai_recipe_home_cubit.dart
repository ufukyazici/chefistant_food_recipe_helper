import 'package:bloc/bloc.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/product/service/gemini_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'ai_recipe_home_state.dart';

class AiRecipeHomeCubit extends Cubit<AiRecipeHomeState> {
  AiRecipeHomeCubit() : super(const AiRecipeHomeState(isLoading: false));
  final apiKey = dotenv.env['API_KEY'] ?? '';
  late RecipeNavigationModel? recipeNavigation;
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> generateRecipe(String promptText) async {
    changeLoading();
    recipeNavigation = await GeminiService().sendMessage(promptText: promptText, apiKey: apiKey);
    changeLoading();
  }
}
