import 'package:dispatch_rider_app/ui/helper/const/widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonWidget extends StatefulWidget {
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
  final bool? loading;

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
    this.row = false, this.background, this.loading,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width?.w,
      // height: height?.h,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 340.w, height: 50.h),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all( widget.background),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(10.0.r),
              ))),
          onPressed: widget.onPressed,
          child:(widget.loading == true)? SpinKitWave(
            color: Colors.white,
            size: 25.0,
          ):TextView(
            text: widget.buttonText,
            fontWeight: widget.fontWeight,
            fontSize: widget.fontSize,
            color: widget.color ?? Colors.white,
            textAlign: widget.textAlign,
          ),
        ),
      ),
    );
  }
}
