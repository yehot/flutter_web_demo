import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_app/src/app/app.dart';
import 'package:web_app/src/auth/auth_scope.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/pages/login/logout_button.dart';
import 'package:web_app/src/route/route_define.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthScope>(
        builder: (_, model, __) {
          if (model.status == AuthStatus.none) {
            return _buildLogin(context);
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: SvgPicture.asset(
                    'assets/icons/menu_profile.svg',
                    colorFilter: ColorFilter.mode(Colors.white54, BlendMode.srcIn),
                    height: 16,
                  ),
                ),
                const SizedBox(width: 12,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${model.name}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Text('uid: ${model.uid}',style: TextStyle(fontSize: 12,color: Colors.grey,),)
                  ],
                ),
                SizedBox(width: 80,),
                Text('退出登录',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                LogoutButton(
                  onLogout: () async {
                    bool success = await model.logout();
                    if(success){
                      app.go(context, '');
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogin(context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {
        app.go(context, RouteDefine.login);
      },
      tooltip: '登录',
      icon: Icon(Icons.login,),
    );;
  }

}
