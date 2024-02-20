import 'package:flutter/material.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/route/profile.dart';
import 'package:web_app/src/route/route_define.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text('Profile Setting',),
      ),
      body: Center(
        child: Text(
          "${RouteDefine.profile} - ${ProfileRouteDefine.settings}",
        ),
      ),
    );
  }
}
