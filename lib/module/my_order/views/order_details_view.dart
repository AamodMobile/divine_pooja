import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';
import 'package:divine_pooja/module/my_order/controllers/order_list_controller.dart';
import 'package:divine_pooja/service/api_url.dart';

class OrderDetailsView extends StatefulWidget {
  final String id;

  const OrderDetailsView({super.key, required this.id});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  OrderListController controller = Get.put(OrderListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<OrderListController>(),
      initState: (state) {
        Get.find<OrderListController>().orderDetail(widget.id);
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
                    "Order Details",
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
            body: Builder(
              builder: (context) {
                if (contextCtr.isLoading) {
                  return LoaderClass(height: MediaQuery.of(context).size.height - 100);
                }
                if (contextCtr.onData) {
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
                            "No Item Details Found ",
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
                        ],
                      ));
                }
                return Padding(
                  padding: EdgeInsets.all(14.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: semiBold,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                          margin: EdgeInsets.only(bottom: 14.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.dm),
                            border: Border.all(
                              color: borderClLightMain,
                              width: 1.w,
                            ),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.dm),
                                child: contextCtr.product.value.productImage != ""
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
                                        imageUrl: ApiUrl.imageUrl + contextCtr.product.value.productImage.toString(),
                                        placeholder: (a, b) => const Center(
                                          child: CircularProgressIndicator(
                                            color: mainColor,
                                          ),
                                        ),
                                      )
                                    : Image.asset(
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
                                    "${contextCtr.product.value.productName}",
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
                                      text: "Qty : ${contextCtr.product.value.quantity}",
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
                                      text: "₹ ${contextCtr.product.value.unitPrice}",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.h),
                          decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(image: AssetImage(subtractImg), fit: BoxFit.fill)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "#${contextCtr.order.value.orderId}",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    Text(
                                      "Total : ₹${contextCtr.order.value.amount}",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Divider(color: mainColor, height: 1.h),
                                SizedBox(height: 15.h),
                                Container(
                                  padding: EdgeInsets.all(8.h),
                                  decoration: BoxDecoration(color: const Color(0xFFFFEDDD), borderRadius: BorderRadius.circular(4.dm), border: Border.all(color: borderClLightMain)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                contextCtr.order.value.trackingId.toString(),
                                                style: TextStyle(
                                                  color: textDarkCl,
                                                  fontFamily: medium,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(width: 5.h),
                                              Image.asset(
                                                copyOutlineIc,
                                                height: 16.h,
                                                width: 16.w,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            "Tracking ID",
                                            style: TextStyle(
                                              color: borderCl,
                                              fontFamily: regular,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            contextCtr.order.value.shippingCompany.toString(),
                                            style: TextStyle(
                                              color: textDarkCl,
                                              fontFamily: medium,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                          SizedBox(height: 10.h),
                                          Text(
                                            "Shipping By",
                                            style: TextStyle(
                                              color: borderCl,
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
                                ),
                                SizedBox(height: 24.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: contextCtr.shippingStatus.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final item = entry.value;
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            item.isTrack == "1"
                                                ? Container(
                                                    height: 14.h,
                                                    width: 14.w,
                                                    decoration: const BoxDecoration(
                                                      color: mainColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.done,
                                                        color: Colors.white,
                                                        size: 6.sp,
                                                      ),
                                                    ),
                                                  )
                                                : Container(
                                                    height: 14.h,
                                                    width: 14.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: greyTextCl,
                                                        width: 10.w,
                                                      ),
                                                    ),
                                                  ),
                                            if (index < contextCtr.shippingStatus.length - 1)
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 4.w,
                                                    height: 40.h,
                                                    child: item.isTrack == "0"
                                                        ? const MySeparator(
                                                            color: hintColor,
                                                            orientation: Axis.vertical,
                                                            dash: 1.2,
                                                          )
                                                        : VerticalDivider(
                                                            width: 4.w,
                                                            color: mainColor,
                                                          ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                        SizedBox(width: 14.w),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.deliveryStatus.toString().capitalizeFirst!,
                                              style: TextStyle(
                                                color: item.isTrack == "0" ? hintColor : textDarkCl,
                                                fontFamily: medium,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 14.sp,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            if (item.isTrack == "1")
                                              Text(
                                                item.shippingTime.toString(),
                                                style: TextStyle(
                                                  color: borderCl,
                                                  fontFamily: regular,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 10.sp,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                                SizedBox(height: 14.h)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 14.h),
                        Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.dm), border: Border.all(color: borderClLightMain)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    locationNewIc,
                                    height: 20.h,
                                    width: 20.w,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    "This Order Will be Delivered To:",
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
                              SizedBox(height: 10.h),
                              Text(
                                "${controller.addressShipping.value.shippingHouseNumber} ${controller.addressShipping.value.shippingApartmentName} ${controller.addressShipping.value.nearByLandmark} ${controller.addressShipping.value.shippingCity} ${controller.addressShipping.value.shippingPostcode}",
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
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Price Details",
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
                                    "Subtotal",
                                    style: TextStyle(
                                      color: textDarkCl,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    "₹ ${contextCtr.product.value.unitPrice}",
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
                                    "₹ ${contextCtr.product.value.deliveryCharge}",
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
                                    "₹ ${contextCtr.product.value.gstAmt}",
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
                                    "₹ ${contextCtr.product.value.couponAmount}",
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
                                    "₹ ${contextCtr.product.value.amount}",
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
