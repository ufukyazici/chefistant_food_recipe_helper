import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/model/recipe_navigation_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view_model/recipe_navigation_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/lotties.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecipeNavigationView extends StatelessWidget {
  const RecipeNavigationView(
      {super.key, required this.recipeNavigation, required this.documentId});
  final RecipeNavigationModel recipeNavigation;
  final String documentId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeNavigationCubit>(
      create: (context) =>
          RecipeNavigationCubit(recipeNavigation: recipeNavigation),
      child: Scaffold(
        appBar: projectAppbar(title: "general.appName".tr()),
        body: const Padding(
          padding: ProjectPadding.largeAll(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RecipeLottieWidget(),
                RecipeStepText(),
                RecipeTimeText(),
                RecipeNavigationButton(),
              ],
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
    return BlocBuilder<RecipeNavigationCubit, RecipeNavigationState>(
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
    return BlocBuilder<RecipeNavigationCubit, RecipeNavigationState>(
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
    return BlocBuilder<RecipeNavigationCubit, RecipeNavigationState>(
      builder: (context, state) {
        return Padding(
          padding: const ProjectPadding.mediumAll(),
          child: Text(
            state.time,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        );
      },
    );
  }
}

class RecipeNavigationButton extends StatelessWidget {
  const RecipeNavigationButton({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeNavigationCubit, RecipeNavigationState>(
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
              // state.timerStatus
              //     ? null
              //     : context.read<RecipeNavigationCubit>().incrementIndexAndStart(state.currentIndex);
              if (state.currentIndex != 0) {
                context.read<RecipeNavigationCubit>().cancelTimer();
              }
              context
                  .read<RecipeNavigationCubit>()
                  .incrementIndexAndStart(state.currentIndex);
            },
          ),
        );
      },
    );
  }
}
