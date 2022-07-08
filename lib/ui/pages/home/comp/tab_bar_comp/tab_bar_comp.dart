import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r)),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0), //阴影xy轴偏移量
              blurRadius: 15.0, //阴影模糊程度
              spreadRadius: 1.0) //阴影扩散程度
        ],
      ),
      clipBehavior: Clip.hardEdge,
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
