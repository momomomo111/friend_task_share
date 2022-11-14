import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class GohobiScreen extends HookConsumerWidget {
  const GohobiScreen({Key? key, required this.taskId}) : super(key: key);
  final String taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gohobiMessageController = useTextEditingController();
    final focusNode = useFocusNode();
    final myUserProvider = ref.watch(userDataProvider);

    focusNode.addListener(() async {
      if (!focusNode.hasFocus && gohobiMessageController.text.isNotEmpty) {
        ref
            .read(submitGohobiProvider.notifier)
            .createGohobi(myUserProvider.uid, gohobiMessageController.text);
        await ref.read(submitGohobiProvider.notifier).submitGohobi(taskId);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('ごほうびメッセージ入力画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('ごほうびメッセージの入力', style: Theme.of(context).textTheme.headline5),
            TextField(
              controller: gohobiMessageController,
              focusNode: focusNode,
            ),
            ElevatedButton(
              onPressed: () => focusNode.unfocus(),
              child: const Text('入力完了'),
            ),
          ],
        ),
      ),
    );
  }
}
