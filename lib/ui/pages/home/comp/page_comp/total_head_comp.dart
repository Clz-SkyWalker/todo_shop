import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalHeadComp extends StatelessWidget {
  const TotalHeadComp({Key? key, required this.pdWidth}) : super(key: key);
  final double pdWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(pdWidth.w),
      width: 340.w,
      height: 120.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Theme.of(context).primaryColor.withOpacity(0.8),
          Theme.of(context).colorScheme.onPrimary.withOpacity(0.6)
        ],begin: Alignment.topRight,end: Alignment.bottomLeft),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}


