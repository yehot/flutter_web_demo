import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/home/home_page.dart';
import 'package:web_app/src/route/route_define.dart';

// 首页 + 首页的子页面
final RouteBase homeRouters = GoRoute(
  path: RouteDefine.home,
  builder: (BuildContext context, GoRouterState state) {
    return const HomePage();
  },
);

