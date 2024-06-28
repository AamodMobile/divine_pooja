import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/module/auth/views/otp_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    loginTopImg,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: -2,
                      child: Image.asset(
                        divineLogo,
                        width: 102.w,
                        height: 94.h,
                      ))
                ],
              ),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                  text: "Login ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 18.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "or",
                      style: TextStyle(
                        color: greyTextCl,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.sp,
                      ),
                    ),
                    TextSpan(
                      text: " Signup ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomTextField(
                  borderCl: borderCl,
                  borderRadius: 4.dm,
                  hintText: "Enter Mobile Number",
                ),
              ),
              SizedBox(height: 60.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomButtonWidget(
                  onPressed: () {
                    Get.to(()=>const OtpView());
                  },
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          color: Colors.white,
          child: Wrap(
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                      text: "By Signing, I Agree to ",
                      style: TextStyle(
                        color: greyTextCl,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 10.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms & Conditions",
                          style: TextStyle(
                            color: mainColor,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        TextSpan(
                          text: "  &  ",
                          style: TextStyle(
                            color: greyTextCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy.",
                          style: TextStyle(
                            color: mainColor,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
