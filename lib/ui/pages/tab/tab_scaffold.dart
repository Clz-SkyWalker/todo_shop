import 'package:flutter/material.dart';
import '../home/home_page.dart';

import '../tab/bottom_nov_bar_comp.dart';

class TabScaffold extends StatefulWidget {
  const TabScaffold({Key? key}) : super(key: key);

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNovBarComp(),
      body: HomePage(),
    );
  }
}
