import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarHeadComp extends StatelessWidget {
  const TabBarHeadComp({Key? key, required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    final primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    final iconSize = Theme.of(context).textTheme.bodyText1!.fontSize! * 1.5;
    final textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: primaryContainer);
    return Container(
      height: height.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          drawHeadWidget(
              context, height, primaryContainer, iconSize, textStyle),
          tailHeadWidget(context, height, primaryContainer, iconSize),
        ],
      ),
    );
  }


  // 头部抽屉按钮
  Widget drawHeadWidget(BuildContext context, double height, Color color,
      double iconSize, TextStyle textStyle) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Container(
        height: height.w,
        width: 60.w,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              Icons.menu,
              size: iconSize,
              color: color,
            ),
            Text(
              '待办',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }

  // 头部-尾部按钮
  Widget tailHeadWidget(
      BuildContext context, double height, Color color, double iconSize) {
    return Container(
      height: height.w,
      width: height.w,
      alignment: Alignment.centerRight,
      child: Icon(
        Icons.eco_sharp,
        color: color,
        size: iconSize,
      ),
    );
  }
}

