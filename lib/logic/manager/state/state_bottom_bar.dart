import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class StateBottomBar {
  const StateBottomBar({required this.index, required this.pageController});
   final int index;
   final PageController pageController;

  StateBottomBar copyWith({int? index, PageController? pageController}) {
    return StateBottomBar(
      index: index ?? this.index,
      pageController: pageController ?? this.pageController,
    );
  }
}

class StateBottomBarNotifier extends StateNotifier<StateBottomBar> {
  StateBottomBarNotifier(super.state);

  void switchPage(int curIndex) {
    state=state.copyWith(index: curIndex);
    state.pageController.jumpToPage(curIndex);
  }
}
