// import 'package:chefistant_food_recipe_helper/feature/home/model/recipe_home_model.dart';
// import 'package:chefistant_food_recipe_helper/feature/recipe_navigation/view/recipe_navigation_view.dart';
// import 'package:flutter/material.dart';

// class MultipleRecipeNavigationView extends StatelessWidget {
//   MultipleRecipeNavigationView(
//       {super.key, required this.recipeNavigation0, required this.recipeNavigation1, required this.recipeNavigation2});
//   final List<RecipeNavigation> recipeNavigation0;
//   final List<RecipeNavigation> recipeNavigation1;
//   final List<RecipeNavigation> recipeNavigation2;

//   final _pageController = PageController(viewportFraction: 1.0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: PageView(
//         controller: _pageController,
//         children: [
//           RecipeNavigationView(recipeNavigation: recipeNavigation0),
//           RecipeNavigationView(recipeNavigation: recipeNavigation1),
//           RecipeNavigationView(recipeNavigation: recipeNavigation2),
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               _pageController.previousPage(duration: const Duration(seconds: 1), curve: Curves.slowMiddle);
//             },
//             child: const Icon(Icons.chevron_left_outlined),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.slowMiddle);
//             },
//             child: const Icon(Icons.chevron_right_outlined),
//           ),
//         ],
//       ),
//     );
//   }
// }
