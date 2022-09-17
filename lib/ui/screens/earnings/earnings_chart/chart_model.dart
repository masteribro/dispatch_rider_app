import 'package:charts_flutter/flutter.dart' as charts;

import '../../../helper/const/color/app_color.dart';

class BarChartModel {
  String? month;
  String? year;
  int? financial;
  charts.Color? color;
  BarChartModel({
    this.month,
    this.year,
    this.financial,
    this.color,
  });
}

final List<BarChartModel> data = [
  BarChartModel(
    year: "M",
    financial: 45,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
  BarChartModel(
    year: "T",
    financial: 60,
    color:charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "W",
    financial: 40,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
  BarChartModel(
    year: "TH",
    financial: 65,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
  BarChartModel(
    year: "F",
    financial: 73,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
  BarChartModel(
    year: "S",
    financial: 100,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
  BarChartModel(
    year: "SU",
    financial: 80,
    color: charts.ColorUtil.fromDartColor(AppColor.whiteGrey),
  ),
];

final List<BarChartModel> data1 = [
  BarChartModel(
    year: "M",
    financial: 45,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "T",
    financial: 60,
    color:charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "W",
    financial: 40,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "TH",
    financial: 65,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "F",
    financial: 73,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "S",
    financial: 100,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
  BarChartModel(
    year: "SU",
    financial: 80,
    color: charts.ColorUtil.fromDartColor(AppColor.primary50),
  ),
];
