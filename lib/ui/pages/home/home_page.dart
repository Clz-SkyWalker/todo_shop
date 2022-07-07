import 'package:flutter/material.dart';

import 'comp/tab_bar_comp/tab_bar_comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      child: Column(
        children: const [
          TabBarComp(
            height: 200,
            headHeight: 60,
          ),
        ],
      ),
    );
  }
}
