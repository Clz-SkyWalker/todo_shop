import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_shop/logic/manager/state/state_app_base.dart';

void initState() {
  // stateAppBaseProvider
}

final stateAppBaseProvider = StateNotifierProvider((ref) =>
    StateAppBaseNotifier(StateAppBase()));

