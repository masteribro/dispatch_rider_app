import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Cancel/Cancel_delivery.dart';
import '../../helper/const/color/app_color.dart';
import '../../helper/const/widget/button_widget.dart';
import '../../helper/routes/navigation.dart';
import '../../rider_details/riders_stepper_screen.dart';
import '../Trip_Details/trip_details.dart';

class Destination extends StatefulWidget {

  Destination({Key? key, }) : super(key: key);

  @override
  State<Destination> createState() => _DestinationState();
}

class _DestinationState extends State<Destination> {
  var size,height,width;
  int startJourney = 1;
  int arrived =1;
  int destinationReached = 1;
  int completed = 1;
  int delivered = 1;
  @override
  Widget build(BuildContext context) {
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
              arrived==1?Positioned(
                  top:height/60,
                  right: width/3,
                  child: Container(
                    height: height/15,
                    width: width/3,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15.r),
                    )),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(width: 5.w,),
                          Icon(Icons.cancel_outlined),
                          SizedBox(width: 2.w,),
                          Text('No Thanks',
                            style: TextStyle(fontSize: 17.sp),
                          ),
                        ],
                      ),
                    ),
                  )
              ): Positioned(
                  top:height/60,
                  right: 71.w,
                  child: Center(
                    child: Container(
                      height: height/10,
                      width: width/1.5,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(15.r),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 5.w,),
                          Icon(Icons.location_on_sharp,color: Colors.red,),
                          SizedBox(width: 2.w,),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Suite 303, Gcl Plaza, Aminu Kano Crescent, Wuse 2, Abuja',textAlign: TextAlign.justify,maxLines: 2,
                                style: TextStyle(fontSize: 17.sp,  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ),
              arrived==1?Positioned(
                bottom: 0,
                width: width,
                height: height/3,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child:

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top:16.0,right: 16.0,
                      ),
                      child: Column(
                        children: [
                          Text('25 min',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400)
                            ,
                          ),
                          SizedBox(height: 15.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:  [

                              Text('\$12.50',
                              style: TextStyle(fontSize: 15,color: Colors.grey),
                              ),
                              SizedBox(width: 10.w,),
                              Text('45km',
                                style: TextStyle(fontSize: 15,color: Colors.grey),
                              ),
                              SizedBox(width: 10.w,),
                              Text('35',
                                style: TextStyle(fontSize: 15,color: Colors.grey),
                              )
                            ],
                          ),
                          SizedBox(height: 30.h,),
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
                          SizedBox(height: 15.h,),
                          ButtonWidget(
                            background: AppColor.primary50,
                            width: 200.w,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            buttonText: 'TAP TO ACCEPT',
                            onPressed: () {
                             setState((){
                              arrived++;
                              print(arrived);
                             });
                            }
                          ),


                        ],
                      ),
                    )

                ),
              ):
             destinationReached==1? Positioned(
                bottom: 0,
                width: width,
                height: height/4.5,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child:

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top:16.0,right: 16.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('2 min', style: TextStyle(fontSize: 20.sp,
                              color: Colors.black
                              ),),

                              Text('0.5 mi',
                                style: TextStyle(fontSize: 20.sp,
                                    color: Colors.black
                                ),
                              ),
                              Icon(Icons.phone_rounded)


                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text('Picking up from James Smith ',
                              style: TextStyle(fontSize: 17.sp,
                                  color: Colors.grey
                              ),
                            )
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          ButtonWidget(
                            background: AppColor.primary50,
                            width: 200.w,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            buttonText: 'Arrived',
                            onPressed: () {
                              setState((){
                                destinationReached++;
                              });

                              print(destinationReached);
                            }
                          ),
                        ],
                      ),
                    )



                ),
              ):
             startJourney==1? Positioned(
               bottom: 0,
               width: width,
               height: height/2.3,
               child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,

                   ),
                   child:

                   Padding(
                     padding:  EdgeInsets.only(left: 16.w, top:10.0.h,right: 16.w,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Icon(Icons.keyboard_arrow_down_rounded,
                               size: 40.sp,
                             ),
                             SizedBox(width: 60.w,),
                             Text('2 min', style: TextStyle(fontSize: 20.sp,
                                 color: Colors.black
                             ),),
                             SizedBox(width: 60.w,),
                             Text('0.5 mi',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.black
                               ),
                             ),



                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Picking up James Smith',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.grey
                               ),
                             )
                           ],
                         ),
                         Divider(thickness: 0.1.h,color: Colors.grey,),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Icon(Icons.chat_rounded),

                             ElevatedButton(

                               onPressed: () {},
                               child: Icon(Icons.phone_rounded),
                               style: ElevatedButton.styleFrom(
                                 primary: Colors.blue,
                                 shape: CircleBorder(

                                 ),
                                 padding: EdgeInsets.all(24),
                               ),
                             ),
                             ElevatedButton(

                               onPressed: () {
                                 Navigator.pushReplacement(context, MaterialPageRoute(
                                     builder: (context) => const Canceldelivery()
                                 ));
                               },
                               child: Icon(Icons.phone_rounded),
                               style: ElevatedButton.styleFrom(
                                 primary: Colors.red,
                                 shape: CircleBorder(

                                 ),
                                 padding: EdgeInsets.all(24),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           children: [
                             SizedBox(width: 128.w,),
                             Text('Sender',style: TextStyle(fontSize: 10.sp)),
                             SizedBox(width: 91.w,),
                             Text('Receiver',style: TextStyle(fontSize:10.sp))
                           ],
                         ),
                         Row(

                           children: [
                             SizedBox(width: 25.w,),
                            Text('Sender',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp)),
                             SizedBox(width: 45.w,),
                            Text('David',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp)),
                             SizedBox(width: 82.w,),
                            Text('Jerry',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17.sp))
                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             ButtonWidget(
                                 background: AppColor.primary50,
                                 width: 100.w,
                                 fontSize: 14.sp,
                                 fontWeight: FontWeight.w500,
                                 buttonText: 'Arrived',
                                 onPressed: () {
                                   setState((){
                                     startJourney++;
                                   });
                                 }
                             ),
                             ButtonWidget(
                               background: Colors.red,
                                 width: 100.w,
                                 fontSize: 14.sp,
                                 fontWeight: FontWeight.w500,
                                 buttonText: 'Cancel',
                                 onPressed: () {
                                 }
                             ),
                           ],
                         )
                       ],
                     ),
                   )



               ),
             ):
             completed ==1? Positioned(
               bottom: 0,
               width: width,
               height: height/4,
               child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,

                   ),
                   child:

                   Padding(
                     padding:  EdgeInsets.only(left: 16.w, top:10.0.h,right: 16.w,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Icon(Icons.keyboard_arrow_up_rounded,
                               size: 40.sp,
                             ),
                             SizedBox(width: 60.w,),
                             Text('2 min', style: TextStyle(fontSize: 20.sp,
                                 color: Colors.black
                             ),),
                             SizedBox(width: 60.w,),
                             Text('0.5 mi',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.black
                               ),
                             ),



                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('David\'s pickup',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.grey
                               ),
                             )
                           ],
                         ),
                         Divider(thickness: 0.1.h,color: Colors.grey,),
                         SizedBox(height: 10.h,),



                         ButtonWidget(
                             background: AppColor.primary50,
                             width: 200.w,
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w500,
                             buttonText: 'Start',
                             onPressed: () {
                               setState((){
                                 completed++;
                               });
                             }
                         ),

                       ],
                     ),
                   )



               ),
             ):
             delivered==1? Positioned(
               bottom: 0,
               width: width,
               height: height/4,
               child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,

                   ),
                   child:

                   Padding(
                     padding:  EdgeInsets.only(left: 16.w, top:10.0.h,right: 16.w,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Icon(Icons.keyboard_arrow_up_rounded,
                               size: 40.sp,
                             ),
                             SizedBox(width: 60.w,),
                             Text('2 min', style: TextStyle(fontSize: 20.sp,
                                 color: Colors.black
                             ),),
                             SizedBox(width: 60.w,),
                             Text('0.5 mi',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.black
                               ),
                             ),



                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Arrived Rockdean',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.grey
                               ),
                             ),
                             SizedBox(width: 40.w),
                             InkWell(
                                 onTap: (){
                                   setState((){delivered++;});
                                 },
                                 child: Icon(Icons.phone_rounded))
                           ],
                         ),
                         Divider(thickness: 0.1.h,color: Colors.grey,),
                         SizedBox(height: 10.h,),



                         ButtonWidget(
                             background: AppColor.white,
                             width: 200.w,
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w500,
                             buttonText: 'completed',
                             onPressed: (){}
                         ),

                       ],
                     ),
                   )



               ),
             ):Positioned(
               bottom: 0,
               width: width,
               height: height/4,
               child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,

                   ),
                   child:

                   Padding(
                     padding:  EdgeInsets.only(left: 16.w, top:10.0.h,right: 16.w,
                     ),
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Icon(Icons.keyboard_arrow_up_rounded,
                               size: 40.sp,
                             ),
                             SizedBox(width: 60.w,),
                             Text('2 min', style: TextStyle(fontSize: 20.sp,
                                 color: Colors.black
                             ),),
                             SizedBox(width: 60.w,),
                             Text('0.5 mi',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.black
                               ),
                             ),



                           ],
                         ),
                         SizedBox(height: 10.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Arrived GCL Plaza',
                               style: TextStyle(fontSize: 20.sp,
                                   color: Colors.grey
                               ),
                             ),
                             SizedBox(width: 40.w),
                             InkWell(
                                 onTap: (){

                                 },
                                 child: Icon(Icons.phone_rounded))
                           ],
                         ),
                         Divider(thickness: 0.1.h,color: Colors.grey,),
                         SizedBox(height: 10.h,),



                         ButtonWidget(
                             background: AppColor.primary50,
                             width: 200.w,
                             fontSize: 14.sp,
                             fontWeight: FontWeight.w500,
                             buttonText: 'Delivered',
                             onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(
                                 builder: (context) => const TripDetails()
                             ));}
                         ),

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
