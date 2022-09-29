import 'package:dispatch_rider_app/ui/helper/const/widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/app_color.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final Color? background;
  final double fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Color? primary;
  final Color? borderColor;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;
  final String? icon;
  final double? elevation;
  final bool? buttonStyle;
  final bool? row;

  const ButtonWidget({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.left,
    this.color,
    this.icon,
    this.borderColor,
    this.height,
    this.width,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.w700,
    this.radius = 5.0,
    this.elevation = .0,
    this.fontStyle = FontStyle.normal,
    this.primary,
    this.buttonStyle = false,
    this.row = false, this.background,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      // height: height?.h,
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 340, height: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( background),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: onPressed,
          child: TextView(
            text: buttonText,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color ?? Colors.white,
            textAlign: textAlign,
          ),
        ),
      ),
    );
  }
}
