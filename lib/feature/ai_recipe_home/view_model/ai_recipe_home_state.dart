// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ai_recipe_home_cubit.dart';

class AiRecipeHomeState extends Equatable {
  const AiRecipeHomeState({required this.isLoading});
  final bool isLoading;

  @override
  List<Object> get props => [isLoading];

  AiRecipeHomeState copyWith({
    bool? isLoading,
  }) {
    return AiRecipeHomeState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
