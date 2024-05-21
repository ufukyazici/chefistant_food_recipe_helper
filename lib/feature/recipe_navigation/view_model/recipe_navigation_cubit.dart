import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:alarm/model/alarm_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:equatable/equatable.dart';

part 'recipe_navigation_state.dart';

class RecipeNavigationCubit extends Cubit<RecipeNavigationState> {
  RecipeNavigationCubit({required this.recipeNavigation}) : super(const RecipeNavigationState());
  late int remainingSeconds;
  final RecipeNavigationModel recipeNavigation;
  Timer? _timer;
  final alarmSettings = AlarmSettings(
      id: 1,
      assetAudioPath: 'assets/audio/alarm.wav',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      notificationTitle: 'This is the title',
      notificationBody: 'This is the body',
      dateTime: DateTime.now());

  @override
  Future<void> close() {
    _timer?.cancel();
    Alarm.stopAll();
    return super.close();
  }

  //Returns the timer info as string
  String calculateTimer(int duration) {
    int minutes = duration ~/ 60;
    int seconds = duration % 60;
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }

  //
  void incrementIndexAndStart(int index) {
    cancelAlarm(1);
    if (index < recipeNavigation.steps!.length) {
      emit(state.copyWith(
          currentStep: recipeNavigation.steps?[index].step,
          currentIndex: index + 1,
          timerStatus: true,
          time: calculateTimer(recipeNavigation.steps?[index].duration ?? 0)));
      startTimer(recipeNavigation.steps?[index].duration ?? 0);
    }
  }

  void startTimer(int seconds) {
    remainingSeconds = seconds;
    triggerAlarm(seconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingSeconds == 0) {
        emit(state.copyWith(time: "00:00", timerStatus: false));
        cancelTimer();
      } else {
        emit(state.copyWith(time: calculateTimer(remainingSeconds), timerStatus: true));
        remainingSeconds--;
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
    emit(state.copyWith(timerStatus: false));
  }

  Future<void> triggerAlarm(int seconds) async {
    await Alarm.set(
        alarmSettings: alarmSettings.copyWith(dateTime: DateTime.now().add(Duration(seconds: (seconds + 3)))));
  }

  void cancelAlarm(int id) {
    Alarm.stop(id);
  }
}
