import 'package:flutter/material.dart';
import 'package:friend_task_share/provider/task_name_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod counter example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                ref.read(taskNameProvider.notifier).set(value);
              },
            ),
            ElevatedButton(
              onPressed: () {
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
