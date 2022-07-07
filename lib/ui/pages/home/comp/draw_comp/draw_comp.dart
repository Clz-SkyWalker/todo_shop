import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawComp extends StatefulWidget {
  const DrawComp({Key? key}) : super(key: key);

  @override
  State<DrawComp> createState() => _DrawCompState();
}

class _DrawCompState extends State<DrawComp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.w,
      height: double.infinity,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: const Text('data'),
    );
  }
}
