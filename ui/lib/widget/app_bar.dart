import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  CustomAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), centerTitle: true, elevation: 0);
  }
}
