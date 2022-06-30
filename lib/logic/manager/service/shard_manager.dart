import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_shop/logic/const/app_const.dart';

class ShardService {
  late SharedPreferences sp;
  Future<ShardService> init() async {
    sp = await SharedPreferences.getInstance();

    return this;
  }
}
