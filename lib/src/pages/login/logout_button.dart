import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/app/app.dart';
import 'package:web_app/src/auth/auth_scope.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/pages/dashboard/responsive.dart';
import 'package:web_app/src/route/route_define.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback onLogout;
  const LogoutButton({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthScope>(
      builder: (_, model, __) {
        VoidCallback? action = onLogout;
        Widget child = const Icon(Icons.logout,size: 20,);
        switch (model.status) {
          case AuthStatus.none:
          case AuthStatus.success:
          case AuthStatus.failed:
          case AuthStatus.waitingLogin:
            break;
          case AuthStatus.waitingLoginOut:
            action = null;
            child = CupertinoActivityIndicator(radius: 10,);
        }

        return IconButton(
          splashRadius: 20,
          onPressed: action,
          tooltip: '退出登录',
          icon: child,
        );
      },
    );
  }
}
