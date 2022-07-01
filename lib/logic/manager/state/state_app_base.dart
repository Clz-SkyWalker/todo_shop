import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_shop/logic/manager/export_manager.dart';

import '../../const/app_const.dart';

class StateAppBase {
  late int theme;
  late int font;

  StateAppBase(this.theme, this.font);
}

class StateAppBaseNotifier extends StateNotifier<StateAppBase> {
  StateAppBaseNotifier(super.state);

  int get getTheme => state.theme;

  void init() async {
    var service =await getManager.getAsync<ShardService>();
    var sp=service.sp;
    state.theme = (sp.getInt(AppConst.spTheme)) ?? 0;
    state.font = sp.getInt(AppConst.spFont) ?? 0;
  }

  set updateTheme(int id) {
    state.theme = id;
    var sp = getManager.get<ShardService>().sp;
    sp.setInt(AppConst.spTheme, state.theme);
  }

  set updateFont(int id) {
    state.font = id;
    var sp = getManager.get<ShardService>().sp;
    sp.setInt(AppConst.spFont, state.font);
  }
}
