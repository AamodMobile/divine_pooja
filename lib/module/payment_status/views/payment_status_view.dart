import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/check_out/models/success_payment_model.dart';
import 'package:divine_pooja/module/home/views/home_view.dart';
import 'package:divine_pooja/module/my_order/views/order_details_view.dart';
import 'package:divine_pooja/service/api_url.dart';

class PaymentStatusView extends StatefulWidget {
  final SuccessPaymentModel successPaymentModel;

  const PaymentStatusView({super.key, required this.successPaymentModel});

  @override
  State<PaymentStatusView> createState() => _PaymentStatusViewState();
}

class _PaymentStatusViewState extends State<PaymentStatusView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        Get.offAll(() => const HomeView());
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
                    Get.offAll(() => const HomeView());
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
                            "Your Order # Is : ${widget.successPaymentModel.orderId}",
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
                            "${widget.successPaymentModel.address?.shippingHouseNumber} ${widget.successPaymentModel.address?.shippingApartmentName} ${widget.successPaymentModel.address?.nearByLandmark} ${widget.successPaymentModel.address?.shippingCity} ${widget.successPaymentModel.address?.shippingPostcode}",
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
                            widget.successPaymentModel.paymentMethod.toString(),
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
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.successPaymentModel.orderDetails?.length,
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
                                  Container(
                                    width: 80.w,
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.dm),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.dm),
                                      child: widget.successPaymentModel.orderDetails![index].productImage != ""
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
                                              imageUrl: ApiUrl.imageUrl + widget.successPaymentModel.orderDetails![index].productImage.toString(),
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
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${widget.successPaymentModel.orderDetails![index].productName}",
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
                                          "Qty : ${widget.successPaymentModel.orderDetails![index].quantity}",
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
                                          "₹ ${widget.successPaymentModel.orderDetails![index].totalAmount}",
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
                                          "Order Id : ${widget.successPaymentModel.orderDetails![index].orderId}",
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
                                          text: widget.successPaymentModel.orderDetails![index].deliveryStatus.toString().capitalize,
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
                                      Get.to(() => OrderDetailsView(id: widget.successPaymentModel.orderDetails![index].id.toString()),
                                          transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 300));
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
                    ),), SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
