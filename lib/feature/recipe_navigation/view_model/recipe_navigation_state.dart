// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recipe_navigation_cubit.dart';

class RecipeNavigationState extends Equatable {
  const RecipeNavigationState({this.time = '00:00', this.timerStatus = false});
  final String time;
  final bool timerStatus;

  @override
  List<Object> get props => [time];

  RecipeNavigationState copyWith({
    String? time,
    bool? timerStatus,
  }) {
    return RecipeNavigationState(
      time: time ?? this.time,
      timerStatus: timerStatus ?? this.timerStatus,
    );
  }
}
