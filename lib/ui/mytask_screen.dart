import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';
import '../util/date_util.dart';

class MyTaskScreen extends HookConsumerWidget {
  const MyTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myTaskNames = ref.watch(mytaskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('自分のタスクリスト画面'),
      ),
      body: Center(
        child: myTaskNames.when(
            data: (taskNames) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () => ref
                            .read(mytaskNameProvider.notifier)
                            .fetchTaskList(),
                        child: ListView.builder(
                          itemCount: taskNames.length,
                          itemBuilder: (BuildContext context, int index) {
                            final deadline = DateUtil.formatDeadline(
                                taskNames[index].deadline);
                            return ListTile(
                              title: Text(taskNames[index].taskName),
                              subtitle: Text(deadline),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  for (var i = 0;
                                      i <
                                              taskNames[index]
                                                  .gohobiListId
                                                  .length &&
                                          i < 3;
                                      i++)
                                    const Icon(
                                      Icons.account_circle,
                                      size: 60,
                                    ),
                                ],
                              ),
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(DetailRoute(task: taskNames[index]));
                              },
                            );
                          },
                        ),
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
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
