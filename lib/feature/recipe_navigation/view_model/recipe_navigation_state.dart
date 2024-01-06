// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'recipe_navigation_cubit.dart';

class RecipeNavigationState extends Equatable {
  const RecipeNavigationState(
      {this.time = '00:00', this.timerStatus = false, this.currentStep = '', this.currentIndex = 0});
  final String time;
  final bool timerStatus;
  final String currentStep;
  final int currentIndex;

  @override
  List<Object> get props => [time, timerStatus, currentStep];

  RecipeNavigationState copyWith({
    String? time,
    bool? timerStatus,
    String? currentStep,
    int? currentIndex,
  }) {
    return RecipeNavigationState(
      time: time ?? this.time,
      timerStatus: timerStatus ?? this.timerStatus,
      currentStep: currentStep ?? this.currentStep,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
