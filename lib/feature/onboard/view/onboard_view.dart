import 'package:flutter/material.dart';

import 'onboard_page_view.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chefistant'),
        actions: const [Icon(Icons.radar)],
        leading: const Icon(Icons.abc),
      ),
      body: const Column(
        children: [
          Expanded(
              child: OnBoardPageView(
            imagePath: 'assets/images/ic_onboard1.png',
            pageDescription: "asdasdasdasdasdasdas",
          ))
        ],
      ),
    );
  }
}
