import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_app/src/route/route_define.dart';
import 'package:web_app/src/route/task.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {

  final List<int> taskList = [1, 2, 3, 4, 5, 6, 7, 8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: taskList.asMap().keys.map((int index) {
              return GestureDetector(
                onTap: () {
                  context.push('/${RouteDefine.task}/${TaskRouteDefine.detail}?index=$index');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.white,
                    )
                  ),
                  child: Text(
                    '$index',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
          }).toList(),
        ),
      ),
    );
  }
}
