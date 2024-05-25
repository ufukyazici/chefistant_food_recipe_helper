import 'package:chefistant_food_recipe_helper/feature/recipe_navigation_ai/view/recipe_navigation_ai.dart';
import 'package:chefistant_food_recipe_helper/product/service/gemini_service.dart';
import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kartal/kartal.dart';

class AiRecipeHomeView extends StatefulWidget {
  const AiRecipeHomeView({super.key});

  @override
  State<AiRecipeHomeView> createState() => _AiRecipeHomeViewState();
}

class _AiRecipeHomeViewState extends State<AiRecipeHomeView> {
  final TextEditingController _controller = TextEditingController();
  final apiKey = dotenv.env['API_KEY'] ?? '';
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Recipe Home'),
      ),
      body: Padding(
        padding: const ProjectPadding.largeAll(),
        child: isLoading
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
                  ElevatedButton(
                    onPressed: () async {
                      changeLoading();
                      final response = await GeminiService().sendMessage(promptText: _controller.text, apiKey: apiKey);
                      changeLoading();
                      if (!context.mounted) return;
                      context.route.navigateToPage(RecipeNavigationAiView(recipeNavigation: response));
                    },
                    child: const Text('Generate Recipe'),
                  ),
                ],
              ),
      ),
    );
  }
}
