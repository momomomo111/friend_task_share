import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:friend_task_share/main.dart';
import 'package:friend_task_share/navigation/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyTaskScreen extends HookConsumerWidget {
  const MyTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNames = ref.watch(mytaskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('自分のタスクリスト画面'),
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
                      AutoRouter.of(context).push(const DetailRoute());
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const AddTaskRoute());
                  },
                  child: const Text("タスク追加"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
