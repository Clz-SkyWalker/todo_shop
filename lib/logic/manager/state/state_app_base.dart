import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_shop/logic/manager/export_manager.dart';

import '../../const/app_const.dart';

class StateAppBase {
  int theme = 0;
  int font = 0;
  void test(){

  }
}

class StateAppBaseNotifier extends StateNotifier<StateAppBase> {
  StateAppBaseNotifier(super.state);


  void init() {
    var sp = getManager.get<ShardService>().sp;
    state.theme = (sp.getInt(AppConst.theme)) ?? 0;
    state.font = sp.getInt(AppConst.font) ?? 0;
  }

  void updateTheme(int id) {
    state.theme = id;
    var sp = getManager.get<ShardService>().sp;
    sp.setInt(AppConst.theme, state.theme);
  }

  void updateFont(int id) {
    state.font = id;
    var sp = getManager.get<ShardService>().sp;
    sp.setInt(AppConst.font, state.font);
  }
}
