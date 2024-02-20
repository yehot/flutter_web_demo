import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/define/constants.dart';
import 'package:web_app/src/navigation/views/app_top_bar/widget/route_back_indicator.dart';

import 'widget/router_indicator.dart';
import 'widget/app_router_editor.dart';
import 'widget/history_view_icon.dart';
import 'widget/route_history_button.dart';

// app 主面板顶部 app bar
class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 46,
      child: Row(
        children: [
          const SizedBox(width: 16),
          const RouteBackIndicator(),
          const RouterIndicator(),
          Expanded(
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: VerticalDivider(
                    width: 32,
                  ),
                ),
                HistoryViewIcon(),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 250,
                  child: AppRouterEditor(
                    onSubmit: (path) {
                      print("------- $path");

                      GoRouter.of(context).go(path);
                    },
                  )),
                const SizedBox(
                  width: 12,
                ),
                RouteHistoryButton(),
              ]),
          ),
        ],
      ),
    );
  }
}

