import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view_model/recipe_navigation_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/lotties.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/button/project_default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class RecipeNavigationView extends StatelessWidget {
  const RecipeNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipeNavigationCubit>(
      create: (context) => RecipeNavigationCubit(),
      child: Scaffold(
        appBar: projectAppbar(title: "general.appName".tr()),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<RecipeNavigationCubit, RecipeNavigationState>(
                builder: (context, state) {
                  return AnimatedContainer(
                      height: state.timerStatus ? 400 : 0,
                      duration: const Duration(seconds: 1),
                      child: Lottie.asset(LottieFiles.lottie_timer.lottiePath));
                },
              ),
              const RecipeStepText(),
              const RecipeTimeText(),
              const RecipeNavigationButton(),
            ],
          ),
        ),
      ),
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
        return Stack(children: [
          Container(
            color: Colors.red,
            height: state.timerStatus ? 100 : 0,
            width: state.timerStatus ? 100 : 0,
          ),
          Positioned(
            left: 5,
            top: 30,
            bottom: 5,
            right: 5,
            child: Text(
              state.time,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),
            ),
          ),
        ]);
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
          height: state.timerStatus ? 0 : 35,
          child: ProjectDefaultButton(
            buttonText: state.currentIndex == 0 ? "Tarife Başla" : "Sonraki Adım",
            isBackgroundWhite: true,
            onPressed: () {
              state.timerStatus
                  ? null
                  : context.read<RecipeNavigationCubit>().incrementIndexAndStart(state.currentIndex);
            },
          ),
        );
      },
    );
  }
}
