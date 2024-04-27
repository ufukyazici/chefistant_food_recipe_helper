import 'package:bloc/bloc.dart';
import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:chefistant_food_recipe_helper/feature/home/service/firebase_service.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  final recipes = FirebaseService().getRecipesStream();
}
