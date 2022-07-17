import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GohobiScreen extends HookConsumerWidget {
  const GohobiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              controller: TextEditingController(),
              onSubmitted: (text) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('入力完了'),
            ),
          ],
        ),
      ),
    );
  }
}
