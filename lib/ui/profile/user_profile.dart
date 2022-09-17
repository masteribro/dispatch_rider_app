import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/edit_form_text.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import '../settings/change_number.dart';

class UserProfileScren extends StatefulWidget {
  const UserProfileScren({Key? key}) : super(key: key);

  @override
  State<UserProfileScren> createState() => _UserProfileScrenState();
}

class _UserProfileScrenState extends State<UserProfileScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.navyBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColor.white,
            size: 24.sp,
          ),
          onPressed: () => PageRouter.goBack(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 35.r),
                    width: MediaQuery.of(context).size.width,
                    height: 150.h,
                    color: AppColor.navyBlue,
                    child: Container(
                      height: 70.h,
                      width: 70.w,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.white),
                      ),
                    )),
                Positioned(
                  top: 65,
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                    onTap: () => showModalBottomSheet<void>(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(20.r, 42.r, 20.r, 25.r),
                          height: MediaQuery.of(context).size.height * .40,
                          child: Center(
                            child: Column(
                              children: [
                                Expanded(
                                  child: EditFormText(
                                      isSignIn: true,
                                      labelText: 'First Name',
                                      fontsize: 16.sp,
                                      padding: 0.r,
                                      margin: 20.r),
                                ),
                                Expanded(
                                  child: EditFormText(
                                      isSignIn: true,
                                      labelText: 'Last Name',
                                      fontsize: 16.sp,
                                      padding: 0.r,
                                      margin: 20.r),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 17.r, bottom: 12.r),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextView(
                                        text: 'Cancel',
                                        letterSpacing: .2,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        width: 15.h,
                                      ),
                                      TextView(
                                        text: 'Save',
                                        letterSpacing: .2,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    child: Container(
                      margin: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.r))),
                      height: 185.h,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextView(
                            text: '4.89',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextView(
                                text: 'James Smith',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              SvgPicture.asset('assets/svg/pencil.svg')
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColor.whiteGrey2,
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    TextView(
                                      text: '3250',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    TextView(
                                      text: 'Total Trips',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: AppColor.whiteGrey2,
                                  thickness: 1,
                                ),
                                Column(
                                  children: [
                                    TextView(
                                      text: '2.5',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    TextView(
                                      text: 'Years',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 129.0.h,
            ),
            Column(
              children: [
                TextView(
                  text: 'PERSONAL INFO',
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 34.0.h,
                ),
                rowContUserDetails(
                    text: '09030030333',
                    image: 'assets/svg/pencil.svg',
                    voidCallback: () => PageRouter.gotoWidget(
                        const ChangeNumberScreen(), context)),
                SizedBox(
                  height: 11.0.h,
                ),
                rowContUserDetails(
                    text: 'marshy@gmail.com',
                    image: 'assets/svg/pencil.svg',
                    voidCallback: () => showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.r, 40.r, 20.r, 25.r),
                              height: MediaQuery.of(context).size.height * .25,
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Enter your email',
                                      letterSpacing: .2,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Expanded(
                                      child: EditFormText(
                                          isSignIn: true,
                                          labelText: 'Email',
                                          fontsize: 16.sp,
                                          padding: 0.r,
                                          margin: 20.r),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextView(
                                          text: 'Cancel',
                                          letterSpacing: .2,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          width: 15.h,
                                        ),
                                        TextView(
                                          text: 'Save',
                                          letterSpacing: .2,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                SizedBox(
                  height: 11.0.h,
                ),
                rowContUserDetails(
                    text: 'Phase 3, kubwa, Abuja-FCT',
                    image: 'assets/svg/pencil.svg'),
              ],
            ),
            SizedBox(
              height: 150.h,
            ),
            TextView(
              text: 'Contact us',
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }

  rowContUserDetails(
          {String? text, String? image, VoidCallback? voidCallback}) =>
      GestureDetector(
        onTap: voidCallback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: text!,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              width: 7.w,
            ),
            SvgPicture.asset(image!)
          ],
        ),
      );
}
