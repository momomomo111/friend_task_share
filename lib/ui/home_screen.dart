import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authSignInProvider);
    final userProvider = ref.read(userDataProvider.notifier);

    if (authProvider.currentUser == null) {
      AutoRouter.of(context).replace(const LoginRoute());
      AutoRouter.of(context).removeUntil((route) => false);
    } else {
      AutoRouter.of(context).replace(const FriendTaskScren());
      AutoRouter.of(context).removeUntil((route) => false);
      userProvider.initBaseData(
        authProvider.currentUser!.uid,
        authProvider.currentUser!.displayName ?? "",
        authProvider.currentUser!.photoURL ?? "",
      );
    }
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
