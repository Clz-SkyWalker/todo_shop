import 'package:flutter/material.dart';
import '../../../ui/pages/scaffold/tab_scaffold.dart';
import '../../const/app_const.dart';

class RouterManager extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  RouterManager(){
    push(name: AppConst.routeHome);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  final List<Page> _pages = [
  ];

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    _setPath(configuration.map((e) => _createPage(e)).toList());
    return Future.value(null);
  }

  void _setPath(List<Page> pages) {
    _pages.clear();
    _pages.addAll(pages);
    notifyListeners();
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  bool _onPopPage(Route route, result) {
    if (!route.didPop(result)) return false;
    if (canPop()) {
      _pages.removeLast();
      return true;
    }
    return false;
  }

  void push({required String name, arguments}) {
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget child;
    switch (routeSettings.name) {
      case AppConst.routeHome:
        child = const TabScaffold();
        break;
      default:
        child = const TabScaffold();
    }

    return MaterialPage(
        child: child,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            content: const Text('???????????????App????'),
            actions: [
              TextButton(
                child: const Text('??????'),
                onPressed: () => Navigator.pop(context, true),
              ),
              TextButton(
                child: const Text('??????'),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          );
        });
    return result ?? true;
  }
}
