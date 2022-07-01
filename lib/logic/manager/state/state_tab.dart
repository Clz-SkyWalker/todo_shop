import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateTab {
  late int index;

  StateTab(this.index);
}

class StateTabNotifier extends StateNotifier<StateTab> {
  StateTabNotifier(super.state);
}
