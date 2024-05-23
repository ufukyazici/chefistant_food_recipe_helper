import 'package:chefistant_food_recipe_helper/feature/home/cubit/home_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            body: Column(mainAxisSize: MainAxisSize.min, children: [
              TextField(
                onChanged: (value) {
                  // context.read<HomeCubit>().searchByItems(value);
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.22,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Card(
                            child: Padding(
                              padding: const ProjectPadding.smallAll(),
                              child: Column(
                                children: [
                                  ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                                      child: Image.network(
                                        state.recipes[index].data.imageUrl ?? "",
                                        fit: BoxFit.fill,
                                        height: MediaQuery.of(context).size.height * 0.15,
                                      )),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(state.recipes[index].data.name ?? "", textAlign: TextAlign.start)),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(state.recipes[index].data.duration.toString())),
                                ],
                                // ListTile(
                                //   leading: ClipRRect(
                                //       borderRadius: const BorderRadius.all(Radius.circular(10)),
                                //       child: Image.network(state.recipes[index].data.imageUrl ?? "", fit: BoxFit.fill)),
                                //   title: Text(state.recipes[index].data.name ?? ""),
                                //   subtitle: Text(state.recipes[index].data.duration.toString()),
                                // ),
                              ),
                            ),
                          ));
                    }),
              ),
            ]),
          );
        },
      ),
    );
  }
}
