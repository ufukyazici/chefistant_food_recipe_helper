// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({this.recipes = const []});

  final List<RecipeModel> recipes;
  @override
  List<Object> get props => [recipes];

  HomeState copyWith({
    List<RecipeModel>? recipes,
  }) {
    return HomeState(
      recipes: recipes ?? this.recipes,
    );
  }
}
