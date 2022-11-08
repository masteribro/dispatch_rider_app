import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_color.dart';

class BgBody extends StatelessWidget {
  final Widget? child;
  final bool? isAppBar;
  const BgBody({Key? key, this.child, this.isAppBar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.r, 85.r, 20.r, 0.r),
            decoration:BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                )),
            height: MediaQuery.of(context).size.height * 0.9 ,
            width: MediaQuery.of(context).size.width,
            child: child!,
          )),

    ]);
  }
}
