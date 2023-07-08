
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

widgetButton(Text title, Function() onPressed,
    {color, height, width, margin, padding, shape}) {
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: color ?? Colors.blue,
          minimumSize: Size(width, height),
          padding: padding,
          shape: shape),
      onPressed: onPressed,
      child: title,
    ),
  );
}

widgetText(String title,
    {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      TextOverflow? overflow,
      double? letterSpacing,
      TextAlign? align}) {
  return Text(
    title,
    style: TextStyle(
      fontFamily: "Inter",
      color: color,
      fontSize: fontSize,
      letterSpacing: letterSpacing,
      fontWeight: fontWeight,
    ),
    overflow: overflow,
    textAlign: align,
  );
}

widgetTextForm(TextEditingController controller,
    String errorMsg,
    {String? hint,
      Color? colorFill,
      bool obscureText = false,
      bool validatorEmail = true
      }) {
  return Form(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validatorEmail == true ? (value) => EmailValidator.validate(value!)
          ? null
          : value.isEmpty
          ? null
          : errorMsg : null,
      onTap: () {},
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(6.0)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
            vertical: ScreenUtil().setHeight(12)),
        fillColor: colorFill ?? Colors.grey,
        filled: true,
        hintText: hint,
      ),
    ),
  );
}
