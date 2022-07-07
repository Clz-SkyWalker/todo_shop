import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../logic/utils/export_utils.dart';
import '../../../../../logic/manager/export_normal_manager.dart';

import 'tab_bar_date_day_item_comp.dart';

class TabDateModel {
  late WidgetRef ref;
  late List<DateTime> dataList;
  late DateTime selectDate;
  late DateTime curDate;
  late double pdWidth; // 内边距
  late TextStyle unSelectTextStyle; // 选中的样式
  late TextStyle selectTextStyle;

  TabDateModel(
      {required this.ref,
      required this.dataList,
      required this.selectDate,
      required this.curDate,
      required this.pdWidth,
      required this.unSelectTextStyle,
      required this.selectTextStyle});

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
      final selectDate =
          ref.watch(stateHomeProvider.select((value) => value.selectDate));
      widget.dateModel
        ..curDate = curDate
        ..selectDate = selectDate
        ..dataList = UtilTime.get35Day(selectDate)
        ..ref = ref;
      return TabBarDateMonthAnimComp(dateModel: widget.dateModel);
    });
  }
}

/// 有动画、无状态
class TabBarDateMonthAnimComp extends StatefulWidget {
  const TabBarDateMonthAnimComp({Key? key, required this.dateModel})
      : super(key: key);

  final TabDateModel dateModel;

  @override
  State<TabBarDateMonthAnimComp> createState() =>
      _TabBarDateMonthAnimCompState();
}

class _TabBarDateMonthAnimCompState extends State<TabBarDateMonthAnimComp>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;
  late final Tween<double> tween;
  late final CurvedAnimation curveAnim;
  late HomeViewType viewType;
  late final List<TabBarDateDayItemComp> dataList = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    tween = Tween<double>(begin: 50, end: 250);
    animation = tween.animate(controller);
    curveAnim = CurvedAnimation(parent: animation, curve: Curves.linear);
    curveAnim.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    for (final e in widget.dateModel.dataList) {
      final model = TabDateItemModel(
          unSelectTextStyle: widget.dateModel.unSelectTextStyle,
          selectTextStyle: widget.dateModel.selectTextStyle)
        ..ref = widget.dateModel.ref
        ..curDate = widget.dateModel.curDate
        ..dateItem = e
        ..indexDate = widget.dateModel.selectDate;
      dataList.add(TabBarDateDayItemComp(
        dateItemModel: model,
      ));
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.dateModel.pdWidth.w),
      child: Column(
        children: [
          SizedBox(
            height: animation.value.w,
            width: double.infinity,
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              clipBehavior: Clip.hardEdge,
              children: dataList,
            ),
          ),
          loadBtnWidget(widget.dateModel.ref),
        ],
      ),
    );
  }

  Widget loadBtnWidget(WidgetRef ref) {
    return Container(
      height: 20.w,
      alignment: Alignment.center,
      child: IconButton(
        color: Theme.of(context).colorScheme.primaryContainer,
        onPressed: () {
          // ref.read(stateHomeProvider.notifier).switchViewType();
          if (controller.status == AnimationStatus.completed) {
            controller.reverse();
            return;
          }
          controller.forward();
        },
        icon: Icon(
          Icons.home_max,
          size: 13.sp,
        ),
      ),
    );
  }
}
