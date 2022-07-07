import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum HomeViewType {
  week,
  month,
}

@immutable
class StateHome {
  const StateHome(
      {required this.selectDate, required this.type, required this.controller});

  // 当前选择
  final DateTime selectDate;

  // 视图类型
  final HomeViewType type;

  // week<-->month 转换时的动画控制器
  final AnimationController? controller;

  StateHome copyWith(
      {DateTime? selectDate,
      HomeViewType? type,
      AnimationController? controller}) {
    return StateHome(
      selectDate: selectDate ?? this.selectDate,
      type: type ?? this.type,
      controller: controller ?? this.controller,
    );
  }
}

class StateHomeNotifier extends StateNotifier<StateHome> {
  StateHomeNotifier(super.state);

  /// 日期切换
  void switchDate(DateTime date) {
    state = state.copyWith(selectDate: date);
  }

  /// 视图切换
  void switchViewType() {
    switch (state.type) {
      // case HomeViewType.month:
      //   state = state.copyWith(type: HomeViewType.week);
      //   break;
      case HomeViewType.week:
        state = state.copyWith(type: HomeViewType.month);
        state.controller!.forward();
        break;
    }
  }

  HomeViewType get getViewType => state.type;

  set setController(AnimationController controller) =>
      state = state.copyWith(controller: controller);
}
