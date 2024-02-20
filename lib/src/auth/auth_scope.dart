

import 'package:flutter/cupertino.dart';

enum AuthStatus{
  none, // 未认证
  success, // 认证成功
  failed, // 认证失败
  waitingLogin, // 认证中
  waitingLoginOut, //注销中
}

const Map<String,String> _kTestUserMap = {
  'Admin': '123456',
};

class AuthScope extends ChangeNotifier {
  AuthStatus status = AuthStatus.none;

  String? name;
  String? uid;

  Future<AuthResult> login(String username,String pwd) async{
    /// 模拟校验 与 模拟延时
    bool allow = _kTestUserMap[username] == pwd;
    status = AuthStatus.waitingLogin;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    if (allow) {
      // TODO: 登录 token 持久化
      name = username;
      uid = pwd;
      status = AuthStatus.success;
      notifyListeners();
      return AuthResult(success: true, msg: "登录成功");
    } else {
      /// 可以返回一写其他错误信息
      name = null;
      uid = null;
      status = AuthStatus.failed;
      notifyListeners();
      return AuthResult(success: false, msg: "登录失败");
    }
  }

  Future<bool> logout() async{
    status = AuthStatus.waitingLoginOut;
    notifyListeners();
    /// 模拟退出登录请求耗时
    await Future.delayed(const Duration(seconds: 1));
    status = AuthStatus.none;
    notifyListeners();
    return true;
  }

}

class AuthResult {
  String? msg;
  bool? success;

  AuthResult({
   this.msg,
   this.success,
  });
}