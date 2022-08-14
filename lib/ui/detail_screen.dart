import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskNames = ref.watch(friendtaskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク詳細画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(taskNames[0], style: Theme.of(context).textTheme.headline4),
            Text('・小タスク1', style: Theme.of(context).textTheme.headline5),
            Text('・小タスク2', style: Theme.of(context).textTheme.headline5),
            Text('・小タスク3', style: Theme.of(context).textTheme.headline5),
            Text('2022/12/31まで', style: Theme.of(context).textTheme.subtitle1),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(const GohobiRoute());
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
