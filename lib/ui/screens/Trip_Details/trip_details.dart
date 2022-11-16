import 'package:dispatch_rider_app/ui/helper/const/color/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../map_folder/destination.dart';
import '../map_folder/map_screen.dart';

class TripDetails extends StatefulWidget {
  const TripDetails({Key? key}) : super(key: key);

  @override
  State<TripDetails> createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  var size,height,width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                child: Container(child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap:(){Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => MapScreen()
                        ));},
                          child: Icon(Icons.cancel_outlined)

                      ),
                      Text('Trip Details',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold), ),
                      Text('Help',style: TextStyle(color: AppColor.primary50),),
                    ],

                  ),
                  SizedBox(height: 10.h,),
                  const Divider(),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, color: Colors.blueAccent,),
                      SizedBox(width: 10.w,),
                      Text('1 Ash Park, Pembroke Dock, SA72')
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Icon(Icons.location_on_sharp, color: Colors.red,),
                      SizedBox(width: 10.w,),
                      Text('54 Hollybank Rd, Southampton')
                    ],
                  ),
                  SizedBox(height: 50.h,),
                  Center(child: Image.asset('assets/images/journey.png')),
                  SizedBox(height: 30.h,),
                  Center(child: Text('154.74',style: TextStyle(fontSize: 20.sp,color: AppColor.primary50),)),
                  SizedBox(height: 20.h,),
                  Center(child: Text('Payment made sucessfully by Cash',style: TextStyle(fontSize: 17.sp, color: AppColor.spaceGrey),)),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Expanded(child: Container(

                        child: Column(
                          children: [
                            SizedBox(height: 8.h,),
                            Text('15 min',style: TextStyle(fontSize: 20.sp,)),
                            SizedBox(height: 2.h,),
                            Text('Time',style: TextStyle(fontSize: 17.sp, color: AppColor.spaceGrey),)
                          ],
                        ),

                        height: 70.h,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1.w)),
                      )),
                      Expanded(child: Container(

                        child: Column(
                          children: [
                            SizedBox(height: 8.h,),
                            Text('45 min',style: TextStyle(fontSize: 20.sp,)),
                            SizedBox(height: 2.h,),
                            Text('Distance',style: TextStyle(fontSize: 17.sp, color: AppColor.spaceGrey),)
                          ],
                        ),
                        height: 70.h,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1.w)),
                      )),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Text('Date & Time',style: TextStyle(fontSize: 15.sp)),
                      SizedBox(width: 30.w,),
                      Text("14 Feb'19 at 9:42",style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Text('Service Type',style: TextStyle(fontSize: 15.sp)),
                      SizedBox(width: 30.w,),
                      Text('Sedan',style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(children: [
                    Text('Trip Type',style: TextStyle(fontSize: 15.sp)),
                    SizedBox(width: 30.w,),
                    Text('Normal',style: TextStyle(fontSize: 15.sp)),
                  ],),
                  SizedBox(height: 30.h,),
                  Divider(color: Colors.black12,),
                  Row(
                    children: [
                      Text('You rated "JohnDoe"', style: TextStyle(fontSize: 15.sp),),
                      SizedBox(height: 10.h,),

                    ],
                  ),
                ],),),
              ),

              Container(

                child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w, top: 15.0.h),
                  child: Text('Receipt',style: TextStyle(fontSize: 15.sp),),
                ),
                height: 50.h,
                width: width,
                color: AppColor.spaceGrey,

              ),
              Padding(
                padding:  EdgeInsets.only(left: 15.w,right: 15.w,top: 10.h,bottom: 10.h),
                child: Container(
                  child: Column(children: [
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Trip fares',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$40.25',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Yellow Taxi Fee',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$20.00',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+Tax',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$400.00',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('+Tolls',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$400.25',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$40.25',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Topup Added',style: TextStyle(fontSize: 15.sp,color: AppColor.spaceGrey)),
                        Text('\$40.25',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 7.h,),
                    Divider(),
                    SizedBox(height: 7.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Your Payment',style: TextStyle(fontSize: 15.sp,color: AppColor.primary50)),
                        Text('\$460.25',style: TextStyle(fontSize: 15.sp, color: AppColor.spaceGrey)),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                  ],),
                ),
              ),







            ],
          ),
        ),
      ),
    );
  }
}
