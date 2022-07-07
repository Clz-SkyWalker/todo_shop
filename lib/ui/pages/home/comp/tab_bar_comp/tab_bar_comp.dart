import 'package:flutter/material.dart';

import 'tab_bar_date_comp.dart';
import 'tab_bar_head_comp.dart';

class TabBarComp extends StatefulWidget {
  const TabBarComp({Key? key, required this.height, required this.headHeight})
      : super(key: key);
  final double height;
  final double headHeight;

  @override
  State<TabBarComp> createState() => _TabBarCompState();
}

class _TabBarCompState extends State<TabBarComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      width: double.infinity,
      child: Column(
        children: [
          TabBarHeadComp(height: widget.headHeight),
          const TabBarDateComp(),
        ],
      ),
    );
  }
}