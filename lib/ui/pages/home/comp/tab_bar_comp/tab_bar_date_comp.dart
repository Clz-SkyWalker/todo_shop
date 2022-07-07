import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../logic/utils/export_utils.dart';

import '../../../../../logic/manager/export_normal_manager.dart';
import 'tab_bar_date_month_comp.dart';
import 'tab_bar_date_week_comp.dart';

class TabBarDateComp extends StatefulWidget {
  const TabBarDateComp({Key? key}) : super(key: key);

  @override
  State<TabBarDateComp> createState() => _TabBarDateCompState();
}

class _TabBarDateCompState extends State<TabBarDateComp> {
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
    const pdWidth = 5.0;

    return Consumer(
      builder: (context, ref, child) {
        final stateHome = ref.watch(stateHomeProvider);
        return Column(
          children: [
            headWidget(pdWidth, unSelectTextStyle),
            dateView(
                ref, pdWidth, stateHome, unSelectTextStyle, selectTextStyle),
            // loadBtnWidget(ref),
          ],
        );
      },
    );
  }

  // date 视图选择
  Widget dateView(WidgetRef ref, double pdWidth, StateHome stateHome,
      TextStyle unSelectTextStyle, TextStyle selectTextStyle) {
    final dateModel = TabDateModel.init();
    dateModel
      ..pdWidth = pdWidth
      ..unSelectTextStyle = unSelectTextStyle
      ..selectTextStyle = selectTextStyle;
    switch (stateHome.type) {
      case HomeViewType.month:
        return TabBarDateMonthComp(
          dateModel: dateModel,
        );
      default:
        return TabBarDateWeekComp(
          dateModel: dateModel,
        );
    }
  }

  // 显示周几
  Widget headWidget(double pdWidth, TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: pdWidth.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          7,
          (index) => Container(
            height: 20.w,
            width: 50.w,
            alignment: Alignment.center,
            child: Text(
              UtilTime.weekToString(index + 1),
              style: textStyle,
            ),
          ),
        ).toList(),
      ),
    );
  }

  // 下拉按钮
  Widget loadBtnWidget(WidgetRef ref) {
    return Container(
      height: 20.w,
      alignment: Alignment.center,
      child: IconButton(
        color: Theme.of(context).colorScheme.primaryContainer,
        onPressed: () {
          ref.read(stateHomeProvider.notifier).switchViewType();
        },
        icon: Icon(
          Icons.home_max,
          size: 13.sp,
        ),
      ),
    );
  }
}
