import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/pages/profile/navigation/profile_navigation.dart';
import 'package:web_app/src/pages/profile/profile_page.dart';
import 'package:web_app/src/pages/profile/profile_settings.dart';
import 'package:web_app/src/pages/profile/profile_sub_page.dart';
import 'package:web_app/src/route/route_define.dart';

// 二级页面：profile
abstract class ProfileRouteDefine {
  static String settings = "settings";
  static String sub = "sub";
}

// ProfileRouteDefine.sub 对应的二级菜单
Map<String, String> profileNameMap = {
  'personal': '个人中心',
  'user': '用户管理',
  'role': '角色管理',
  'menu': '菜单管理',
};

final RouteBase profileRouters = ShellRoute(
  builder: (BuildContext context, GoRouterState state, Widget child) {
    return ProfileNavigation(navigator: child);
  },
  routes: [
    GoRoute(
      path: RouteDefine.profile,
      builder: (BuildContext context, GoRouterState state) {
        return ProfilePage();
      },
      routes: [
        GoRoute(
          path: ProfileRouteDefine.sub,
          builder: (BuildContext context, GoRouterState state) {
            // print(state.pathParameters);// 获取路径参数
            var params = state.extra as Map?;
            var title = params?['title'] ?? "";
            return ProfileSubPage(title: title,);
          },
        ),
        GoRoute(
          path: ProfileRouteDefine.settings,

          pageBuilder: (BuildContext context, GoRouterState state) {
            // 给指定页面 单独添加页面转场效果
            return CustomTransitionPage(
              key: state.pageKey,
              child: const ProfileSettingsPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  child: child,
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)));
              }
            );
          },
        ),
      ],
    ),
  ],
);
