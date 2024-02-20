import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage();

  @override
  Widget build(BuildContext context) {
    // root 页面
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
      ),
    );
  }
}
