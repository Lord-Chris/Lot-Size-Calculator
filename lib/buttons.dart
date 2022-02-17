// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.text,
    this.image,
    this.buttonColor = Colors.blueGrey,
    this.function,
    this.isImage = false,
    this.borderColor,
    this.radius = 5,
    this.textColor = Colors.white,
    this.fontSize,
    this.fontWeight,
    this.widget,
    this.height = 64,
    this.width,
    this.borderWidth,
    this.showLoader = false,
  }) : super(key: key);

  final String? text;
  final String? image;
  final Color? buttonColor;
  final Function()? function;
  final bool? isImage;
  final Color? borderColor;
  final double? radius;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? widget;
  final double? height;
  final double? width, borderWidth;
  bool showLoader;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius!),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? .5,
          ),
        ),
        child: Center(
          child: Visibility(
            visible: !showLoader,
            replacement: CircularProgressIndicator(
              color: Theme.of(context).textTheme.button!.color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget ??
                    Text(
                      text!.toUpperCase(),
                      style: TextStyle(
                        color: textColor ??
                            Theme.of(context).textTheme.button!.color,
                        fontSize: fontSize ??
                            Theme.of(context).textTheme.button!.fontSize,
                        fontWeight: fontWeight ?? FontWeight.bold,
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
