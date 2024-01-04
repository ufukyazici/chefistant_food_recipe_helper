import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit() : super(const RecipeNavigationState());
  late int remainingSeconds;
  List<dummyData> items = [
    dummyData(duration: 10, step: "Step 1"),
    dummyData(duration: 20, step: "Step 2"),
    dummyData(duration: 30, step: "Step 3"),
    dummyData(duration: 40, step: "Step 4"),
    dummyData(duration: 50, step: "Step 5"),
    dummyData(duration: 60, step: "Step 6"),
    dummyData(duration: 70, step: "Step 7"),
    dummyData(duration: 80, step: "Step 8"),
    dummyData(duration: 90, step: "Step 9"),
    dummyData(duration: 100, step: "Step 10"),
  ];
  startRecipeNavigation() {
    for (var i = 0; i < items.length; i++) {
      emit(state.copyWith(
        currentStep: items[i].step,
      ));
      startTimer(items[i].duration);
      Future.delayed(Duration(seconds: items[i].duration));
    }
  }

  startTimer(int seconds) {
    remainingSeconds = seconds;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds == 0) {
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

class dummyData {
  final int duration;
  final String step;

  dummyData({required this.duration, required this.step});
}
