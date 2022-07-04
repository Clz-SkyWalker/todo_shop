import 'package:flutter/material.dart';
import '../../const/app_const.dart';

class RouterInfoParser extends RouteInformationParser<List<RouteSettings>> {
  const RouterInfoParser() : super();

  // 将一个URL地址转换成路由的状态（即配置信息）
  @override
  Future<List<RouteSettings>> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return Future.value([const RouteSettings(name: AppConst.routeHome)]);
    }

    final routeSettings = uri.pathSegments
        .map((e) => RouteSettings(
              name: '/$e',
              arguments:
                  e == uri.pathSegments.last ? uri.queryParameters : null,
            ))
        .toList();

    return Future.value(routeSettings);
  }

  // 将路由的状态（配置信息）转换为一个URL地址
  @override
  RouteInformation restoreRouteInformation(List<RouteSettings> configuration) {
    final location = configuration.last.name;
    final arguments = _restoreArguments(configuration.last);
    return RouteInformation(location: '$location$arguments');
  }

  // 获取 url 参数
  String _restoreArguments(RouteSettings routeSettings) {
    if (routeSettings.arguments == null) return '';
    final args = routeSettings.arguments as Map;
    var argStr = '?';
    args.forEach((key, value) {
      argStr += '$key=$value&';
    });
    return argStr;
  }
}
