import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleProvider = ref.watch(googlSignInProvider);
    final taskNames = ref.watch(friendtaskNameProvider);

    bool loading = true;

    if (googleProvider.auth.currentUser == null) {
      AutoRouter.of(context).push(const LoginRoute());
    } else {
      loading = false;
      ref.read(userDataProvider.notifier).initBaseData(
            googleProvider.auth.currentUser!.uid,
            googleProvider.auth.currentUser!.displayName!,
            googleProvider.auth.currentUser!.photoURL!,
          );
    }

    return !loading
        ? Scaffold(
            appBar: AppBar(
              title: const Text('ホーム画面'),
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
                      AutoRouter.of(context).push(const LoginRoute());
                    });
                  },
                ),
                const SizedBox(width: 16),
              ],
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: taskNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        DateFormat outputFormat =
                            DateFormat('yyyy/MM/dd HH:mm');
                        String deadline =
                            outputFormat.format(taskNames[index].deadline);
                        return ListTile(
                          title: Text(taskNames[index].taskName),
                          subtitle: Text("$deadline まで"),
                          onTap: () {
                            AutoRouter.of(context)
                                .push(DetailRoute(task: taskNames[index]));
                          },
                          trailing: ElevatedButton(
                            onPressed: () {
                              AutoRouter.of(context).push(const GohobiRoute());
                            },
                            child: const Text("ごほうびをあげる"),
                          ),
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
                          AutoRouter.of(context).push(const MyTaskRoute());
                        },
                        child: const Text("自分のタスク"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
