import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit() : super(const RecipeNavigationState());
  late int remainingSeconds;
  List<dummyData> items = [
    dummyData(duration: 10, step: "1111111111111"),
    dummyData(duration: 20, step: "2222222222"),
    dummyData(duration: 30, step: "333333333"),
    dummyData(duration: 40, step: "4444444"),
    dummyData(duration: 50, step: "5555555"),
    dummyData(duration: 60, step: "66666666"),
    dummyData(duration: 70, step: "77777777"),
    dummyData(duration: 80, step: "888888888"),
    dummyData(duration: 90, step: "999999"),
    dummyData(duration: 100, step: "1000000000"),
  ];
  void incrementIndexAndStart(int index) async {}

  void startRecipe(int index) async {
    for (var i = 0; i < items.length; i++) {
      emit(state.copyWith(currentStep: items[i].step));
      startTimer(items[index].duration);
    }
    // emit(state.copyWith(currentStep: items[index].step));
    // await startTimer(items[index].duration);
    // startRecipe(index + 1);
  }

  void startTimer(int seconds) {
    state.copyWith(timerStatus: true);
    remainingSeconds = seconds;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        state.copyWith(timerStatus: false);
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
