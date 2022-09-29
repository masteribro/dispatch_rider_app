import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/const/color/app_color.dart';
import '../helper/const/widget/button_widget.dart';
import 'cancel_trip_reason.dart';

class Canceldelivery extends StatefulWidget {
  const Canceldelivery({Key? key}) : super(key: key);

  @override
  State<Canceldelivery> createState() => _CanceldeliveryState();
}

class _CanceldeliveryState extends State<Canceldelivery> {
  var size,height,width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: AppColor.black,

      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            width: width,
            height: height/4,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: 16.w, top:10.0.h,right: 16.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('Cancel David\'s delivery',
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ButtonWidget(
                          background: Colors.red,
                          width: 200.w,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          buttonText: 'Yes, cancel',
                          onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) =>  const CancelTrip()
                          ));}
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ButtonWidget(
                          background: AppColor.white,
                          color: Colors.grey,
                          width: 200.w,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          buttonText: 'No',
                          onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => const Canceldelivery()
                          ));}
                      ),

                    ],
                  ),
                )



            ),
          )
        ],

      ),
    );
  }
}
