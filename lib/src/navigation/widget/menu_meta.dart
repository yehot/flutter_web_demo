import 'package:flutter/cupertino.dart';

class MenuMeta {
  // 标签
  final String label;

  final String path;

  // 图标数据
  final String icon;

  const MenuMeta({
    required this.label,
    required this.icon,
    required this.path,
  });
}
