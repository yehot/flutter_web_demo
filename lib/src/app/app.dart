import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final App app = App();

class App {
  void push(BuildContext context, String path) {
    GoRouter.of(context).push("/$path");
  }

  void go(BuildContext context, String path, {Object? extra}) {
    GoRouter.of(context).go("/$path", extra: extra);
  }
}
