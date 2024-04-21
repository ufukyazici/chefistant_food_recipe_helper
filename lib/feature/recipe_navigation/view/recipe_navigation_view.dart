import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_model.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view_model/recipe_navigation_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/lotties.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecipeNavigationView extends StatelessWidget {
  const RecipeNavigationView({super.key, required this.recipeNavigation});
  final List<RecipeNavigation> recipeNavigation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeNavigationCubit>(
      create: (context) => RecipeNavigationCubit(items: recipeNavigation),
      child: Scaffold(
        appBar: projectAppbar(title: "general.appName".tr()),
        body: const Center(
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
        return Text(state.time);
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
            buttonText:
                state.currentIndex == 0 ? "recipeNavigation.startRecipe".tr() : "recipeNavigation.nextStep".tr(),
            isBackgroundWhite: true,
            onPressed: () {
              // state.timerStatus
              //     ? null
              //     : context.read<RecipeNavigationCubit>().incrementIndexAndStart(state.currentIndex);
              context.read<RecipeNavigationCubit>().incrementIndexAndStart(state.currentIndex);
            },
          ),
        );
      },
    );
  }
}
