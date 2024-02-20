import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    // root 页面
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
