import 'dart:async';

import 'package:dispatch_rider_app/ui/helper/const/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/const/widget/text_view.dart';
import '../../profile/profile_screen.dart';
import 'destination.dart';


class MapScreen extends StatefulWidget {

   MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin{
  var size,height,width;

  bool master = true;

  void navigateToNextPage(context) async {
   if(master == true){
     Timer( const Duration(seconds: 20), () => Navigator.push(context, MaterialPageRoute(
         builder: (context) => Destination()
     )) );
   }else{
     null;
   }

  }

  @override
  Widget build(BuildContext context) {
    // navigateToNextPage(context);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
      children: [
          Image.asset(
            "assets/images/mapimage.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            top:height/60,

              child: Row(
                children: [
                  SizedBox(width: 120.w,),

                  Container(
            height: height/15,
                  width: width/3,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15.r),
                  )),
                    child: Center(
                      child: TextView(text:'154.75',
                          fontWeight: FontWeight.bold,fontSize: 20.sp,
                      ),
                    ),
            ),
                  SizedBox(width: 60.w,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) =>  ProfileScreen()
                      ));
                    },
                    child: CircleAvatar(
                      radius: 30.r,
                      backgroundColor: AppColor.white,
                    ),
                  )
                ],
              )
          ),
         master? Positioned(
            bottom:height/4.0,
            right: width/2.5,
            child:   ElevatedButton(

              onPressed: () {
                setState((){
                  master=!master;
                });
              },
              child: TextView(text: 'Go'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: CircleBorder(

                ),
                padding: EdgeInsets.all(24),
              ),

            ),

          ):
         Positioned(
           bottom:height/4.0,
           right: 120.w,
           child:   ElevatedButton(

             onPressed: () {
               setState((){
                 master=!master;
               });
             },
             child: TextView(text:'Stop', color: Colors.red,),
             style: ElevatedButton.styleFrom(
               primary: Colors.white,
               shape: CircleBorder(

               ),
               padding: EdgeInsets.all(24),
             ),

           ),

         ),
            master? SizedBox():
            Positioned(
              bottom:height/4.0,
              child: Image.asset(
                "assets/images/boy.png",
              ),
            ),
          Positioned(
            bottom: 0,
            width: width,
            height: height/4.2,
            child: Container(
                width: width,
                height: height/4.2,
              decoration: BoxDecoration(
                color: Colors.white,

              ),
              child: master?
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 12.w,right: 12.w,top: 12.w,bottom: 12.w),
                      child: Row(
                        children: [
                          Icon(Icons.keyboard_arrow_down_rounded, size: 50.sp,),
                          SizedBox(width: 64.w ,),
                          Text('You are offline',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),)
                        ],
                      ),
                    ),


                    Container(
                      height: height/7.3,
                      width: width,
                      child: Row(
                        children: [
                          Container(
                            width: width/3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                Image.asset(
                                  "assets/images/acceptance.png",
                                ),

                                Text('95.0%',
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),

                                Text('Acceptance',
                                  style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width/3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w,
                                  color: Colors.grey
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

                                SizedBox(
                                  height: 5.h,
                                ),
                                Image.asset(
                                  "assets/images/rating.png",
                                ),
                                SizedBox(height: 10.h,),
                                Text('4.5', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                                SizedBox(height: 8.h,),
                                Text('Ratings',
                                  style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width/3,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.w,
                                  color: Colors.grey
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                ),
                                Image.asset(
                                  "assets/images/cancellation.png",
                                ),

                                Text('2.0%', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),

                                Text('Cancellation',
                                  style: TextStyle(fontSize: 17.sp, color: Colors.grey),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ):
              SingleChildScrollView(
                child: Column(
                  children: [
                  Padding(
                        padding:  EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h,bottom: 12.h),
                        child: Row(
                          children: [
                            Icon(Icons.keyboard_arrow_up_rounded, size: 50.sp,),
                            SizedBox(width: 64.w ,),
                            Text('Finding Pickups',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),),

                          ],
                        ),
                      ),
                    Container(
                      height: height/7.3,
                      width: width,
                      color: Colors.white12,
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.w,right: 10.w,top: 10.h,bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearProgressIndicator(

                              color: Colors.green,
                              backgroundColor: Colors.greenAccent,

                            ),
                            SizedBox(height: 3.h,),
                            Text('Opportunity near by ',
                            style: TextStyle(color: Colors.greenAccent, fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            Text('More request than usual',
                              style: TextStyle(color: Colors.grey, fontSize: 20.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )



            ),
          )

      ],
    ),
        )
    );

  }

}
