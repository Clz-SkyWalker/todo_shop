import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../logic/utils/export_utils.dart';
import 'tab_bar_date_month_comp.dart';

import 'tab_bar_date_day_item_comp.dart';

class TabBarDateWeekComp extends StatefulWidget {
  const TabBarDateWeekComp({
    Key? key,
    required this.dateModel,
  }) : super(key: key);

  final TabDateModel dateModel;

  @override
  State<TabBarDateWeekComp> createState() => _TabBarDateWeekCompState();
}

class _TabBarDateWeekCompState extends State<TabBarDateWeekComp> {
  // 存储七天数据
  late final List<DateTime> dataList = [];

  @override
  Widget build(BuildContext context) {
    widget.dateModel.curDate=UtilTime.formatDateTime(FormatDateTime.yyyyMmDd, DateTime.now());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.dateModel.pdWidth.w),
      child: Consumer(
        builder: (context, ref, child) {
          dataList.clear();
          dataList.addAll(UtilTime.getWeekDate(widget.dateModel.curDate));

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: dataList.map((e) {
              final model = TabDateItemModel(
                  unSelectTextStyle: widget.dateModel.unSelectTextStyle,
                  selectTextStyle: widget.dateModel.selectTextStyle,
                  curDate: widget.dateModel.curDate,
                  dateItem: e);
              return TabBarDateDayItemComp(
                dateItemModel: model,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
