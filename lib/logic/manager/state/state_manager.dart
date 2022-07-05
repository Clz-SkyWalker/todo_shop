import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'state_app_base.dart';
import 'state_bottom_bar.dart';

// 系统状态管理
final stateAppBaseProvider =
    StateNotifierProvider<StateAppBaseNotifier, StateAppBase>(
        (ref) => StateAppBaseNotifier(StateAppBase(0, 0)));
// tab 状态管理
final stateTabProvider =
    StateNotifierProvider<StateBottomBarNotifier, StateBottomBar>(
        (ref) => StateBottomBarNotifier(StateBottomBar(index: 0,pageController: PageController())));
