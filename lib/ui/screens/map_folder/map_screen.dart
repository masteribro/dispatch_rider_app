import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'destination.dart';


class MapScreen extends StatefulWidget {

   MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin{
  var size,height,width;

  bool master = true;
   AnimationController? controller;
  void navigateToNextPage(context) async {
   if(master == false){
     Timer( const Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(
         builder: (context) => Destination()
     )) );
   }else{
     null;
   }

  }
  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() {
      setState(() {});
    });
    controller!.repeat(reverse: true);
    super.initState();

  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    navigateToNextPage(context);
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
              right: width/3,
              child: Container(
            height: height/15,
              width: width/3,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15.r),
              )),
                child: Center(
                  child: Text('154.75',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.sp),
                  ),
                ),
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
              child: Text('Go'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                shape: CircleBorder(

                ),
                padding: EdgeInsets.all(24),
              ),

            ),

          ):Positioned(
           bottom:height/4.0,
           right: width/2.5,
           child:   ElevatedButton(

             onPressed: () {
               setState((){
                 master=!master;
               });
             },
             child: Text('Stop', style: TextStyle(color: Colors.red),),
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
              decoration: BoxDecoration(
                color: Colors.white,

              ),
              child: master?
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
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
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset(
                                "assets/images/acceptance.png",
                              ),
                              SizedBox(height: 10.h,),
                              Text('95.0%',
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                              SizedBox(height: 10.h,),
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
                                width: 1,
                                color: Colors.grey
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset(
                                "assets/images/rating.png",
                              ),
                              SizedBox(height: 10.h,),
                              Text('4.5', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                              SizedBox(height: 10.h,),
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
                                width: 1,
                                color: Colors.grey
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Image.asset(
                                "assets/images/cancellation.png",
                              ),
                              SizedBox(height: 10.h,),
                              Text('2.0%', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp),),
                              SizedBox(height: 10.h,),
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
              ):
              Column(
                children: [
                Padding(
                      padding: const EdgeInsets.all(12.0),
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearProgressIndicator(
                            value: controller!.value,
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
              )



            ),
          )

      ],
    ),
        )
    );

  }

}
