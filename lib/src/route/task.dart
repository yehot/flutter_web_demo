import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/task/pages/task_detail.dart';
import 'package:web_app/src/pages/task/task_page.dart';
import 'package:web_app/src/route/route_define.dart';

abstract class TaskRouteDefine {
  static String detail = "detail";
}

// Task 页面 + 子页面
final RouteBase taskRouters = GoRoute(
  path: RouteDefine.task,
  builder: (BuildContext context, GoRouterState state) {
    return const TaskPage();
  },
  routes: <RouteBase>[
    GoRoute(
      path: TaskRouteDefine.detail,
      name: 'taskDetail',
      builder: (BuildContext context, GoRouterState state) {
        // 1. 通过 uri 获取 页面传参
        String? index = state.uri.queryParameters['index'];
        return TaskDetailPage(index: int.parse(index ?? "0"),);
      },
    ),

  ],
);

