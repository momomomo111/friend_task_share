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
            const SizedBox(height: 40),
            Text(taskNames[0], style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20),
            Text('2022/12/31まで', style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('・小タスクn',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('ごほうびをもらった友達', style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('ユーザ名1', style: Theme.of(context).textTheme.headline5),
                Text('ユーザ名2', style: Theme.of(context).textTheme.headline5),
                Text('ユーザ名3', style: Theme.of(context).textTheme.headline5),
              ],
            ),
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
