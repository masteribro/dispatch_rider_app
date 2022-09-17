import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/custom_appbar.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import 'change_password.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,
          leadingWidget: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
              size: 22.sp,
            ),
            onPressed: () => PageRouter.goBack(context),
          ),
          title: 'Settings',
          backgroundColor: AppColor.white),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(22.r),
        child: Column(
          children: [
            rowWidget(image: 'assets/svg/profile.svg', text: 'My profile'),
            rowWidget(image: 'assets/svg/vehicle.svg', text: 'My Vehicle'),
            rowWidget(
                image: 'assets/svg/per_doc.svg', text: 'Personal Document'),
            rowWidget(
                image: 'assets/svg/bank_detail.svg', text: 'Bank details'),
            rowWidget(
                image: '',
                text: 'Change password',
                voidCallback: () =>
                    PageRouter.gotoWidget(const ChangePasswordScreen(), context)),
          ],
        ),
      ),
    );
  }

  rowWidget({String? image, String? text, VoidCallback? voidCallback}) =>
      Padding(
        padding: EdgeInsets.only(left: 12.r, top: 22.r, bottom: 20.r),
        child: GestureDetector(
          onTap: voidCallback,
          child: Row(
            children: [
              image == ''
                  ? Container(
                      width: 20,
                    )
                  : SvgPicture.asset(image!),
              SizedBox(
                width: 17.h,
              ),
              TextView(
                text: text!,
                fontSize: 18.sp,
                letterSpacing: .9,
                fontWeight: FontWeight.w400,
                color: AppColor.dark50,
              )
            ],
          ),
        ),
      );
}
