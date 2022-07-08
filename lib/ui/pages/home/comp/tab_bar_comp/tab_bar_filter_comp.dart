import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tab_bar_date_month_comp.dart';

import '../../../../../logic/manager/export_normal_manager.dart';

/// 过滤组件
class TabBarFilterComp extends StatefulWidget {
  const TabBarFilterComp({
    Key? key,
    required this.model,
  }) : super(key: key);
  final TabDateModel model;

  @override
  State<TabBarFilterComp> createState() => _TabBarFilterCompState();
}

class _TabBarFilterCompState extends State<TabBarFilterComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.model.pdWidth.w,
      ),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 5.w,
        children: [
          _FilterItemCmp(
              text: S.current.week,
              typeItem: HomeViewType.week,
              model: widget.model),
          _FilterItemCmp(
              text: S.current.month,
              typeItem: HomeViewType.month,
              model: widget.model),
        ],
      ),
    );
  }
}

/// 过滤
class _FilterItemCmp extends StatelessWidget {
  const _FilterItemCmp(
      {Key? key,
      required this.text,
      required this.typeItem,
      required this.model})
      : super(key: key);
  final String text;
  final HomeViewType typeItem;
  final TabDateModel model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectType =
            ref.watch(stateHomeProvider.select((value) => value.viewType));
        final isSelect = typeItem == selectType;
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 40.w,
            maxHeight: 25.w
          ),
          child: TextButton(
              onPressed: () {
                ref.read(stateHomeProvider.notifier).switchViewType(typeItem);
              },
              style: TextButton.styleFrom(
                padding:const  EdgeInsets.all(0),
                  fixedSize: Size(10.w,25.w),
                  // maximumSize: Size(10.w, 10.w),
                  backgroundColor: isSelect
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary,
                  side: BorderSide(
                      color: isSelect
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.primaryContainer),
                  splashFactory: NoSplash.splashFactory),
              child: Text(
                text,
                style: isSelect
                    ? Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12.sp,color: model.selectTextStyle.color,)
                    : Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 12.sp,color: model.unSelectTextStyle.color),
              )),
        );
      },
    );
  }
}
