import 'package:flutter/material.dart';
import 'package:friend_task_share/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyTaskScreen extends HookConsumerWidget {
  const MyTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNames = ref.watch(mytaskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: taskNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(taskNames[index]),
                    subtitle: const Text("2022/12/31まで"),
                    onTap: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
