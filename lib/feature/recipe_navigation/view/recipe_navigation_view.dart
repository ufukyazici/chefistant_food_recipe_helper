import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view_model/recipe_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeNavigationView extends StatefulWidget {
  const RecipeNavigationView({super.key});

  @override
  State<RecipeNavigationView> createState() => _RecipeNavigationViewState();
}

class _RecipeNavigationViewState extends State<RecipeNavigationView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeNavigationCubit>(
      create: (context) => RecipeNavigationCubit(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<RecipeNavigationCubit, RecipeNavigationState, String>(
                selector: (state) {
                  return state.currentStep;
                },
                builder: (context, state) {
                  return Text(state);
                },
              ),
              BlocSelector<RecipeNavigationCubit, RecipeNavigationState, String>(
                selector: (state) {
                  return state.time;
                },
                builder: (context, state) {
                  return InkWell(
                    child: Text(state),
                    onTap: () {
                      context.read<RecipeNavigationCubit>().incrementIndexAndStart();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
