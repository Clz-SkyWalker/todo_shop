import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../logic/manager/export_normal_manager.dart';

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
    return Consumer(
      builder: (context, ref, child) {
        final viewType =
            ref.watch(stateHomeProvider.select((value) => value.viewType));
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Container(
            height: height.w,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: iconSize,
                  color: color,
                ),
                headWidget(viewType, textStyle),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget headWidget(HomeViewType viewType, TextStyle textStyle) {
    switch (viewType) {
      case HomeViewType.month:
        return _HeadDateWidget(textStyle: textStyle);
      default:
        return Text(
          S.current.backlog,
          style: textStyle,
        );
    }
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

/// 头部年月展示
class _HeadDateWidget extends StatelessWidget {
  const _HeadDateWidget({Key? key, required this.textStyle}) : super(key: key);
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final curYM = ref.watch(stateHomeProvider.select((value) => value.curYM));
      return InkWell(
        onTap: () {
          showPicker(context, ref);
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                border: Border.all(
                    color: Theme.of(context).colorScheme.primaryContainer),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Text(
                  '${curYM.year}.${curYM.month}',
                  style: textStyle.copyWith(
                      fontSize: (textStyle.fontSize! * 2 / 3)),
                ),
                Icon(
                  Icons.align_vertical_top_outlined,
                  color: textStyle.color,
                  size: (textStyle.fontSize! * 2 / 3),
                )
              ],
            )),
      );
    });
  }

  /// 时间选择器
  void showPicker(BuildContext context, WidgetRef ref) async {
    final selectDate = ref.read(stateHomeProvider.notifier).getSelectDate;
    final selDate = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime(1998),
        lastDate: DateTime(2077),
        builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                      onPrimary:
                          Theme.of(context).colorScheme.primaryContainer)),
              child: child!);
        });
    if (selDate != null) {
      ref.read(stateHomeProvider.notifier).switchDate(selDate);
    }
  }
}
