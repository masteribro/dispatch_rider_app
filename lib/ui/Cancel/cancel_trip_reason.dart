import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.cancel_outlined),
                SizedBox(width: 100.w,),
                Text('Cancel Trip',
                style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold),
                ),


              ],

            ),
            Expanded(

              child: ListView.separated(
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
            )
          ],
        ),
      ),
    );
  }
}
