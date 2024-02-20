import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_app/src/auth/auth_scope.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/pages/dashboard/responsive.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onLogin;
  const LoginButton({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    return Consumer<AuthScope>(
      builder: (_, model, __) {
        VoidCallback? action;
        Widget child;
        switch (model.status) {
          case AuthStatus.none:
          case AuthStatus.success:
          case AuthStatus.failed:
          case AuthStatus.waitingLoginOut:
            action = onLogin;
            child = const Text('登 录', style: style);
            break;
          case AuthStatus.waitingLogin:
            action = null;
            child = Wrap(
              spacing: 8,
              children: [
                CupertinoActivityIndicator(radius: 10),
                Text('登录中...', style: style)
              ],
            );
        }
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: const StadiumBorder(),
            minimumSize: const Size(350, 52),
            padding: EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
            ),
          ),
          onPressed: action,
          child: child,
        );
      },
    );
  }
}
