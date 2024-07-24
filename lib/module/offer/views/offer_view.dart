import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/offer/controllers/coupon_list_controller.dart';

class OfferView extends StatefulWidget {
  final String amount;

  const OfferView({super.key, required this.amount});

  @override
  State<OfferView> createState() => _OfferViewState();
}

class _OfferViewState extends State<OfferView> {
  CouponListController controller = Get.put(CouponListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<CouponListController>(),
      initState: (state) {
        Get.find<CouponListController>().couponListGet();
      },
      builder: (contextCtr) {
        return WillPopScope(
          onWillPop: () async {
            bool willLeave = false;
            Get.back(result: "200");
            return willLeave;
          },
          child: SafeArea(
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
                padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                          padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 15.w),
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
                    Builder(builder: (context) {
                      if (contextCtr.isLoading) {
                        return LoaderClass(height: MediaQuery.of(context).size.height - 200);
                      }
                      if (contextCtr.couponList.isEmpty) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 200,
                            padding: EdgeInsets.all(24.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.dm),
                                  topRight: Radius.circular(10.dm),
                                ),
                                boxShadow: [BoxShadow(offset: const Offset(0, 0), blurRadius: 10, spreadRadius: 0, color: Colors.black.withOpacity(0.25))]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: MediaQuery.of(context).size.width),
                                SizedBox(height: 36.h),
                                Text(
                                  "No Item Found ",
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
                                      Get.back();
                                    },
                                    text: "Continue Shopping",
                                    padding: EdgeInsets.zero,
                                  ),
                                )
                              ],
                            ));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: contextCtr.couponList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 14.h),
                            padding: EdgeInsets.all(10.h),
                            decoration: BoxDecoration(
                              color: contextCtr.couponList[index].isApplied == true ? const Color(0xFFFFEDDD) : Colors.white,
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
                                        contextCtr.couponList[index].couponName.toString(),
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
                                        if (contextCtr.couponList[index].isApplied == true) {
                                          contextCtr.couponApply(contextCtr.couponList[index].couponCode.toString(), widget.amount, "1");
                                        } else {
                                          contextCtr.couponApply(contextCtr.couponList[index].couponCode.toString(), widget.amount, "0");
                                        }
                                      },
                                      child: Image.asset(
                                        contextCtr.couponList[index].isApplied == true ? circleSelectIc : circleDefultIc,
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
                                      contextCtr.couponList[index].couponCode.toString(),
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
                                      "Min spend ₹ ${contextCtr.couponList[index].cartValue.toString()}",
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
                                      "Valid til ${contextCtr.couponList[index].endDate.toString()}",
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
                      );
                    })
                  ],
                ),
              ),
              bottomSheet: contextCtr.isLoading
                  ? const SizedBox()
                  : contextCtr.couponList.isEmpty
                      ? const SizedBox()
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
                                        Get.back(result: "200");
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
            ),
          ),
        );
      },
    );
  }
}
