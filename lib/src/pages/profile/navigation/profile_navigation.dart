import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/app/app.dart';
import 'package:web_app/src/route/profile.dart';
import 'package:web_app/src/route/route_define.dart';


class ProfileNavigation extends StatelessWidget {
  final Widget navigator;
  const ProfileNavigation({super.key, required this.navigator});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: [
          SizedBox(
            width: 180,
            child: ProfileRailPanel(),
          ),
          VerticalDivider(
            width: 1,
          ),
          Expanded(
            child: navigator,
          ),
        ],
      ),
    );
  }
}

class ProfileRailPanel extends StatefulWidget {
  const ProfileRailPanel({super.key});

  @override
  State<ProfileRailPanel> createState() => _ProfileRailPanelState();
}

class _ProfileRailPanelState extends State<ProfileRailPanel> {
  String _current = profileNameMap.values.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              // const SortButton(),
              const Spacer(),
              // const MouseRegion(
              //   cursor: SystemMouseCursors.click,
              //   child: Icon(
              //     CupertinoIcons.chevron_left_slash_chevron_right,
              //     size: 18,
              //   ),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    app.push(context, '${RouteDefine.profile}/${ProfileRouteDefine.settings}');
                  },
                  child: const Icon(
                    CupertinoIcons.settings,
                    size: 18,
                  )),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
        ),
        Expanded(
          child: SortSelectorPanel(
            active: _current,
            options: profileNameMap.values.toList(),
            onSelected: (name) {
              _current = name;
              // 通过路径传参
              // app.go(context, '/sort/player/$name');
              // 通过 extra 传参
              app.go(context,
                '${RouteDefine.profile}/${ProfileRouteDefine.sub}',
                extra: {
                  'title': name,
                }
              );
            },
          ),
        ),
      ],
    );
  }
}



class SortSelectorPanel extends StatelessWidget {
  final String active;
  final ValueChanged<String> onSelected;
  final List<String> options;

  const SortSelectorPanel(
    {super.key,
      required this.active,
      required this.options,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemExtent: 46,
      itemCount: profileNameMap.length,
      itemBuilder: _buildByIndex,
    );
  }

  Widget? _buildByIndex(BuildContext context, int index) {
    String key = profileNameMap.keys.toList()[index];
    bool selected = profileNameMap.keys.toList()[index] == active;
    return SortItemTile(
      selected: selected,
      onTap: () => onSelected(key),
      title: options[index],
    );
  }
}

class SortItemTile extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const SortItemTile(
    {super.key,
      required this.title,
      required this.selected,
      required this.onTap});

  @override
  State<SortItemTile> createState() => _SortItemTileState();
}

class _SortItemTileState extends State<SortItemTile> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: widget.selected ? const Color(0xffE6F0FF) : null),
            padding: const EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: widget.selected ? FontWeight.bold : null),
            ),
          ),
        ),
      ),
    );
  }
}
