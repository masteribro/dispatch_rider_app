import 'package:dispatch_rider_app/ui/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/const/color/app_color.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import '../screens/earnings_screesn.dart';
import '../settings/settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.navyBlue,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 10.r, right: 10.r),
            child: TextView(
              text: 'Help',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: AppColor.white,
            size: 24.sp,
          ),
          onPressed: () => PageRouter.goBack(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 35.r),
              width: MediaQuery.of(context).size.width,
              height: 150.h,
              color: AppColor.navyBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () =>
                        PageRouter.gotoWidget(const EarningsScreen(), context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.whiteGrey.withOpacity(0.2)),
                          child: SvgPicture.asset('assets/svg/statistics.svg'),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextView(
                          text: 'Earnings',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => PageRouter.gotoWidget(
                        const UserProfileScren(), context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(children: [
                            Container(
                              height: 90.h,
                              width: 90.w,
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.white),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 30,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColor.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(3.r))),
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 6.r, right: 3.r),
                                  child: Center(
                                    child: TextView(
                                      text: '4.67',
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextView(
                          text: 'James Smith',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColor.white,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.whiteGrey.withOpacity(0.2)),
                        child: SvgPicture.asset('assets/svg/wallet.svg'),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      TextView(
                        text: 'Wallet',
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColor.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            rowWidget(image: 'assets/svg/house.svg', text: 'Home'),
            rowWidget(image: '', text: 'My Subscription'),
            rowWidget(image: 'assets/svg/summary.svg', text: 'Summary'),
            rowWidget(
                image: 'assets/svg/notification.svg', text: 'Notifications'),
            rowWidget(
                image: 'assets/svg/settings.svg',
                text: 'Settings',
                voidCallback: () =>
                    PageRouter.gotoWidget(const SettingsScreen(), context)),
            rowWidget(image: '', text: 'Logout'),
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
                width: 10.h,
              ),
              TextView(
                text: text!,
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.primary50,
              )
            ],
          ),
        ),
      );
}
