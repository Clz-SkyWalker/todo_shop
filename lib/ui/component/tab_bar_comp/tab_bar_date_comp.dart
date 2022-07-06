import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../logic/manager/export_manager.dart';
import '../../../logic/utils/export_utils.dart';

class TabBarDateComp extends StatefulWidget {
  const TabBarDateComp({Key? key}) : super(key: key);

  @override
  State<TabBarDateComp> createState() => _TabBarDateCompState();
}

class _TabBarDateCompState extends State<TabBarDateComp> {
  bool total = true;

  @override
  Widget build(BuildContext context) {
    final primaryContainerColor =
        Theme.of(context).colorScheme.primaryContainer;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final unSelectTextStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(color: primaryContainerColor);
    final selectTextStyle =
        Theme.of(context).textTheme.bodyText2!.copyWith(color: primaryColor);
    return Column(
      children: [
        headWidget(unSelectTextStyle),
        total
            ? monthWidget(unSelectTextStyle, selectTextStyle)
            : weekWidget(unSelectTextStyle, selectTextStyle),
      ],
    );
  }

  Widget headWidget(TextStyle textStyle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) => Container(
          height: 20.w,
          width: 40.w,
          alignment: Alignment.center,
          child: Text(
            UtilTime.weekToString(index + 1),
            style: textStyle,
          ),
        ),
      ).toList(),
    );
  }

  // 周期选择组件
  Widget weekWidget(TextStyle unSelectTextStyle, TextStyle selectTextStyle) {
    return Consumer(
      builder: (context, ref, child) {
        final date = ref.watch(stateHomeProvider.select((value) => value.date));
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: UtilTime.getWeekDate(date).map((e) {
            return dayItemWidget(
                ref, e, date, unSelectTextStyle, selectTextStyle);
          }).toList(),
        );
      },
    );
  }

  Widget monthWidget(TextStyle unSelectTextStyle, TextStyle selectTextStyle) {
    return Consumer(
      builder: (context, ref, child) {
        final date = ref.watch(stateHomeProvider.select((value) => value.date));
        return SizedBox(
          height: 250.w,
          width: double.infinity,
          child: GridView.count(
            crossAxisCount: 7,
            children: UtilTime.get35Day(date).map((e) {
              return dayItemWidget(
                  ref, e, date, unSelectTextStyle, selectTextStyle);
            }).toList(),
          ),
        );
      },
    );
  }

  // 单个日子
  Widget dayItemWidget(WidgetRef ref, DateTime dateItem, DateTime curDate,
      TextStyle unSelectTextStyle, TextStyle selectTextStyle) {
    final isSelect = dateItem == curDate;
    return SizedBox(
      height: 50.w,
      width: 50.w,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 40.w,
          maxWidth: 40.w,
        ),
        child: TextButton(
          onPressed: () {
            ref.read(stateHomeProvider.notifier).switchDate(dateItem);
          },
          style: TextButton.styleFrom(
              fixedSize: Size(40.w, 40.w),
              backgroundColor: isSelect
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.primary,
              splashFactory: NoSplash.splashFactory),
          child: Text(
            '${dateItem.day}',
            style: isSelect ? selectTextStyle : unSelectTextStyle,
          ),
        ),
      ),
    );
  }

  // 下拉按钮
  Widget loadBtnWidget() {
    return Container();
  }
}
