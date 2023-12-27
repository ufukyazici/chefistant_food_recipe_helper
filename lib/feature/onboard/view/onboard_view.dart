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
      appBar: AppBar(
        title: const Text('Chefistant'),
        actions: const [Icon(Icons.radar)],
        leading: const Icon(Icons.abc),
      ),
      body: Center(
        child: Column(
          children: [const Text('onBoard.title').tr(), ElevatedButton(onPressed: () {}, child: const Text("Başlat"))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("+"),
      ),
    );
  }
}
