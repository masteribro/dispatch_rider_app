import 'package:dispatch_rider_app/ui/helper/const/widget/button_widget.dart';
import 'package:dispatch_rider_app/ui/screens/map_folder/destination.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/const/color/app_color.dart';

class CancelTrip extends StatefulWidget {
const   CancelTrip({Key? key,}) : super(key: key);


  @override
  State<CancelTrip> createState() => _CancelTripState();
}

class _CancelTripState extends State<CancelTrip> {
  List<String> reasons = [
    "Sender isn't here",
    "Wrong address shown",
    "Don't charge rider",
    "Don't charge rider",
    "Don't charge rider",
    "Don't charge rider",
  ];
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) =>   Destination()
                        ));
                      },
                      child: Icon(Icons.cancel_outlined)),
                  SizedBox(width: 65.w,),
                  Text('Cancel Trip',
                  style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
                  ),


                ],

              ),
              SizedBox(height: 10.h,),
              ListView.separated(
                shrinkWrap: true,
                  itemCount: reasons.length,
                  itemBuilder:(context, index){
                    return ListTile(title: Text(reasons[index]),);
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.grey,
                    );
                  }
              ),
              SizedBox(height: 100.h,),
              ButtonWidget(
                  background: AppColor.primary50,
                  width: 200.w,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  buttonText: 'Done',
                  onPressed: (){}
              )


            ],
          ),
        ),
      ),
    );
  }
}
