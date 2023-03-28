
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/utils/custom_loading_bar.dart';
import 'package:limpio/utils/routes.dart';

class CustomButton extends StatefulWidget {
  int width;
  String text;
  VoidCallback ontap;
  CustomButton({Key? key,required this.width,required this.text,required this.ontap}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  // bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap:
          // loading ? (){}:
      widget.ontap,
    //     ()async{
          //   setState(() {
          //     loading = true;
          //   });
          //   widget.ontap.call();
          //   setState(() {
          //     loading = false;
          //   });
          // },
          child:
          // loading ? Center( child: showLoader(),):
          Container(
            padding: EdgeInsets.symmetric(vertical: 18),
            color: AppColors.black,
            width: widget.width.w,
            child:
            Text(widget.text,style: TextStyle(fontSize: 17.sp,color: AppColors.white),textAlign: TextAlign.center,),

          ),
        ),
      ],
    );
  }
}

