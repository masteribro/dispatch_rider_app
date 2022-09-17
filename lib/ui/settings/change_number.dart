import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/button_widget.dart';
import '../helper/const/widget/edit_form_text.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import '../profile/user_profile.dart';

class ChangeNumberScreen extends StatelessWidget {
  const ChangeNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColor.dark50,
            size: 24.sp,
          ),
          onPressed: () => PageRouter.goBack(context),
        ),
        centerTitle: true,
        title: TextView(
          text: 'Change Number',
          fontWeight: FontWeight.w700,
          fontSize: 17.sp,
          color: AppColor.dark50,
        ),
        backgroundColor: AppColor.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(45.r, 45.r, 45.r, 16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextView(
                text: 'Please enter correct phone number',
                fontWeight: FontWeight.w200,
                letterSpacing: .2,
                fontSize: 13.sp,
                color: AppColor.dark50,
              ),
            ),
            SizedBox(
              height: 44.h,
            ),
            TextView(
              text: 'Enter your old number',
              fontWeight: FontWeight.w400,
              letterSpacing: .2,
              fontSize: 14.sp,
              color: AppColor.black,
            ),
            SizedBox(
              height: 7.h,
            ),
            EditFormText(
                labelText: '+234 | Phone Number',
                padding: 0.r,
                margin: 15.r,
                fontsize: 14.sp),
            SizedBox(
              height: 44.h,
            ),
            TextView(
              text: 'Enter your new number',
              fontWeight: FontWeight.w400,
              letterSpacing: .2,
              fontSize: 14.sp,
              color: AppColor.black,
            ),
            SizedBox(
              height: 7.h,
            ),
            EditFormText(
                labelText: '+234 | Phone Number',
                padding: 0.r,
                margin: 15.r,
                fontsize: 14.sp),
            SizedBox(
              height: 60.h,
            ),
            Center(
              child: ButtonWidget(
                width: 200.w,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                buttonText: 'Done',
                onPressed: () =>
                    PageRouter.gotoWidget(const UserProfileScren(), context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
