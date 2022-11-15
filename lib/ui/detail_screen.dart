import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:friend_task_share/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../navigation/app_router.gr.dart';
import '../util/date_util.dart';

class DetailScreen extends HookConsumerWidget {
  const DetailScreen({Key? key, required this.taskId, required this.isMyTask})
      : super(key: key);
  final bool isMyTask;
  final String taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProvider = ref.watch(detailTaskProvider);
    final gohobiUserProvider = ref.watch(gohobiUserDataProvider);
    final gohobiUserVisible = useState(false);
    final gohobiProvider = ref.watch(gohobiMessageProvider);

    useEffect(() {
      ref.read(detailTaskProvider.notifier).fetchTask(taskId);
      return null;
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク詳細画面'),
      ),
      body: Center(
        child: taskProvider.when(
          data: ((task) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(height: 40),
                  Text(task.taskName,
                      style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 20),
                  Text(DateUtil.formatDeadline(task.deadline),
                      style: Theme.of(context).textTheme.subtitle1),
                  const SizedBox(height: 20),
                  Visibility(
                    visible: task.isDone,
                    child: LimitedBox(
                      maxHeight: 180,
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
                  ),
                  const SizedBox(height: 20),
                  Text('ごほうびをもらった友達',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 20),
                  gohobiUserVisible.value
                      ? Flexible(
                          child: gohobiUserProvider.when(
                              data: (gohobiUser) {
                                return gohobiUser.isNotEmpty
                                    ? ListView.builder(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 28.0),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: task.gohobiListId.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  gohobiUser[index].name,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .headline5
                                                              ?.fontSize,
                                                      color: Colors.blue),
                                                ),
                                                const SizedBox(height: 30),
                                                CircleAvatar(
                                                  maxRadius: 30,
                                                  backgroundImage: NetworkImage(
                                                    gohobiUser[index].imageUrl,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    : Text('まだ誰からもごほうびをもらっていません',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6);
                              },
                              error: ((error, stackTrace) =>
                                  const Text("読み込みに失敗しました")),
                              loading: () => const CircularProgressIndicator()),
                        )
                      : ElevatedButton(
                          onPressed: (() {
                            ref
                                .read(gohobiUserDataProvider.notifier)
                                .fetchGohobiListUserList(
                                  task.gohobiListId,
                                );
                            gohobiUserVisible.value = true;
                          }),
                          child: const Text("ごほうびをもらった友達を見る"),
                        ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: task.isDone
                              ? () async {
                                  await ref
                                      .read(gohobiMessageProvider.notifier)
                                      .fetchGohobiListMessageList(
                                          task.gohobiListId);
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("ごほうびメッセージ"),
                                      content: gohobiProvider.when(
                                        data: ((gohobi) => SizedBox(
                                              width: 220,
                                              height: 400,
                                              child: ListView.builder(
                                                itemCount: gohobi.length,
                                                itemBuilder: ((_, index) =>
                                                    Text(gohobi[index])),
                                              ),
                                            )),
                                        error: ((error, stackTrace) =>
                                            const Text("読み込みに失敗しました")),
                                        loading: () =>
                                            const Text("読み込みに失敗しました"),
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          child: const Text('ご褒美を見る'),
                        ),
                        isMyTask
                            ? ElevatedButton(
                                onPressed: task.isDone
                                    ? null
                                    : () {
                                        ref
                                            .read(detailTaskProvider.notifier)
                                            .doneTask();
                                        ref
                                            .read(detailTaskProvider.notifier)
                                            .fetchTask(taskId);
                                      },
                                child: const Text('タスク完了'),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  AutoRouter.of(context)
                                      .push(AddGohobiRoute(taskId: task.uid));
                                },
                                child: const Text('ごほうびをあげる'),
                              ),
                      ],
                    ),
                  ),
                ],
              )),
          error: ((error, stackTrace) => Text("$error")),
          loading: (() => const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
