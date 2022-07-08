import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../logic/utils/export_utils.dart';

import '../../../../../logic/manager/export_normal_manager.dart';
import 'tab_bar_date_month_comp.dart';
import 'tab_bar_date_week_comp.dart';
import 'tab_bar_filter_comp.dart';

class TabBarDateComp extends StatefulWidget {
  const TabBarDateComp({Key? key}) : super(key: key);

  @override
  State<TabBarDateComp> createState() => _TabBarDateCompState();
}

class _TabBarDateCompState extends State<TabBarDateComp> {
  // 未选中的文字颜色
  late final Color primaryContainerColor;
  late final Color primaryColor;

  // 未选中的文字样式
  late final TextStyle unSelectTextStyle;

  // 选中的文字样式
  late final TextStyle selectTextStyle;
  late final pdWidth = 5.0;
  late final TabDateModel dateModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    primaryContainerColor = Theme.of(context).colorScheme.primaryContainer;
    primaryColor = Theme.of(context).colorScheme.primary;
    unSelectTextStyle = Theme.of(context)
        .textTheme
        .bodyText2!
        .copyWith(color: primaryContainerColor);
    selectTextStyle =
        Theme.of(context).textTheme.bodyText2!.copyWith(color: primaryColor);
    dateModel = TabDateModel.init();
    dateModel
      ..pdWidth = pdWidth
      ..unSelectTextStyle = unSelectTextStyle
      ..selectTextStyle = selectTextStyle;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewType =
            ref.watch(stateHomeProvider.select((value) => value.viewType));
        return Column(
          children: [
            TabBarFilterComp(model: dateModel),
            _BarBarDateHeadWidget(
              textStyle: unSelectTextStyle,
              pdWidth: pdWidth,
            ),
            SizedBox(height: 5.w,),
            dateView(viewType),
            SizedBox(height: 5.w,)
          ],
        );
      },
    );
  }

  // date 视图选择
  Widget dateView(
    HomeViewType viewType,
  ) {
    switch (viewType) {
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
}

/// 显示周期
class _BarBarDateHeadWidget extends StatelessWidget {
  const _BarBarDateHeadWidget(
      {Key? key, required this.pdWidth, required this.textStyle})
      : super(key: key);
  final double pdWidth;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
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
}
