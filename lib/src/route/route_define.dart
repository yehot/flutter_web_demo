import 'package:flutter/material.dart';

// 一级页面
abstract class RouteDefine {
  static String root = "/";
  static String login = "login";
  // static String main = "main";
  static String home = "home";
  static String notFound = "404";

  static String dashboard = "dashboard";
  static String task = "task";
  static String color = "color";
  static String notification = "notification";
  static String profile = "profile";
  static String settings = "settings";
}



String calcRouteName(BuildContext context, String path) {
  // String? result = kRouteLabelMap[path];
  // if (result != null) return result;
  return path;
  return '未知路由';
}
