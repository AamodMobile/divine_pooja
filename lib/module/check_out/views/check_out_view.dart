import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';
import 'package:divine_pooja/module/check_out/widgets/address_bottom_sheet.dart';
import 'package:divine_pooja/module/offer/views/offer_view.dart';
import 'package:divine_pooja/module/payment_status/views/payment_status_view.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  List cartList = ["1"];

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
                "Cart",
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
          padding: EdgeInsets.symmetric(horizontal: 13.h),
          child: Builder(builder: (context) {
            if (cartList.isEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: 130.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.asset(
                    emptyCartImg,
                    height: 210.h,
                    width: 210.w,
                  ),
                ],
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Text(
                    "Your Order (01)",
                    style: TextStyle(
                      color: textDarkCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
                          margin: EdgeInsets.only(bottom: 14.h),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6.dm), border: Border.all(color: borderClLightMain, width: 1.w)),
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
                                                  color: hintColor,
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.sp,
                                                  decoration: TextDecoration.lineThrough),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 8.h),
                              const Divider(
                                color: borderClLightMain,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                                    decoration:
                                        BoxDecoration(color: const Color(0xFFFFDFDF), border: Border.all(color: const Color(0xFFFF7777), width: 1.w), borderRadius: BorderRadius.circular(4.dm)),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          deleteIc,
                                          height: 18.h,
                                          width: 18.w,
                                        ),
                                        SizedBox(width: 9.w),
                                        Text(
                                          "Remove",
                                          style: TextStyle(
                                            color: const Color(0xFFFF7777),
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(4.dm),
                                            border: Border.all(
                                              color: greyTextCl,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.dm),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "-",
                                                      style: TextStyle(
                                                        color: mainColor,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.sp,
                                                        fontFamily: semiBold,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10.h,
                                                ),
                                                decoration: BoxDecoration(
                                                  border: Border(
                                                    left: BorderSide(
                                                      color: greyTextCl,
                                                      width: 1.w,
                                                    ),
                                                    right: BorderSide(
                                                      color: greyTextCl,
                                                      width: 1.w,
                                                    ),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "01",
                                                    style: TextStyle(
                                                      color: borderCl,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.sp,
                                                      fontFamily: semiBold,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6.dm),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "+",
                                                      style: TextStyle(
                                                        color: mainColor,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 16.sp,
                                                        fontFamily: semiBold,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const MySeparator(
                    color: mainColor,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available Offer",
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const OfferView());
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(
                    height: 80.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.all(10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
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
                                  Text(
                                    "Best Deal: 20% OFF",
                                    style: TextStyle(
                                      color: textDarkCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14.sp,
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
                  ),
                  SizedBox(height: 16.h),
                  const Divider(
                    color: Color(0xFFFFD3AA),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.h),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD7B1),
                          borderRadius: BorderRadius.circular(10.dm),
                        ),
                        child: Image.asset(
                          locationIc,
                          height: 14.h,
                          width: 14.w,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: SizedBox(
                          height: 30.h,
                          child: CustomButtonWidget(
                            onPressed: () {
                              ProblemLocationSheet().show(context);
                            },
                            text: "Edit",
                            style: CustomButtonStyle.style3,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016.....",
                    style: TextStyle(
                      color: borderCl,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  const Divider(
                    color: Color(0xFFFFD3AA),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Order Payment Details",
                    style: TextStyle(
                      color: textDarkCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(8.h),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14.dm), border: Border.all(color: borderClLightMain)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal (3 Items)",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "₹380",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        MySeparator(
                          color: hintColor,
                          height: 1.h,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Fee",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "₹00",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        MySeparator(
                          color: hintColor,
                          height: 1.h,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "₹00",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        MySeparator(
                          color: hintColor,
                          height: 1.h,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Offer Apply",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "₹00",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        MySeparator(
                          color: hintColor,
                          height: 1.h,
                        ),
                        SizedBox(height: 17.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Payment",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            Text(
                              "₹380",
                              style: TextStyle(
                                color: textDarkCl,
                                fontFamily: semiBold,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Comment",
                    style: TextStyle(
                      color: textDarkCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    hintText: "Enter Comment",
                    maxCheck: 3,
                    borderCl: borderClLightMain,
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            );
          }),
        ),
        bottomSheet: cartList.isEmpty
            ? Container(
                width: MediaQuery.of(context).size.width,
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
                        SizedBox(width: MediaQuery.of(context).size.width),
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
                            onPressed: () {},
                            text: "Continue Shopping",
                            padding: EdgeInsets.zero,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            : Container(
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
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const PaymentStatusView());
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
                                    "Confirm Order",
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
      ),
    );
  }
}
