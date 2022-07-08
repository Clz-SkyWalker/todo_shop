import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../logic/manager/export_normal_manager.dart';

class TabDateItemModel {
  DateTime curDate;
  DateTime dateItem;
  final TextStyle unSelectTextStyle;
  final TextStyle selectTextStyle;

  TabDateItemModel(
      {required this.unSelectTextStyle, required this.selectTextStyle,required this.curDate,required this.dateItem});
}

class TabBarDateDayItemComp extends StatelessWidget {
  const TabBarDateDayItemComp({Key? key, required this.dateItemModel})
      : super(key: key);

  final TabDateItemModel dateItemModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50.w,
        width: 50.w,
        child: Consumer(
          builder: (context, ref, child) {
            final selectDate = ref
                .watch(stateHomeProvider.select((value) => value.selectDate));
            final isSelect = dateItemModel.dateItem == selectDate;
            final isCur = dateItemModel.dateItem == dateItemModel.curDate;
            return TextButton(
              onPressed: () {
                ref
                    .read(stateHomeProvider.notifier)
                    .switchDate(dateItemModel.dateItem);
              },
              style: TextButton.styleFrom(
                  fixedSize: Size(50.w, 50.w),
                  backgroundColor: isSelect
                      ? Theme.of(context).colorScheme.primaryContainer
                      : (isCur
                          ? Theme.of(context).colorScheme.onPrimaryContainer
                          : Theme.of(context).colorScheme.primary),
                  splashFactory: NoSplash.splashFactory),
              child: Text(
                '${dateItemModel.dateItem.day}',
                style: isSelect
                    ? dateItemModel.selectTextStyle
                    : dateItemModel.unSelectTextStyle,
              ),
            );
          },
        ));
  }
}
