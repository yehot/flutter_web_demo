import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/color/color_page.dart';
import 'package:web_app/src/pages/color/pages/color_add_page.dart';
import 'package:web_app/src/pages/color/pages/color_detail_page.dart';
import 'package:web_app/src/route/route_define.dart';

abstract class ColorRouteDefine {
  static String detail = "detail";
}

final RouteBase colorRouters = GoRoute(
  path: RouteDefine.color,
  builder: (BuildContext context, GoRouterState state) {
    return const ColorPage();
  },
  routes: <RouteBase>[
    GoRoute(
      path: ColorRouteDefine.detail,
      // name: 'colorDetail',
      builder: (BuildContext context, GoRouterState state) {
        String? selectedColor = state.uri.queryParameters['color'];
        Color color = Colors.black;
        if (selectedColor != null) {
          color = Color(int.parse(selectedColor, radix: 16));
        }
        return ColorDetailPage(color: color);
      },
    ),
    GoRoute(
      path: 'add',
      builder: (BuildContext context, GoRouterState state) {
        return const ColorAddPage();
      },
    ),
  ],
);
