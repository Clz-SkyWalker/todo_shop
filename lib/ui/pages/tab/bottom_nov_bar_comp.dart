import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_shop/logic/manager/export_normal_manager.dart';

class BottomNovBarComp extends StatefulWidget {
  const BottomNovBarComp({Key? key}) : super(key: key);

  @override
  State<BottomNovBarComp> createState() => _BottomNovBarCompState();
}

class _BottomNovBarCompState extends State<BottomNovBarComp> {
  final iconsMap = {
    Icons.shopping_bag_rounded: S.current.entrust,
    Icons.shop: S.current.shop,
    Icons.people: S.current.me
  };

  final tabList = <_BarItemWidget>[
    _BarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.shopping_bag_rounded),
          title: Text(S.current.entrust)),
      index: 0,
    ),
    _BarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.shop), title: Text(S.current.shop)),
      index: 1,
    ),
    _BarItemWidget(
      item: BottomNavyBarItem(
          icon: const Icon(Icons.people), title: Text(S.current.me)),
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, ref, child) {
        return Container(
            width: double.infinity,
            height: 60.w,
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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

class _BarItemWidget extends StatelessWidget {
  final int index;
  final BottomNavyBarItem item;
  final Curve curve;
  final double iconWidth;
  final double iconBgWidth;
  final double bottomWidth;

  const _BarItemWidget({
    Key? key,
    required this.item,
    required this.index,
    this.curve = Curves.linear,
    this.iconBgWidth = 45,
    this.bottomWidth = 120,
    this.iconWidth = 30,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (ctx, ref, child) {
      int curIndex = ref.watch(stateTabProvider);
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
              SizedBox(
                height: iconBgWidth.w,
                width: iconBgWidth.w,
                child: IconTheme(
                    data: IconThemeData(
                        size: iconWidth.w,
                        color: index == curIndex
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary),
                    child: item.icon),
              ),
              SizedBox(
                height: iconBgWidth.h,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
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
              ),
              // SizedBox(width: 40.w,),
            ]),
      );
    });
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
  });

  final Widget icon;
  final Widget title;
}
