import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../logic/manager/export_normal_manager.dart';
import '../day_view/day_view_page.dart';
import '../home/home_page.dart';
import '../me/me_page.dart';
import '../statistical/statistical_page.dart';

class PageViewComp extends StatefulWidget {
  const PageViewComp({Key? key}) : super(key: key);

  @override
  State<PageViewComp> createState() => _PageViewCompState();
}

class _PageViewCompState extends State<PageViewComp> {
  final pageList = <Widget>[
    const HomePage(),
    const DayViewPage(),
    const StatisticalPage(),
    const MePage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, ref, child) {
      final pageController =
          ref.watch(stateTabProvider.select((value) => value.pageController));
      return PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pageList,
      );
    });
  }
}
