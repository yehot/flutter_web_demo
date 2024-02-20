import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/navigation/app_navigation.dart';
import 'package:web_app/src/pages/dashboard/dashboard_page.dart';
import 'package:web_app/src/pages/not_found/not_found_page.dart';
import 'package:web_app/src/pages/notification/notification_page.dart';
import 'package:web_app/src/pages/settings/settings_page.dart';
import 'package:web_app/src/route/color.dart';
import 'package:web_app/src/route/home.dart';
import 'package:web_app/src/route/profile.dart';
import 'package:web_app/src/route/route_define.dart';


final RouteBase appRoute = ShellRoute(
  builder: (BuildContext context, GoRouterState state, Widget child) {
    return AppNavigation(child: child);
  },
  routes: [ // 以下是 app 所有的一级页面
    homeRouters,
    GoRoute(
      path: RouteDefine.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return DashboardPage();
      },
    ),
    colorRouters,
    // taskRouters,
    GoRoute(
      path: RouteDefine.notification,
      builder: (BuildContext context, GoRouterState state) {
        return NotificationPage();
      },
    ),
    profileRouters,
    GoRoute(
      path: RouteDefine.settings,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsPage();
      },
    ),
    GoRoute(
      path: RouteDefine.notFound,
      builder: (BuildContext context, GoRouterState state) {
        String msg = '无法访问: ${state.extra}';
        return NotFoundPage(msg: msg);
      },
    ),
  ],
);
