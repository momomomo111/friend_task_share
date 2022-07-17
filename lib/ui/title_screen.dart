import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:friend_task_share/navigation/app_router.gr.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TitleScreen extends HookConsumerWidget {
  const TitleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("タイトル名",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton(Buttons.Google,
                    text: "Googleでログイン",
                    onPressed: () =>
                        AutoRouter.of(context).push(const HomeRoute())),
                SignInButton(
                  Buttons.Twitter,
                  text: "Twitterでログイン",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.AppleDark,
                  text: "Appleでログイン",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.FacebookNew,
                  text: "Facebookでログイン",
                  onPressed: () {},
                ),
                SignInButton(
                  Buttons.Email,
                  text: "メールでログイン",
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
