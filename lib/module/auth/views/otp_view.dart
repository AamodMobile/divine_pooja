import 'package:divine_pooja/service/api_logs.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/module/home/views/home_view.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 27.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    mobileOtpTopIc,
                    height: 77.h,
                    width: 72.w,
                  ),
                  Image.asset(
                    divineLogo,
                    height: 94.h,
                    width: 102.w,
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
              Text(
                "Verify Details",
                style: TextStyle(
                  color: textDarkCl,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 18.sp,
                ),
              ),
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OTP sent to your mobile Number",
                        style: TextStyle(
                          color: borderCl,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "89478888120",
                        style: TextStyle(
                          color: borderCl,
                          fontFamily: regular,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    editIc,
                    height: 26.h,
                    width: 28.w,
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 48,
                child: PinCodeTextField(
                  cursorColor: mainColor,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  obscuringCharacter: "*",
                  textStyle: const TextStyle(
                    color: mainColor,
                    fontSize: 14,
                    fontFamily: regular,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(4.dm),
                    fieldHeight: 46.h,
                    fieldWidth: 46.w,
                    disabledColor: borderCl,
                    fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 7),
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeFillColor: Colors.white,
                    activeColor: borderCl,
                    inactiveColor: borderCl,
                    errorBorderColor: borderCl,
                    selectedColor: mainColor,
                    activeBorderWidth: 1,
                    selectedBorderWidth: 1,
                    disabledBorderWidth: 1,
                    inactiveBorderWidth: 1,
                    errorBorderWidth: 1,
                    borderWidth: 1,
                  ),
                  appContext: context,
                  length: 4,
                  onChanged: (String value) {
                    Log.console(value);
                  },
                ),
              ),
              SizedBox(
                height: 16.h
              ),
              Text(
                "Resend OTP",
                style: TextStyle(
                  color: borderCl,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                  height: 58.h
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButtonWidget(
                  onPressed: () {
                    Get.offAll(()=>const HomeView());
                  },
                  text: 'Verify',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
