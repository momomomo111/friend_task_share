import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class AddUserScreen extends HookConsumerWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();
    final userVisibility = useState(false);
    final focusNode = useFocusNode();
    final myUserProvider = ref.watch(userDataProvider);
    final friendUserProvider = ref.watch(friendUserDataProvider);

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        userVisibility.value = false;
      } else {
        userVisibility.value = true;
        ref.read(friendUserDataProvider.notifier).searchUserData(
              textController.text,
            );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザー追加画面'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            Text('自分のユーザ名', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 10),
            Text(myUserProvider.name,
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 20),
            Text('自分のユーザID', style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 10),
            Text(myUserProvider.uid,
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 20),
            TextField(
              controller: textController,
              focusNode: focusNode,
              onSubmitted: (text) {
                userVisibility.value = true;
              },
            ),
            const SizedBox(height: 40),
            userVisibility.value
                ? friendUserProvider.when(
                    data: ((friendUser) => AlertDialog(
                          title: Text(friendUser.name),
                          content: const Text('このユーザーを友達追加しますか？'),
                          actions: <Widget>[
                            OutlinedButton(
                              child: const Text('キャンセル'),
                              onPressed: () {
                                userVisibility.value = false;
                              },
                            ),
                            OutlinedButton(
                              child: const Text('追加'),
                              onPressed: () {
                                userVisibility.value = false;
                                ref
                                    .read(friendUserDataProvider.notifier)
                                    .addFriendUser(
                                        myUserProvider.uid, friendUser.uid);
                              },
                            ),
                          ],
                        )),
                    error: ((error, stackTrace) => Text(error.toString())),
                    loading: () => const CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      userVisibility.value = true;
                      focusNode.unfocus();
                    },
                    child: const Text('入力完了'),
                  ),
          ],
        ),
      ),
    );
  }
}
