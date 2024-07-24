import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/feedback/views/give_feedback_view.dart';
import 'package:divine_pooja/module/my_order/controllers/order_list_controller.dart';
import 'package:divine_pooja/module/my_order/views/order_details_view.dart';
import 'package:divine_pooja/service/api_url.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  OrderListController controller = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<OrderListController>(),
      initState: (state) {
        Get.find<OrderListController>().orderListGet();
      },
      builder: (contextCtr) {
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
                  if (contextCtr.isLoading) {
                    return LoaderClass(height: MediaQuery.of(context).size.height - 200);
                  }
                  if (contextCtr.orderList.isEmpty) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 130.h,
                          width: MediaQuery.of(context).size.width,
                        ),
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
                          itemCount: contextCtr.orderList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => OrderDetailsView(id: contextCtr.orderList[index].id.toString()), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 300));
                              },
                              child: Container(
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
                                        Container(
                                          width: 80.w,
                                          height: 80.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10.dm),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10.dm),
                                            child: contextCtr.orderList[index].productImage != ""
                                                ? CachedNetworkImage(
                                                    errorWidget: (context, url, error) => Image.asset(
                                                      demoHawanImg,
                                                      width: 72.w,
                                                      height: 56.h,
                                                      fit: BoxFit.fill,
                                                    ),
                                                    width: 72.w,
                                                    height: 56.h,
                                                    fit: BoxFit.fill,
                                                    imageUrl: ApiUrl.imageUrl + contextCtr.orderList[index].productImage.toString(),
                                                    placeholder: (a, b) => const Center(
                                                      child: CircularProgressIndicator(
                                                        color: mainColor,
                                                      ),
                                                    ),
                                                  )
                                                : Image.asset(
                                                    demoHawanImg,
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${contextCtr.orderList[index].productName}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                "Qty : ${contextCtr.orderList[index].quantity}",
                                                style: TextStyle(
                                                  color: textDarkCl,
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                "₹ ${contextCtr.orderList[index].unitPrice}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                "Order Id : ${contextCtr.orderList[index].orderId}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: semiBold,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 8.h),
                                    if (contextCtr.orderList[index].customerNote != "")
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
                                              contextCtr.orderList[index].customerNote.toString(),
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
                                                text: contextCtr.orderList[index].deliveryStatus.toString().capitalize,
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
                                            if (contextCtr.orderList[index].deliveryStatus.toString() == "delivered") {
                                              Get.to(
                                                  () => GiveFeedBackView(
                                                        orderId: contextCtr.orderList[index].orderId.toString(),
                                                        productId: contextCtr.orderList[index].productId.toString(),
                                                      ),
                                                  transition: Transition.rightToLeftWithFade,
                                                  duration: const Duration(milliseconds: 300));
                                            } else {
                                              Get.to(() => OrderDetailsView(id: contextCtr.orderList[index].id.toString()),
                                                  transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 300));
                                            }
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 22.w),
                                            decoration: BoxDecoration(
                                              color: mainColor,
                                              borderRadius: BorderRadius.circular(4.dm),
                                            ),
                                            child: Text(
                                              contextCtr.orderList[index].deliveryStatus.toString() == "delivered" ? "Give Feedback" : "Track Order",
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
                            );
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.orderList.isEmpty
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(24.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.dm),
                            topRight: Radius.circular(10.dm),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 0),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: Colors.black.withOpacity(0.25),
                            ),
                          ],
                        ),
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
                                    onPressed: () {
                                      Get.back();
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
      },
    );
  }
}
