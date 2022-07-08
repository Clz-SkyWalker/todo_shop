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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.dateModel.pdWidth.w),
      child: Consumer(
        builder: (context, ref, child) {
          final curDate =
              UtilTime.formatDateTime(FormatDateTime.yyyyMmDd, DateTime.now());
          widget.dateModel.dataList = UtilTime.getWeekDate(curDate);

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.dateModel.dataList.map((e) {
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
