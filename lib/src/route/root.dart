import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/login/login_page.dart';
import 'package:web_app/src/route/app.dart';
import 'package:web_app/src/route/route_define.dart';


final RouteBase rootRoute = GoRoute(
  path: '/',
  redirect: _redirect,
  routes: [
    appRoute,
    GoRoute(
      path: RouteDefine.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
  if (state.fullPath == '/') {
    // _redirect 必须加 /
    return '/${RouteDefine.dashboard}';
  }
  return null;
}
