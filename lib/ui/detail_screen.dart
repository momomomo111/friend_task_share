import 'package:flutter/material.dart';
import 'package:friend_task_share/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNames = ref.watch(taskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation example'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: taskNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                taskNames[index],
                style: Theme.of(context).textTheme.headline4,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/',
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
