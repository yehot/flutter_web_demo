import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/auth/auth_scope.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/navigation/history/router_history.dart';
import 'package:web_app/src/navigation/transition/fade_page_transitions_builder.dart';
import 'package:web_app/src/route/root.dart';
import 'package:web_app/src/route/route_define.dart';
import 'package:flutter_web_plugins/url_strategy.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthScope(),
      child: RouterHistoryScope(
        notifier: RouterHistory(_router.routerDelegate,
          exclusives: [RouteDefine.login]
        ),
        child: MaterialApp.router(
          title: 'Flutter Admin Panel', // 浏览器 tab 标题
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                // PC 上如果不修改转场，会和 iOS 转场类似
                TargetPlatform.macOS: FadePageTransitionsBuilder(),
                TargetPlatform.windows: FadePageTransitionsBuilder(),
                TargetPlatform.linux: FadePageTransitionsBuilder(),
              }
            ),
            scaffoldBackgroundColor: bgGrayColor,
            // canvasColor: secondaryColor,
          ),
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      rootRoute,
    ],
    onException: (BuildContext ctx, GoRouterState state, GoRouter router) {
      print("------------page notFound: ${state.uri.toString()}");
      router.go("/${RouteDefine.notFound}", extra: state.uri.toString());
    },
    // 登录重定向
    redirect: _authRedirect,
  );

}

FutureOr<String?> _authRedirect(BuildContext context, GoRouterState state) async {
  bool loggedIn = context.read<AuthScope>().status == AuthStatus.success;
  if (!loggedIn) {
    return "/${RouteDefine.login}";
  }
  return null;
}
