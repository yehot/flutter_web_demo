import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';

class NavBreadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> items;
  final ValueChanged<BreadcrumbItem>? onTapItem;

  const NavBreadcrumb({super.key, required this.items,  this.onTapItem});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(NavBreadcrumbItem(
        item: items[i], onTapItem: onTapItem,
      ));
      if (i != items.length - 1) {
        children.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            '/',
            style: TextStyle(color: Colors.grey),
          ),
        ));
      }
    }

    return Wrap(
      children: children,
    );
  }
}

class NavBreadcrumbItem extends StatefulWidget {
  final BreadcrumbItem item;
  final ValueChanged<BreadcrumbItem>? onTapItem;
  const NavBreadcrumbItem({super.key, required this.item, required this.onTapItem});

  @override
  State<NavBreadcrumbItem> createState() => _NavBreadcrumbItemState();
}

class _NavBreadcrumbItemState extends State<NavBreadcrumbItem> {

  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    bool hasTarget = (widget.item.to != null);
    Color? color = (_hover&&hasTarget)?Colors.blue: Colors.white;
    MouseCursor cursor = hasTarget?SystemMouseCursors.click:SystemMouseCursors.basic;

    if(widget.item.active) {
      color = Colors.white;
      cursor = SystemMouseCursors.basic;
    }

    TextStyle style = TextStyle(
      fontWeight: hasTarget ? FontWeight.bold : null,
      color: color
    );

    return MouseRegion(
      cursor: cursor,
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: () {
          if(!widget.item.active){
            widget.onTapItem?.call(widget.item);
          }
        },
        child: Text(widget.item.label, style: style)),
    );
  }

  void _onEnter(PointerEnterEvent event) {
    setState(() {
      _hover = true;
    });
  }

  void _onExit(PointerExitEvent event) {
    setState(() {
      _hover = false;
    });
  }
}

class BreadcrumbItem {
  final String? to;
  final String label;
  final bool active;

  BreadcrumbItem( {this.to, required this.label,this.active=false,});
}
