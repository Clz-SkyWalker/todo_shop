import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../logic/utils/export_utils.dart';
import '../../../../../logic/manager/export_normal_manager.dart';

import 'tab_bar_date_day_item_comp.dart';

class TabDateModel {
  late List<DateTime> dataList;
  late DateTime selectDate; // 选择的日期
  late DateTime curDate; // 当前日期
  late double pdWidth; // 内边距
  late TextStyle unSelectTextStyle; // 选中的样式
  late TextStyle selectTextStyle;
  late bool reload; // 是否重新加载

  TabDateModel(
      {required this.dataList,
      required this.selectDate,
      required this.curDate,
      required this.pdWidth,
      required this.unSelectTextStyle,
      required this.selectTextStyle,
      required this.reload});

  TabDateModel.init();
}

/// 有状态
class TabBarDateMonthComp extends StatefulWidget {
  const TabBarDateMonthComp({Key? key, required this.dateModel})
      : super(key: key);

  final TabDateModel dateModel;

  @override
  State<TabBarDateMonthComp> createState() => _TabBarDateMonthCompState();
}

class _TabBarDateMonthCompState extends State<TabBarDateMonthComp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final curDate =
          UtilTime.formatDateTime(FormatDateTime.yyyyMmDd, DateTime.now());
      final selectDate = ref.read(stateHomeProvider.notifier).getSelectDate;
      widget.dateModel
        ..curDate = curDate
        ..selectDate = selectDate
        ..reload = true;
      return TabBarDateMonthAnimComp(ref: ref, dateModel: widget.dateModel);
    });
  }
}

///
class TabBarDateMonthAnimComp extends StatefulWidget {
  const TabBarDateMonthAnimComp(
      {Key? key, required this.ref, required this.dateModel})
      : super(key: key);
  final WidgetRef ref;
  final TabDateModel dateModel;

  @override
  State<TabBarDateMonthAnimComp> createState() =>
      _TabBarDateMonthAnimCompState();
}

class _TabBarDateMonthAnimCompState extends State<TabBarDateMonthAnimComp> {
  late final Map<DateTime, List<TabDateItemModel>> dataMap = {};
  late final List<DateTime> dataSort = [];
  late final PageController _controller;
  late DateTime _curMY = DateTime(2022);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _curMY = UtilTime.formatDateTime(
        FormatDateTime.yyyyMm, widget.dateModel.selectDate);
    initDataList();
    _controller = PageController(initialPage: dataSort.indexOf(_curMY));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        _curMY=ref.watch(stateHomeProvider.select((value) => value.curYM));
        if (checkUpdate(_curMY)){
          initDataList();
        }
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.dateModel.pdWidth.w),
          child: SizedBox(
            height: 250.w,
            width: double.infinity,
            child: PageView.builder(
              itemCount: dataMap.length,
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.hardEdge,
              controller: _controller,
              onPageChanged: (index) {
                _curMY = dataSort[index];
                ref.read(stateHomeProvider.notifier).switchYM(dataSort[index]);
                // _controller.jumpToPage(page)
              },
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 250.w,
                  width: 360.w,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                    ),
                    clipBehavior: Clip.hardEdge,
                    children: dataMap[_curMY]!
                        .map((e) => TabBarDateDayItemComp(dateItemModel: e))
                        .toList(),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  // 初始化数据
  void initDataList() {
    final curData = UtilTime.formatDateTime(FormatDateTime.yyyyMm, _curMY);
    final dataNow =
        UtilTime.formatDateTime(FormatDateTime.yyyyMmDd, DateTime.now());
    final dateList = UtilTime.getNextAndPreDate(curData, 2, 2);
    for (final date in dateList) {
      if (dataMap.containsKey(date)) {
        continue;
      }
      final curList = UtilTime.get35Day(date);
      final value = <TabDateItemModel>[];
      for (final e in curList) {
        final model = TabDateItemModel(
            unSelectTextStyle: widget.dateModel.unSelectTextStyle,
            selectTextStyle: widget.dateModel.selectTextStyle,
            curDate: dataNow,
            dateItem: e);
        value.add(model);
      }
      dataMap[date] = value;
      dataSort.add(date);
    }
    dataSort.sort();
  }

  /// 检查是否更新
  bool checkUpdate(DateTime curDate){
    final dateList = UtilTime.getNextAndPreDate(curDate, 2, 2);
    for (final value in dateList) {
      if (dataSort.contains(value)){
        continue;
      }
      return true;
    }
    return false;
  }
}
