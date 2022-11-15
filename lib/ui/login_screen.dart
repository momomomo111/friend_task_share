import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../main.dart';
import '../navigation/app_router.gr.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleProvider = ref.watch(googlSignInProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                  colors: [Colors.blue[400]!, Colors.pink[300]!],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.white,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline5,
                    children: [
                      const TextSpan(
                        text: 'ごほうび',
                      ),
                      TextSpan(
                        text: ' ToDo ',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.fontSize),
                      ),
                      const TextSpan(
                        text: 'アプリ',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SignInButton(
                  Buttons.Google,
                  text: "Googleでログイン",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () => googleProvider.googleLogin(() {
                    AutoRouter.of(context).replace(const HomeRoute());
                    AutoRouter.of(context).removeUntil((route) => false);
                  }),
                ),
                const SizedBox(height: 20),
                SignInButton(
                  Buttons.Twitter,
                  text: "Twitterでログイン",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                SignInButton(
                  Buttons.AppleDark,
                  text: "Appleでログイン",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                SignInButton(
                  Buttons.FacebookNew,
                  text: "Facebookでログイン",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
                  onPressed: () {},
                ),
                const SizedBox(height: 20),
                SignInButton(
                  Buttons.Email,
                  text: "メールでログイン",
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16.0),
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
