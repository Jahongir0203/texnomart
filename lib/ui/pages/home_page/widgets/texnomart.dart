import 'package:flutter/material.dart';

Widget buildTexnomartAppBar() {
  return SliverAppBar(
    backgroundColor: Colors.yellow.shade700,
    centerTitle: true,
    title: const Text(
      'texnomart*',
      style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    ),
    floating: false,
    pinned: false,
    expandedHeight: 20,
  );
}