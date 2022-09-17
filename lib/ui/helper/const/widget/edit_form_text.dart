import 'package:dispatch_rider_app/ui/helper/const/widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/app_color.dart';

class EditFormText extends StatelessWidget {
  const EditFormText(
      {Key? key,
      this.isSignIn = false,
      this.labelText,
      this.margin,
      this.padding,
      this.fontsize})
      : super(key: key);
  final bool? isSignIn;
  final String? labelText;
  final double? margin;
  final double? padding;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding!),
      child: Container(
        margin: EdgeInsets.only(bottom: margin!),
        child: isSignIn!
            ? TextField(
                textAlign: TextAlign.start,
                cursorColor: AppColor.primary50,
                decoration: InputDecoration(
                  label: Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: TextView(
                      text: labelText ?? '',
                      fontSize: fontsize!,
                    ),
                  ),
                ))
            : TextField(
                cursorColor: AppColor.primary50,
                textAlign: TextAlign.start,
                // controller: searchCtrl,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: TextView(
                      text: labelText ?? '',
                      fontSize: fontsize!,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      width: 0.w,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(6.r),
                  fillColor: const Color.fromARGB(255, 247, 248, 248),
                ),
              ),
      ),
    );
  }
}
