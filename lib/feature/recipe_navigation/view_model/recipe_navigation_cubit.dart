import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit() : super(const RecipeNavigationState());
  late int remainingSeconds;
  List<DummyData> items = [
    DummyData(duration: 10, step: "Yumurta ve sütü bir kapta çırpın."),
    DummyData(duration: 20, step: "Un, vanilya, kabartma tozu ve tuzu ekleyip karıştırın."),
    DummyData(duration: 30, step: "Karışımı yağlanmış bir fırın kabına dökün."),
    DummyData(duration: 40, step: "Önceden ısıtılmış 180 derece fırında 30-35 dakika pişirin."),
    DummyData(duration: 50, step: "Fırından çıkarıp soğumaya bırakın.")
  ];

  void incrementIndexAndStart(int index) async {
    if (index < items.length) {
      emit(state.copyWith(currentStep: items[index].step, currentIndex: index + 1, timerStatus: true));
      await startTimer(items[index].duration);
    }
  }

  Future<void> startTimer(int seconds) async {
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

class DummyData {
  final int duration;
  final String step;

  DummyData({required this.duration, required this.step});
}
