import 'package:flutter/material.dart';

import 'bottom_nov_bar_comp.dart';
import 'page_view_comp.dart';

class TabScaffold extends StatefulWidget {
  const TabScaffold({Key? key}) : super(key: key);

  @override
  State<TabScaffold> createState() => _TabScaffoldState();
}

class _TabScaffoldState extends State<TabScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('专注'),
      ),
      bottomNavigationBar: const BottomNovBarComp(),
      body: const PageViewComp(),
    );
  }
}
