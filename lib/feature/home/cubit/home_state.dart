// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState(this.recipes);
  final List<BaseFirebaseModel<RecipeHomeModel>> recipes;

  @override
  List<Object> get props => [recipes];

  HomeState copyWith({
    List<BaseFirebaseModel<RecipeHomeModel>>? recipes,
  }) {
    return HomeState(
      recipes ?? this.recipes,
    );
  }
}
