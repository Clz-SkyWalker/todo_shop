import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../logic/manager/export_normal_manager.dart';

class DayViewPage extends StatefulWidget {
  const DayViewPage({Key? key}) : super(key: key);

  @override
  State<DayViewPage> createState() => _DayViewPageState();
}

class _DayViewPageState extends State<DayViewPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder:(context,ref,child) {
      final curIndex =
      ref.watch(stateTabProvider.select((value) => value.index));
      return Text('$curIndex');
    });
  }
}
