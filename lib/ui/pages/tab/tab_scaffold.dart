import 'package:flutter/material.dart';

import '../tab/bottom_nov_bar_comp.dart';

class TabScaffold extends StatefulWidget {
  const TabScaffold({Key? key}) : super(key: key);

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNovBarComp(),
      body: Container(color: Colors.grey,),
    );
  }
}
