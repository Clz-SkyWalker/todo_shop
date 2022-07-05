import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../logic/manager/export_normal_manager.dart';

// 底部导航栏
class BottomNovBarComp extends StatefulWidget {
  const BottomNovBarComp({Key? key}) : super(key: key);

  @override
  State<BottomNovBarComp> createState() => _BottomNovBarCompState();
}

class _BottomNovBarCompState extends State<BottomNovBarComp> {
  final tabList = <BottomBarItemWidget>[];

  @override
  void initState() {
    super.initState();
    tabList.addAll(getBottomBar());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        return Container(
            width: double.infinity,
            height: 60.w,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabList.map((item) {
                return GestureDetector(
                  onTap: () {
                    ref
                        .read(stateTabProvider.notifier)
                        .update((state) => item.index);
                  },
                  child: item,
                );
              }).toList(),
            ));
      },
    );
  }
}

// 单个bottom bar 样式
class BottomBarItemWidget extends StatelessWidget {
  final int index;
  final BottomNavyBarItem item;
  final Curve curve;
  final Duration duration;
  final double iconWidth;
  final double iconBgWidth;
  final double bottomWidth;

  const BottomBarItemWidget({
    Key? key,
    required this.item,
    required this.index,
    required this.curve,
    required this.duration,
    required this.iconBgWidth,
    required this.bottomWidth,
    required this.iconWidth,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, ref, child) {
      final curIndex = ref.watch(stateTabProvider);
      return AnimatedContainer(
        duration: duration,
        curve: curve,
        width: index == curIndex ? bottomWidth.w : iconBgWidth.w,
        height: iconBgWidth.w,
        decoration: index == curIndex
            ? BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10))
            : BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(180)),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconWidget(context, curIndex),
              textWidget(context, curIndex),
            ]),
      );
    });
  }

  // 右边图标
  Widget iconWidget(BuildContext context, int curIndex) {
    return SizedBox(
      height: iconBgWidth.w,
      width: iconBgWidth.w,
      child: IconTheme(
          data: IconThemeData(
              size: iconWidth.w,
              color: index == curIndex
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary),
          child: item.icon),
    );
  }

  // 文字图标
  Widget textWidget(BuildContext context, int curIndex) {
    return SizedBox(
      height: iconBgWidth.h,
      child: AnimatedContainer(
        duration: duration,
        curve: curve,
        width: index == curIndex ? (bottomWidth - iconBgWidth).w : 0,
        child: Container(
          alignment: Alignment.centerLeft,
          child: DefaultTextStyle.merge(
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              // textAlign: ,
              child: item.title),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
  });

  Widget icon;
  Widget title;
}

// 获取bottom bar 数组
List<BottomBarItemWidget> getBottomBar() {
  final tabList = <BottomBarItemWidget>[];
  const curve = Curves.linear;
  const iconBgWidth = 45.0;
  const bottomWidth = 120.0;
  const iconWidth = 30.0;
  const duration = Duration(milliseconds: 300);
  tabList.add(BottomBarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag_rounded),
          title: Text(S.current.entrust)),
      index: 0,
      curve: curve,
      duration: duration,
      iconBgWidth: iconBgWidth,
      bottomWidth: bottomWidth,
      iconWidth: iconWidth));

  tabList.add(BottomBarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.shop), title: Text(S.current.shop)),
      index: 1,
      curve: curve,
      duration: duration,
      iconBgWidth: iconBgWidth,
      bottomWidth: bottomWidth,
      iconWidth: iconWidth));

  tabList.add(BottomBarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.people), title: Text(S.current.me)),
      index: 2,
      curve: curve,
      duration: duration,
      iconBgWidth: iconBgWidth,
      bottomWidth: bottomWidth,
      iconWidth: iconWidth));

  return tabList;
}
