import 'package:flutter/material.dart';

class HomeTexnomart extends StatelessWidget {
  const HomeTexnomart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
