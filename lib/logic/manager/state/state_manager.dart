import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'state_app_base.dart';

// 系统状态管理
final stateAppBaseProvider =
    StateNotifierProvider((ref) => StateAppBaseNotifier(StateAppBase(0, 0)));
// tab 状态管理
final stateTabProvider = StateProvider<int>((ref) => 0);
