import 'package:flutter/material.dart';

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
    HomePage(),
    DayViewPage(),
    StatisticalPage(),
    MePage()
  ];
  // final PageController pageController;

  @override
  void initState() {
    super.initState();
    // pageController=PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      // controller: ,
      children:pageList,
    );
  }
}
