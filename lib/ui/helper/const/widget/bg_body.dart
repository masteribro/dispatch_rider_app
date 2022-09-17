import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/app_color.dart';

class BgBody extends StatelessWidget {
  final Widget? child;
  final bool? isAppBar;
  const BgBody({Key? key, this.child, this.isAppBar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(20.r, 85.r, 20.r, 20.r),
            decoration:BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(38.r),
                  topRight: Radius.circular(38.r),
                )),
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            child: child!,
          )),
      Positioned(
        left: 0,
        right: 0,
        top: isAppBar! ? 56 : 180,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/Run.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ]);
  }
}
