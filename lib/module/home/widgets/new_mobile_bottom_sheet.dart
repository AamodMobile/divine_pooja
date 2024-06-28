import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/module/home/widgets/otp_bottom_sheet.dart';

class NewMobileSheet {
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
                                "Enter New Phone Number",
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
                              RichText(
                                text: TextSpan(
                                  text: "NOTE:",
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: medium,
                                    fontSize: 12.sp,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          "The New Mobile Number Will Be Updated Within 48 Hours. It Won’t Affect Any Pending Orders or New Orders. You can still use the current mobile number until the update is complete."
                                              .capitalize,
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
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          CustomTextField(
                            borderCl: borderClLightMain,
                            hintText: "Enter Number",
                            labelWidget: Row(
                              children: [
                                Image.asset(
                                  mobileLineIc,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "New Mobile Number",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: medium,
                                    fontSize: 12.sp,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
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
                                    OTPSheet().show(context);
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
                                          "Send OTP For Verification",
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
