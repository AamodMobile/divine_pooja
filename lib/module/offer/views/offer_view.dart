import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferView extends StatefulWidget {
  const OfferView({super.key});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  int selectedValue=-1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: homeBgCl,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  arrowBackIc,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
              SizedBox(width: 14.w),
              Text(
                "Offer & Vouchers",
                style: TextStyle(
                  color: textDarkCl,
                  fontFamily: medium,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                "Have a Code Here",
                style: TextStyle(
                  color: textDarkCl,
                  fontFamily: semiBold,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Enter Code Here",
                      borderCl: borderClLightMain,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 11.h,horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(8.dm),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Redeem",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: medium,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.h),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 14.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      color:  selectedValue == index ?const Color(0xFFFFEDDD):Colors.white,
                      borderRadius: BorderRadius.circular(10.dm),
                      border: Border.all(
                        color: const Color(0xFFD2B89F),
                        width: 1.w,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              offerIc,
                              height: 24.h,
                              width: 24.w,
                            ),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Text(
                                "Best Deal: 20% OFF",
                                style: TextStyle(
                                  color: textDarkCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedValue = index;
                                });
                              },
                              child: Image.asset(
                                selectedValue == index ? circleSelectIc : circleDefultIc,
                                height: 18.h,
                                width: 18.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Text(
                              "20DEALS",
                              style: TextStyle(
                                color: hintColor,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Container(
                              height: 4.h,
                              width: 4.w,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: const BoxDecoration(color: borderCl, shape: BoxShape.circle),
                            ),
                            Text(
                              "Min spend ₹ 190",
                              style: TextStyle(
                                color: hintColor,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Container(
                              height: 4.h,
                              width: 4.w,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: const BoxDecoration(color: borderCl, shape: BoxShape.circle),
                            ),
                            Text(
                              "Valid til 12/07/2024",
                              style: TextStyle(
                                color: hintColor,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 60.w, vertical: 20.h),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
