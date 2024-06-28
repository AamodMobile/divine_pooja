import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/module/my_order/views/order_details_view.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  List orderList=["1"];
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
                "My Order",
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
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Builder(
            builder: (context) {
              if (orderList.isEmpty) {
                return Column(
                  children: [
                    SizedBox(height: 130.h,width: MediaQuery.of(context).size.width,),
                    Image.asset(
                      noOrderImg,
                      height: 210.h,
                      width: 210.w,
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  SizedBox(height: 16.h),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 9.h),
                          margin: EdgeInsets.only(bottom: 14.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.dm),
                            border: Border.all(
                              color: borderClLightMain,
                              width: 1.w,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.dm),
                                    child: Image.asset(
                                      demoHawanImg,
                                      width: 72.w,
                                      height: 56.h,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ganapathi Homam",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "Qty : 1",
                                          style: TextStyle(
                                            color: textDarkCl,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: "₹ 190",
                                          style: TextStyle(
                                            color: textDarkCl,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10.sp,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "  ₹ 220",
                                              style: TextStyle(
                                                  color: hintColor, fontFamily: medium, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: 10.sp, decoration: TextDecoration.lineThrough),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(color: const Color(0xFFFFEDDD), borderRadius: BorderRadius.circular(6.dm)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Your Comment",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Status : ",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Tracking Update",
                                          style: TextStyle(
                                            color: hintColor,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(()=>const OrderDetailsView(),transition: Transition.rightToLeftWithFade,duration: const Duration(seconds: 1));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 22.w),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(4.dm),
                                      ),
                                      child: Text(
                                        "Track Order",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          ),
        ),
        bottomSheet: orderList.isEmpty
            ? Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.all(24.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.dm),
                topRight: Radius.circular(10.dm),
              ),
              boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 10, spreadRadius: 0, color: Colors.black.withOpacity(0.25))]),
          child: Wrap(
            children: [
              Column(
                children: [
                  SizedBox(width: MediaQuery
                      .of(context)
                      .size
                      .width),
                  SizedBox(height: 36.h),
                  Text(
                    "You have No Order",
                    style: TextStyle(
                      color: textDarkCl,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Stay tuned for exclusive offers, order status and more",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: hintColor,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 90.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24.h),
                    height: 40.h,
                    child: CustomButtonWidget(
                      onPressed: () {

                      },
                      text: "Continue Shopping",
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              )
            ],
          ),
        )
            : const SizedBox(),
      ),
    );
  }
}
