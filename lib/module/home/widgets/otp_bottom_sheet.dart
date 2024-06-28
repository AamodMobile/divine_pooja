import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/home/widgets/new_mobile_bottom_sheet.dart';
import 'package:divine_pooja/service/api_logs.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPSheet {
  Future<String?> show(BuildContext context) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        cancelFillIc,
                        color: Colors.white,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.dm),
                          topRight: Radius.circular(20.dm),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Enter OTP To Access Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: textDarkCl,
                                  fontFamily: semiBold,
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                "To Access profile Enter OTP Sent To +91 89478414",
                                style: TextStyle(
                                  color: borderCl,
                                  fontFamily: regular,
                                  fontSize: 12.sp,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
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
                                fieldOuterPadding: EdgeInsets.only(right: 14.w),
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
                          SizedBox(height: 16.h),
                          Text(
                            "Resend OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textDarkCl,
                              fontFamily: semiBold,
                              fontSize: 12.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 18.h),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: mainColor,
                            offset: Offset(0, 5),
                            blurRadius: 20,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Wrap(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    NewMobileSheet().show(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(4.dm),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Confirm",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
