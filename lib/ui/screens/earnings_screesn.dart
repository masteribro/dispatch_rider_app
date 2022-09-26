import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/const/color/app_color.dart';
import '../helper/const/widget/text_view.dart';
import '../helper/routes/navigation.dart';
import 'earnings/earnings_today_screen.dart';
import 'earnings/earnings_weekly_screen.dart';
import 'map_folder/map_screen.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          elevation: 0,
          centerTitle: true,
          title: TextView(
            text: 'Earnings',
            color: AppColor.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          actions: [
            InkWell(
              onTap:() =>  PageRouter.gotoWidget( MapScreen(), context),
              child: Padding(
                padding: EdgeInsets.only(top: 10.r, right: 10.r),
                child: Container(
                  padding: EdgeInsets.only(left: 10.r, right: 6.5.r),
                  margin: EdgeInsets.only(top: 3.r, bottom: 3.r),
                  decoration: BoxDecoration(
                      color: AppColor.whiteGrey2.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      TextView(
                        text: 'Normal',
                        color: AppColor.primary50,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.primary50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColor.black,
              size: 24.sp,
            ),
            onPressed: () => PageRouter.goBack(context),
          ),
          bottom: TabBar(
            indicatorColor: AppColor.primary50,
            tabs: [
              Tab(
                child: TextView(
                  text: 'TODAY',
                  color: AppColor.primary50,
                ),
              ),
              Tab(
                child: TextView(
                  text: 'WEEKLY',
                  color: AppColor.primary50,
                ),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EarningsTodayScreen(),
            EarningsWeeklyScreen(),
          ],
        ),
      ),
    );
  }
}
