import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/my_order/views/my_order_view.dart';

class PaymentStatusView extends StatefulWidget {
  const PaymentStatusView({super.key});

  @override
  State<PaymentStatusView> createState() => _PaymentStatusViewState();
}

class _PaymentStatusViewState extends State<PaymentStatusView> {
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
                "Payment Done",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 22.h),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.dm)),
                  child: Column(
                    children: [
                      Image.asset(
                        doneGif,
                        height: 136.h,
                        width: 162.w,
                      ),
                      SizedBox(height: 17.h),
                      Text(
                        "Order Successfully!",
                        style: TextStyle(
                          color: greenCl,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 17.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "Payment is successfully Processed And Your Order In On the Way",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Divider(
                        color: borderClLightMain,
                        height: 1.h,
                      ),
                      SizedBox(height: 12.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Order Details",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Order # Is : 6445874114",
                          style: TextStyle(
                            color: hintColor,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "This Order Will be Shipped To:",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Vaishali Tower 2nd Nursery Circle Vaishali Nagar Jaipur 302021",
                          style: TextStyle(
                            color: hintColor,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment Methed:",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Google pay UPI",
                          style: TextStyle(
                            color: hintColor,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h),
                Container(
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
                            onTap: (){

                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 7.h,horizontal: 22.w),
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
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
