import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';

class AddUserScreen extends HookConsumerWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchIdController = useTextEditingController();
    final userVisibility = useState(false);
    final focusNode = useFocusNode();
    final myUserProvider = ref.watch(userDataProvider);
    final friendUserProvider = ref.watch(searchUserDataProvider);

    focusNode.addListener(() {
      if (!focusNode.hasFocus &&
          searchIdController.text.isNotEmpty &&
          searchIdController.text != myUserProvider.uid) {
        ref.read(searchUserDataProvider.notifier).searchUserData(
              searchIdController.text,
            );
        userVisibility.value = true;
      } else {
        userVisibility.value = false;
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
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextFormField(
                controller: searchIdController,
                textAlign: TextAlign.center,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "友達のユーザIDを入力してください",
                  labelText: "友達のユーザID",
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '友達のユーザIDが入力されていません';
                  }
                  if (value == myUserProvider.uid) {
                    return '自分のユーザIDは入力できません';
                  }
                  return null;
                },
              ),
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
                                    .read(searchUserDataProvider.notifier)
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
