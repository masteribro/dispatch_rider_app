import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../../../helper/const/color/app_color.dart';
import '../../../helper/const/widget/text_view.dart';
import 'chart_model.dart';

class BarGraphChart extends StatelessWidget {
  final List<BarChartModel> data;
  const BarGraphChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
          id: "Financial",
          data: data,
          domainFn: (BarChartModel series, _) => series.year!,
          measureFn: (BarChartModel series, _) => series.financial,
          colorFn: (BarChartModel series, _) => series.color!),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25.h,
          ),
          TextView(
            text: 'Mon, 18 Feb’19',
            color: AppColor.spaceGrey,
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
          TextView(
            text: '₦154.75',
            color: AppColor.primary50,
            fontSize: 23.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: charts.BarChart(
                series,
                animate: true,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.5.w, color: AppColor.whiteGrey2),
                    right: BorderSide(width: 1.5.w, color: AppColor.whiteGrey2),
                  ),
                ),
                child: Column(
                  children: [
                    TextView(
                      text: '45',
                      color: AppColor.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    TextView(
                      text: 'Trips',
                      color: AppColor.spaceGrey,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.5.w, color: AppColor.whiteGrey2),
                    right: BorderSide(width: 1.5.w, color: AppColor.whiteGrey2),
                  ),
                ),
                child: Column(
                  children: [
                    TextView(
                      text: '45:30',
                      color: AppColor.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    TextView(
                      text: 'Online hrs',
                      color: AppColor.spaceGrey,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.w),
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.5.w, color: AppColor.whiteGrey2),
                  ),
                ),
                child: Column(
                  children: [
                    TextView(
                      text: '₦99.04',
                      color: AppColor.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    TextView(
                      text: 'Cash Trips',
                      color: AppColor.spaceGrey,
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          bottomRow(title: 'Trip fares', amount: '₦40.25'),
          bottomRow(title: 'YelowTaxi Fee', amount: '₦20.25'),
          bottomRow(title: '+Tax', amount: '₦400.25'),
          bottomRow(title: '+Tolls', amount: '₦400.25'),
          bottomRow(title: 'Surge', amount: '₦40.25'),
          bottomRow(title: 'Discount(-)', amount: '₦20.25'),
          Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 4.w,
            ),
            child: Divider(
              color: AppColor.spaceGrey,
            ),
          ),
          bottomRow(
              title: 'Total Earnings',
              amount: '₦460.32',
              color: AppColor.primary50),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }

  bottomRow({String? title, String? amount, Color? color}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: title ?? '',
              color: color ?? AppColor.spaceGrey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
            TextView(
              text: amount ?? '',
              color: color ?? AppColor.spaceGrey,
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      );
}
