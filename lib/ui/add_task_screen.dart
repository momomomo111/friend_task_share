import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク入力画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('タスクの入力', style: Theme.of(context).textTheme.headline4),
            TextField(
              controller: TextEditingController(),
              onSubmitted: (text) {},
            ),
            TextField(
              controller: TextEditingController(),
              onSubmitted: (text) {},
            ),
            TextField(
              controller: TextEditingController(),
              onSubmitted: (text) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/mytask');
              },
              child: const Text('入力完了'),
            ),
          ],
        ),
      ),
    );
  }
}
