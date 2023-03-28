
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:limpio/main.dart';
import 'package:limpio/utils/app_colors.dart';
import 'package:limpio/utils/buttons.dart';
import 'package:limpio/utils/custom_loading_bar.dart';
import 'package:limpio/utils/routes.dart';
import 'package:limpio/utils/text_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController username = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.secondary,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        elevation: 0,
        // title: Text("Login"),
        backgroundColor: AppColors.secondary,
        centerTitle: true,
      ),
      backgroundColor: AppColors.secondary,
      body: SizedBox.expand(
        child:
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Register",style: TextStyle(color: AppColors.white,fontSize: 18.sp),),
              SizedBox(height: 80.h,),
              CustomTextField(cont: username, hint: "User Name",suffixicon:null),
              SizedBox(height: 10.h,),
              CustomTextField(cont: email, hint: "Email",suffixicon:Icon(Icons.email,color: AppColors.hint,)),
              SizedBox(height: 10,),
              PasswordTextField(cont: email, hint: "Password"),
              SizedBox(height: 10,),
              loading ? Center(child: showLoader(),):
              CustomButton(width: Appwidth-40, text: "Register",ontap: ()async{
                setState(() {
                  loading = true;
                });
                await Future.delayed(
                    const Duration(seconds: 2),
                        () => Navigator.of(context).pushReplacementNamed(Routes.main_home)
                );
                setState(() {
                  loading = false;
                });
                // Navigator.of(context).pushReplacementNamed(Routes.home);
              },),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Member ",style: TextStyle(color: AppColors.hint,fontSize: 12.sp),),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacementNamed(Routes.login);
                      },
                      child: Text("Login",style: TextStyle(color: AppColors.white,fontSize: 12.sp,decoration: TextDecoration.underline,),)),
                ],
              )
            ],),
        ),
      ),
    );
  }
}
