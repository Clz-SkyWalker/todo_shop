import 'package:shared_preferences/shared_preferences.dart';

class ShardService {
  late SharedPreferences sp;
  Future<ShardService> init() async {
    sp = await SharedPreferences.getInstance();
    return this;
  }
}
