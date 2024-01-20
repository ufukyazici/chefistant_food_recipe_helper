import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: projectAppbar(),
      body: const Column(children: [Placeholder()]),
    );
  }
}
