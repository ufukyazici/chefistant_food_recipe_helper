import 'package:chefistant_food_recipe_helper/feature/onboard/view/onboard_page_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(title: 'general.appName'.tr()),
      body: const Column(
        children: [
          Expanded(
              child: Expanded(
                  child: OnBoardPageView(
                      imagePath: "assets/images/ic_onboard1.png", pageDescription: "asdasdasdasdadadasd")))
        ],
      ),
    );
  }
}
