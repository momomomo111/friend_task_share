import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class AddGohobiScreen extends HookConsumerWidget {
  const AddGohobiScreen({Key? key, required this.taskId}) : super(key: key);
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
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextFormField(
                controller: gohobiMessageController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ごほうびメッセージを入力してください",
                  labelText: "ごほうびメッセージ",
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ごほうびメッセージが入力されていません';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                focusNode.unfocus();
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('ごほうびメッセージを\n送信しました'),
                      actions: <Widget>[
                        OutlinedButton(
                          onPressed: () {
                            AutoRouter.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: const Text('OK'),
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
