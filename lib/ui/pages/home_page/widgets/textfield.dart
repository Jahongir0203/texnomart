import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildSearchBar() {
  return SliverAppBar(
    titleSpacing: 0,
    floating: false,
    pinned: true,
    backgroundColor: Colors.yellow.shade700,
    shape: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.only(
        topLeft: Radius.zero,
        topRight: Radius.zero,
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
    ),
    bottom:PreferredSize(
      preferredSize: const Size.fromHeight(25),
      child: Padding(
        padding: const EdgeInsets.only(
          bottom:15,
          left: 20,
          right: 20,
        ),
        child: SizedBox(
          height:50,
          child: TextField(
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 18,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.mic,
                  size: 18,
                ),
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: 'Men sotib olmoqchiman',
              hintStyle: const TextStyle(
                fontSize: 12,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}