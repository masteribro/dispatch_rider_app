import 'package:dispatch_rider_app/ui/helper/const/widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/app_color.dart';

AppBar defaultAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = true,
    double? elevation = 0,
    double? leadingWidth = 90,
    Widget? leadingWidget,
    Widget? flexibleSpace,
    Color? backgroundColor,
    Color? textColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    String image = ''}) {
  return AppBar(
    leading: leadingWidget,
    bottom: PreferredSize(
        preferredSize: Size.fromHeight(4.h),
        child: Container(
          color: AppColor.whiteGrey,
          height: 4.0,
        )),
    elevation: 0,
    backgroundColor: backgroundColor,
    centerTitle: centerTitle,
    title: TextView(
      text: title,
      fontSize: 18.sp,
      color: AppColor.black,
      fontWeight: FontWeight.w600,
    ),
    actions: actions,
  );
}
