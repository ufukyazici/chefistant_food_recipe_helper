import 'dart:async';

import 'package:flutter/material.dart';

class RecipeNavigationView extends StatefulWidget {
  const RecipeNavigationView({super.key});

  @override
  State<RecipeNavigationView> createState() => _RecipeNavigationViewState();
}

class _RecipeNavigationViewState extends State<RecipeNavigationView> {
  int _counter = 300;
  late Timer _timer;
  void startTimer() {
    _counter = 300;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 0) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_counter"),
            ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: const Text("Start Timer"))
          ],
        ),
      ),
    );
  }
}
