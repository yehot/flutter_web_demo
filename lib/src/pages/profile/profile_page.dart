import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          "点击设置按钮，查看页面 push 转场效果",
        ),
      ),
    );
  }
}
