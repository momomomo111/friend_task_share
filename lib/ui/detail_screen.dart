import 'package:flutter/material.dart';
import 'package:friend_task_share/provider/task_name_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskName = ref.watch(taskNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation example'),
      ),
      body: Center(
        child: Text(
          taskName,
          style: Theme.of(context).textTheme.headline4,
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
