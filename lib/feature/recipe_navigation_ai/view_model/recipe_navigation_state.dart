// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'recipe_navigation_cubit.dart';

class RecipeNavigationAiState extends Equatable {
  const RecipeNavigationAiState(
      {this.time = '', this.timerStatus = false, this.currentStep = '', this.currentIndex = 0});
  final String time;
  final bool timerStatus;
  final String currentStep;
  final int currentIndex;

  @override
  List<Object> get props => [time, timerStatus, currentStep];

  RecipeNavigationAiState copyWith({
    String? time,
    bool? timerStatus,
    String? currentStep,
    int? currentIndex,
  }) {
    return RecipeNavigationAiState(
        time: time ?? this.time,
        timerStatus: timerStatus ?? this.timerStatus,
        currentStep: currentStep ?? this.currentStep,
        currentIndex: currentIndex ?? this.currentIndex);
  }
}
