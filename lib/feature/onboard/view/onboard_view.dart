import 'package:chefistant_food_recipe_helper/feature/onboard/view/onboard_page_view.dart';
import 'package:chefistant_food_recipe_helper/feature/onboard/view_model/on_board_cubit.dart';
import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/images.dart';
import 'package:chefistant_food_recipe_helper/product/widget/appbar/project_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late PageController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardCubit>(
      create: (context) => OnBoardCubit(),
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: projectAppbar(title: 'general.appName'.tr()),
        body: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: _scrollController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return OnBoardPageView(
                    imagePath: Images.ic_onboard_1.imagePath, pageDescription: 'onBoard.description${index + 1}'.tr());
              },
            )),
            BlocBuilder<OnBoardCubit, OnBoardState>(
              builder: (context, state) {
                return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () {
                      _scrollController.nextPage(duration: const Duration(seconds: 1), curve: Curves.linear);
                      context.read<OnBoardCubit>().incrementPageIndex();
                    },
                    child: BlocListener<OnBoardCubit, OnBoardState>(
                      listener: (context, state) {
                        state.isLastIndex;
                      },
                      child: Text(
                        state.isLastIndex ? 'START' : 'NEXT',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
