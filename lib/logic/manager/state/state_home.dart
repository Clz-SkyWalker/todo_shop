import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class StateHome {
  const StateHome({required this.date});

  // 当前选择
  final DateTime date;

  StateHome copyWith({DateTime? date}) {
    return StateHome(
      date: date ?? this.date,
    );
  }
}

class StateHomeNotifier extends StateNotifier<StateHome> {
  StateHomeNotifier(super.state);

  void switchDate(DateTime date) {
    state = state.copyWith(date: date);
  }
}
