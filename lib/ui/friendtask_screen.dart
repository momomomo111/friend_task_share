import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../util/date_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';

class FriendTaskScren extends HookConsumerWidget {
  const FriendTaskScren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleProvider = ref.watch(googlSignInProvider);
    final friendTaskNames = ref.watch(friendtaskNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('友達タスクリスト画面'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              AutoRouter.of(context).push(const AddUserRoute());
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              googleProvider.logout(() {
                AutoRouter.of(context).replace(const LoginRoute());
              });
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          friendTaskNames.when(
            data: ((taskNames) => Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => ref
                        .read(friendtaskNameProvider.notifier)
                        .fetchTaskList(),
                    child: ListView.builder(
                      itemCount: taskNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        final deadline =
                            DateUtil.formatDeadline(taskNames[index].deadline);
                        return ListTile(
                          title: Text(taskNames[index].taskName),
                          subtitle: Text(deadline),
                          onTap: () {
                            AutoRouter.of(context).push(DetailRoute(
                                taskId: taskNames[index].uid, isMyTask: false));
                          },
                          trailing: ElevatedButton(
                            onPressed: () {
                              AutoRouter.of(context).push(
                                  AddGohobiRoute(taskId: taskNames[index].uid));
                            },
                            child: const Text("ごほうびをあげる"),
                          ),
                        );
                      },
                    ),
                  ),
                )),
            error: (error, _) => Column(
              children: [
                const Text(
                  "友達のタスクを取得できませんでした。\n友達を追加するか友達にタスクを追加してもらってください。",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: (() => ref
                        .read(friendtaskNameProvider.notifier)
                        .fetchTaskList()),
                    child: const Text("再読み込み"))
              ],
            ),
            loading: () => const CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context).push(const MyTaskRoute());
                },
                child: const Text("自分のタスク"),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
