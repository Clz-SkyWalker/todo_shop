import 'package:get_it/get_it.dart';
import 'package:todo_shop/logic/manager/router/router_manager.dart';
import 'package:todo_shop/logic/manager/service/shard_manager.dart';

final getManager = GetIt.instance;

void initGetItManager() {
  getManager.registerSingleton<RouterManager>(RouterManager());
  getManager.registerSingletonAsync<ShardService>(() => ShardService().init());
}
