
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController? cont;
  String? hint;
  Icon? suffixicon;
  CustomTextField({Key? key,required cont,required this.hint,required this.suffixicon}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Appwidth.w,
      padding: EdgeInsets.only(left:20.w,right: 20.w),
      child: TextField(
        controller: widget.cont,
        decoration: InputDecoration(
          hintText: widget.hint ?? "",
          hintStyle: TextStyle(color: AppColors.hint,fontSize: 14.sp),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: AppColors.textFieldBorder)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: AppColors.textFieldBorder)),
          suffixIcon: widget.suffixicon == null ? Icon(null): widget.suffixicon,
        ),
      ),
    );
  }
}



class PasswordTextField extends StatefulWidget {
  TextEditingController? cont;
  String? hint;
  PasswordTextField({Key? key,required cont,required this.hint}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends  State<PasswordTextField> {

  bool obsecure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Appwidth.w,
      padding: EdgeInsets.only(left:20.w,right: 20.w),
      child: TextField(
        obscureText: obsecure,
        controller: widget.cont,
        decoration: InputDecoration(
          hintText: widget.hint ?? "",
        hintStyle: TextStyle(color: AppColors.hint,fontSize: 14.sp),
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
    width: 2, color: AppColors.textFieldBorder)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 2, color: AppColors.textFieldBorder)),
          suffixIcon: InkWell(
              onTap: (){
                setState(() {
                  obsecure = !obsecure;
                });
              },
              child: Icon(
                  obsecure ?
                  Icons.visibility
            : Icons.visibility_off,color: AppColors.hint,)),
        ),
      ),
    );
  }
}
