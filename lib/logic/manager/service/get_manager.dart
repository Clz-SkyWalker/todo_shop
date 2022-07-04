import 'package:get_it/get_it.dart';
import '../router/router_manager.dart';
import 'shard_manager.dart';

final getManager = GetIt.instance;

void initGetItManager() {
  getManager.registerSingleton<RouterManager>(RouterManager());
  getManager.registerSingletonAsync<ShardService>(() => ShardService().init());
}
