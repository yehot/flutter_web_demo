import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_app/src/app/app.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/navigation/widget/menu_meta.dart';
import 'package:web_app/src/route/route_define.dart';

class AppNavigationRail extends StatelessWidget {
  const AppNavigationRail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      color: secondaryColor,
      child: SideMenu(),
    );
  }
}

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  final List<MenuMeta> deskNavBarMenus = [
    MenuMeta(label: 'Dashboard', icon: "assets/icons/menu_dashboard.svg", path: RouteDefine.dashboard),
    MenuMeta(label: 'Task', icon: "assets/icons/menu_task.svg", path: RouteDefine.color),
    MenuMeta(label: 'Notification', icon: "assets/icons/menu_notification.svg", path: RouteDefine.notification),
    MenuMeta(label: 'Profile', icon: "assets/icons/menu_profile.svg", path: RouteDefine.profile),
    MenuMeta(label: 'Settings', icon: "assets/icons/menu_setting.svg", path: RouteDefine.settings),
  ];

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        DrawerHeader(
          child: Image.asset("assets/images/logo.png"),
        ),
        ...deskNavBarMenus.map((e) => DrawerListTile(
          title: e.label,
          svgSrc: e.icon,
          press: () {
            // Feature: 1、页面主布局，左侧固定导航，右侧 push 切换页面

            // 一级菜单的路由切换：
            app.go(context, e.path);
          },
        )).toList(),
      ],
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
