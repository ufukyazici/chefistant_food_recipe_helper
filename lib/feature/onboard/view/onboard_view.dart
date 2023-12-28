import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});
  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  bool isChecked = false;
  void changeChecked() {
    setState(() {
      isChecked = !isChecked;
    });
  }

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
          children: [
            const Text('onBoard.title').tr(),
            ElevatedButton(onPressed: () {}, child: const Text("Başlat")),
            const SizedBox(
              height: 200,
              width: 200,
              child: Card(
                  child: ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Title'),
                subtitle: Text('Subtitle'),
                trailing: Icon(Icons.ac_unit),
              )),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (value) {
                changeChecked();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.radar),
      ),
    );
  }
}
