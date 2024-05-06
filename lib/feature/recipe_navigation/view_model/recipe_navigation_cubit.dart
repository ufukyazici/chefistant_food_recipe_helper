import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit({required this.recipeNavigation}) : super(const RecipeNavigationState());
  late int remainingSeconds;
  final RecipeNavigationModel recipeNavigation;
  // Future<void> fetchRecipeNavigation(documentId) async {
  //   items = await RecipeService().getRecipeNavigation(documentId);
  // }

  void incrementIndexAndStart(int index) async {
    if (index < recipeNavigation.steps!.length) {
      emit(
          state.copyWith(currentStep: recipeNavigation.steps?[index].step, currentIndex: index + 1, timerStatus: true));
      await startTimer(recipeNavigation.steps?[index].duration ?? 0);
    }
  }

  Future<void> startTimer(int seconds, {bool verification = false}) async {
    remainingSeconds = seconds;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      if (remainingSeconds == 0) {
        emit(state.copyWith(time: "00:00", timerStatus: false));
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = remainingSeconds % 60;
        emit(state.copyWith(
            time: "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}", timerStatus: true));
        remainingSeconds--;
      }
    });
  }
}
