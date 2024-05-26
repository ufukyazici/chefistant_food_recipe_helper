import 'package:chefistant_food_recipe_helper/feature/ai_recipe_home/view_model/ai_recipe_home_cubit.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation_ai/view/recipe_navigation_ai.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class AiRecipeHomeView extends StatelessWidget {
  AiRecipeHomeView({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AiRecipeHomeCubit>(
      create: (context) => AiRecipeHomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AI Recipe Home'),
        ),
        body: Padding(
          padding: const ProjectPadding.largeAll(),
          child: BlocSelector<AiRecipeHomeCubit, AiRecipeHomeState, bool>(
            selector: (state) {
              return state.isLoading;
            },
            builder: (context, state) {
              return state
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Enter your prompt here',
                          ),
                        ),
                        ProjectDefaultButton(
                          buttonText: "Generate Recipe",
                          isBackgroundWhite: true,
                          onPressed: () async {
                            if (_controller.text.isNotEmpty) {
                              await context.read<AiRecipeHomeCubit>().generateRecipe(_controller.text);
                              if (!context.mounted) return;
                              if (context.read<AiRecipeHomeCubit>().recipeNavigation != null) {
                                context.route.navigateToPage(RecipeNavigationAiView(
                                    recipeNavigation: context.read<AiRecipeHomeCubit>().recipeNavigation!));
                              }
                            }
                          },
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
