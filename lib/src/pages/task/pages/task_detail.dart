import 'package:flutter/material.dart';
import 'package:web_app/src/route/route_define.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Text(
          "Task $index",
        ),
      ),
    );
  }
}
