import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum HomeViewType {
  week,
  month,
}

@immutable
class StateHome {
  const StateHome({
    required this.selectDate,
    required this.curYM,
    required this.viewType,
  });

  // 当前选择
  final DateTime selectDate; // 当前年月日
  final DateTime curYM; // 当前年月

  // 视图类型
  final HomeViewType viewType;

  StateHome copyWith({
    DateTime? selectDate,
    HomeViewType? viewType,
    DateTime? curYM,
  }) {
    final year = (selectDate ?? this.selectDate).year;
    final month = (selectDate ?? this.selectDate).month;
    return StateHome(
      selectDate: selectDate ?? this.selectDate,
      curYM: curYM ?? DateTime(year, month),
      viewType: viewType ?? this.viewType,
    );
  }
}

class StateHomeNotifier extends StateNotifier<StateHome> {
  StateHomeNotifier(super.state);

  HomeViewType get getViewType => state.viewType;

  DateTime get getSelectDate => state.selectDate;

  /// 日期切换
  void switchDate(DateTime date) {
    state = state.copyWith(selectDate: date);
  }

  void switchYM(DateTime date) {
    state = state.copyWith(curYM: date);
  }

  /// 视图切换
  void switchViewType(HomeViewType typeItem) {
    switch (typeItem) {
      case HomeViewType.month:
        state = state.copyWith(viewType: HomeViewType.month);
        break;
      case HomeViewType.week:
        state = state.copyWith(viewType: HomeViewType.week);
        break;
    }
  }
}
