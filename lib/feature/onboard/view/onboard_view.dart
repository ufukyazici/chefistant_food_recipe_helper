import 'package:chefistant_food_recipe_helper/feature/onboard/view/onboard_page_view.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/images.dart';
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
      backgroundColor: Colors.red,
      appBar: projectAppbar(title: 'general.appName'.tr()),
      body: Column(
        children: [
          Expanded(
              child: OnBoardPageView(
                  imagePath: Images.ic_onboard_1.imagePath, pageDescription: 'onBoard.description1'.tr()))
        ],
      ),
    );
  }
}
