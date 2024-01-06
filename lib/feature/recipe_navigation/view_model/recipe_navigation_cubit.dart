import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit() : super(const RecipeNavigationState());
  late int remainingSeconds;
  List<DummyData> items = [
    DummyData(duration: 10, step: "1111111111111"),
    DummyData(duration: 20, step: "2222222222"),
    DummyData(duration: 30, step: "333333333"),
    DummyData(duration: 40, step: "4444444"),
    DummyData(duration: 50, step: "5555555"),
    DummyData(duration: 60, step: "66666666"),
    DummyData(duration: 70, step: "77777777"),
    DummyData(duration: 80, step: "888888888"),
    DummyData(duration: 90, step: "999999"),
    DummyData(duration: 100, step: "1000000000"),
  ];
  void incrementIndexAndStart(int index) async {
    emit(state.copyWith(currentStep: items[index].step, currentIndex: index + 1));
    await startTimer(items[index].duration);
  }

  Future<void> startTimer(int seconds) async {
    remainingSeconds = seconds;
    Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      if (remainingSeconds == 0) {
        emit(state.copyWith(time: "00:00"));
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

class DummyData {
  final int duration;
  final String step;

  DummyData({required this.duration, required this.step});
}
