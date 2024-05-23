import 'package:bloc/bloc.dart';
import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_home_model.dart';
import 'package:chefistant_food_recipe_helper/product/service/product_service.dart';
import 'package:chefistant_food_recipe_helper/product/utility/firebase/firebase_base_model.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState([]));
  final IProductService _service = ProductService();
  Future<void> fetchRecipes() async {
    final recipes = await _service.getRecipes();
    emit(state.copyWith(recipes: recipes));
  }

  // void searchByItems(String value) {
  //   final result = state.recipes.where((element) => element!.name!.toLowerCase().contains(value)).toList();
  //   emit(state.copyWith(recipes: result as List<RecipeHomeModel>));
  // }
}
