import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/navigation/views/app_top_bar/widget/bread_crumb.dart';
import 'package:web_app/src/route/route_define.dart';
// import 'package:iroute/components/components.dart';
// import '../../helper/function.dart';
// import '../route_back_indicator.dart';
// import 'app_router_editor.dart';
// import 'route_history_button.dart';
// import 'history_view_icon.dart';


class RouterIndicator extends StatefulWidget {
  const RouterIndicator({super.key});

  @override
  State<RouterIndicator> createState() => _RouterIndicatorState();
}

class _RouterIndicatorState extends State<RouterIndicator> {
  late GoRouterDelegate _delegate;
  @override
  void initState() {
    super.initState();
    _delegate = GoRouter.of(context).routerDelegate;
    _delegate.addListener(_onRouterChange);
  }

  @override
  void dispose() {
    _delegate.removeListener(_onRouterChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<RouteMatch> matches = _delegate.currentConfiguration.matches;
    if(matches.isEmpty) return const SizedBox();
    RouteMatch match = _delegate.currentConfiguration.matches.last;

    // print("=========_RouterIndicatorState:build==${match.matchedLocation}========");

    return NavBreadcrumb(
      items: pathToBreadcrumbItems(context, match.matchedLocation),
      onTapItem: (item) {
        if (item.to != null) {
          GoRouter.of(context).go(item.to!);
        }
      },
    );
  }

  void _onRouterChange() {
    setState(() {});
  }

  List<BreadcrumbItem> pathToBreadcrumbItems(BuildContext context, String path) {
    Uri uri = Uri.parse(path);
    List<BreadcrumbItem> result = [];
    String to = '';

    String distPath = '';
    for (String segment in uri.pathSegments) {
      distPath += '/$segment';
    }

    for (String segment in uri.pathSegments) {
      to += '/$segment';
      String label = calcRouteName(context, to);
      if (label.isNotEmpty) {
        result
          .add(BreadcrumbItem(to: to, label: label, active: to == distPath));
      }
    }
    return result;
  }
}
