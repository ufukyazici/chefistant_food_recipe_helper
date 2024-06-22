import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation_ai/view_model/recipe_navigation_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/lotties.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecipeNavigationAiView extends StatelessWidget {
  const RecipeNavigationAiView({super.key, required this.recipeNavigation});
  final RecipeNavigationModel recipeNavigation;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeNavigationAiCubit>(
      create: (context) => RecipeNavigationAiCubit(recipeNavigation),
      child: Scaffold(
        appBar: projectAppbar(title: "general.appName".tr()),
        body: SingleChildScrollView(
          child: Padding(
            padding: const ProjectPadding.largeAll(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: BlocBuilder<RecipeNavigationAiCubit,
                        RecipeNavigationAiState>(
                      builder: (context, state) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: recipeNavigation.steps?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const ProjectPadding.smallAll(),
                                child: ListTile(
                                  title: Text(
                                      recipeNavigation.steps?[index].step ??
                                          ''),
                                  subtitle: Text(recipeNavigation
                                          .steps?[index].duration
                                          .toString() ??
                                      ""),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  const RecipeLottieWidget(),
                  const RecipeStepText(),
                  const RecipeTimeText(),
                  const RecipeNavigationButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeLottieWidget extends StatelessWidget {
  const RecipeLottieWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeNavigationAiCubit, RecipeNavigationAiState>(
      builder: (context, state) {
        return AnimatedContainer(
            height: state.timerStatus ? 400 : 0,
            duration: const Duration(seconds: 1),
            child: Lottie.asset(LottieFiles.lottie_timer.lottiePath));
      },
    );
  }
}

class RecipeStepText extends StatelessWidget {
  const RecipeStepText({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeNavigationAiCubit, RecipeNavigationAiState>(
      builder: (context, state) {
        return Text(state.currentStep);
      },
    );
  }
}

class RecipeTimeText extends StatelessWidget {
  const RecipeTimeText({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeNavigationAiCubit, RecipeNavigationAiState>(
      builder: (context, state) {
        return Text(state.time);
      },
    );
  }
}

class RecipeNavigationButton extends StatelessWidget {
  const RecipeNavigationButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeNavigationAiCubit, RecipeNavigationAiState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: state.timerStatus ? 35 : 35,
          child: ProjectDefaultButton(
              buttonText: state.currentIndex == 0
                  ? "recipeNavigation.startRecipe".tr()
                  : "recipeNavigation.nextStep".tr(),
              isBackgroundWhite: true,
              onPressed: () {
                if (state.currentIndex != 0) {
                  context.read<RecipeNavigationAiCubit>().cancelTimer();
                }
                context
                    .read<RecipeNavigationAiCubit>()
                    .incrementIndexAndStart(state.currentIndex);
              }),
        );
      },
    );
  }
}
