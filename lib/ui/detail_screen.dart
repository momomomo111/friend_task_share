import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../domain/task.dart';
import '../navigation/app_router.gr.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateFormat outputFormat = DateFormat('yyyy/MM/dd HH:mm');
    String deadline = outputFormat.format(task.deadline);
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク詳細画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(height: 40),
            Text(task.taskName, style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text('$deadline まで', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: task.smallTaskName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(task.smallTaskName[index],
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('ごほうびをもらった友達', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                scrollDirection: Axis.horizontal,
                itemCount: task.gohobiListId.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(task.gohobiListId[index],
                        style: Theme.of(context).textTheme.headline5),
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
                    AutoRouter.of(context).push(GohobiRoute(taskId: task.uid));
                  },
                  child: const Text('ごほうびをあげる'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
