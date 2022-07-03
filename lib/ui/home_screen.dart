import 'package:flutter/material.dart';
import 'package:friend_task_share/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var taskFieldController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(controller: taskFieldController),
            ElevatedButton(
              onPressed: () {
                ref.read(taskNameProvider).add(taskFieldController.text);
                Navigator.pushNamed(
                  context,
                  '/detail',
                );
              },
              child: const Text('Navigate to detail screen'),
            ),
          ],
        ),
      ),
    );
  }
}
