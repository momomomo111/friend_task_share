import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:friend_task_share/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskScreen extends HookConsumerWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNameController = ref.watch(taskNameControllerStateProvider);
    final smallTaskNameController1 =
        ref.watch(smallTaskNameController1StateProvider);
    final smallTaskNameController2 =
        ref.watch(smallTaskNameController2StateProvider);
    final smallTaskNameController3 =
        ref.watch(smallTaskNameController3StateProvider);
    final submitProvider = ref.read(submitTaskProvider.notifier);
    final submitWatchProvider = ref.watch(submitTaskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク入力画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('タスク名の入力', style: Theme.of(context).textTheme.headline4),
            TextField(
              controller: taskNameController,
            ),
            Text('小タスク名の入力', style: Theme.of(context).textTheme.headline4),
            TextField(
              controller: smallTaskNameController1,
            ),
            TextField(
              controller: smallTaskNameController2,
            ),
            TextField(
              controller: smallTaskNameController3,
            ),
            ElevatedButton(
              onPressed: () {
                _inputDeadlineController(context,
                    (deadline) => {submitProvider.setDeadline(deadline)});
              },
              child: const Text('締切を入力してください'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("以下の内容で保存しますか？"),
                      content: Text(taskNameController.text),
                      actions: [
                        OutlinedButton(
                          child: const Text("キャンセル"),
                          onPressed: () => AutoRouter.of(context).pop(),
                        ),
                        OutlinedButton(
                          child: const Text("OK"),
                          onPressed: () {
                            submitProvider.submitTask();
                            AutoRouter.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('入力完了'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _inputDeadlineController(
    BuildContext context, Function submit) async {
  final DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 365)),
    lastDate: DateTime.now().add(const Duration(days: 365)),
  );
  submit(date ?? DateTime.now());
}
