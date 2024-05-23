import 'package:chefistant_food_recipe_helper/feature/home/view_model/home_cubit.dart';
import 'package:chefistant_food_recipe_helper/feature/home/widget/recipe_home_card_widget.dart';
import 'package:chefistant_food_recipe_helper/feature/recipe_details/view/recipe_details_view.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchRecipes(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: projectAppbar(),
            body: Column(children: [
              // TextField(
              //   onChanged: (value) {
              //     // context.read<HomeCubit>().searchByItems(value);
              //   },
              //   decoration: const InputDecoration(
              //     hintText: "Search",
              //     prefixIcon: Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(Radius.circular(10)),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          context.route.navigateToPage(RecipeDetailsView(documentId: state.recipes[index].id));
                        },
                        child: RecipeHomeCardWidget(
                            imageUrl: state.recipes[index].data.imageUrl ?? "",
                            duration: state.recipes[index].data.duration ?? "",
                            name: state.recipes[index].data.name ?? ""),
                      );
                    }),
              ),
            ]),
          );
        },
      ),
    );
  }
}
