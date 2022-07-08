import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/export_utils.dart';
import 'state_app_base.dart';
import 'state_bottom_bar.dart';
import 'state_home.dart';

// 系统状态管理
final stateAppBaseProvider =
    StateNotifierProvider<StateAppBaseNotifier, StateAppBase>(
        (ref) => StateAppBaseNotifier(StateAppBase(0, 0)));
// tab 状态管理
final stateTabProvider =
    StateNotifierProvider<StateBottomBarNotifier, StateBottomBar>((ref) =>
        StateBottomBarNotifier(
            StateBottomBar(index: 0, pageController: PageController())));

// home page
final stateHomeProvider = StateNotifierProvider<StateHomeNotifier, StateHome>(
    (ref) => StateHomeNotifier(StateHome(
        selectDate:
            UtilTime.formatDateTime(FormatDateTime.yyyyMmDd, DateTime.now()),
        viewType: HomeViewType.month,
        curYM: DateTime(DateTime.now().year, DateTime.now().month))));
