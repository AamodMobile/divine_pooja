import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';
import 'package:divine_pooja/module/add_address/views/add_address_view.dart';
import 'package:divine_pooja/module/check_out/controllers/cart_controller.dart';
import 'package:divine_pooja/module/check_out/widgets/address_bottom_sheet.dart';
import 'package:divine_pooja/module/home/views/home_view.dart';
import 'package:divine_pooja/module/offer/views/offer_view.dart';
import 'package:divine_pooja/service/api_url.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  CartController controller = Get.put(CartController());

  @override
  void initState() {
    controller.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<CartController>(),
      initState: (state) {
        Get.find<CartController>().cartListGet(true).then((value) {});
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
                if (contextCtr.isLoading) {
                  return LoaderClass(height: MediaQuery.of(context).size.height - 100);
                }
                if (contextCtr.cartProductList.isEmpty) {
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
                        "Your Order (${contextCtr.cartCount.value})",
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
                          itemCount: contextCtr.cartProductList.length,
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
                                        child: contextCtr.cartProductList[index].productImage != ""
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
                                                imageUrl: ApiUrl.imageUrl + contextCtr.cartProductList[index].productImage.toString(),
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
                                            contextCtr.cartProductList[index].productName.toString(),
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
                                              text: "Qty : ${contextCtr.cartProductList[index].quantity}",
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
                                              text: "₹  ${contextCtr.cartProductList[index].price.toString()}",
                                              style: TextStyle(
                                                color: textDarkCl,
                                                fontFamily: medium,
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10.sp,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: "  ₹ ${contextCtr.cartProductList[index].regularPrice.toString()}",
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
                                      GestureDetector(
                                        onTap: () {
                                          controller.deleteCartProduct(contextCtr.cartProductList[index].productId.toString());
                                        },
                                        child: Container(
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
                                                  onTap: () {
                                                    contextCtr.addCartApi(contextCtr.cartProductList[index].productId.toString(), "1", "1");
                                                  },
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
                                                      contextCtr.cartProductList[index].quantity.toString(),
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
                                                  onTap: () {
                                                    contextCtr.addCartApi(contextCtr.cartProductList[index].productId.toString(), "1", "0");
                                                  },
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
                                            ),
                                          )
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
                      const MySeparator(color: mainColor),
                      SizedBox(height: 16.h),
                      Visibility(
                          visible: contextCtr.couponList.isNotEmpty ? true : false,
                          child: Column(
                            children: [
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
                                    onTap: () async {
                                      var result = await Get.to(() => OfferView(
                                        amount: contextCtr.firstTotalAmount.toString(),
                                      ));
                                      if (result != null) {
                                        contextCtr.cartListGet(false);
                                      }
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
                                height: 100.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: contextCtr.couponList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width * 0.85,
                                      margin: EdgeInsets.only(right: 8.w),
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
                                                    contextCtr.couponApply(contextCtr.couponList[index].couponCode.toString(), contextCtr.totalAmount.toString(), "1");
                                                  } else {
                                                    contextCtr.couponApply(contextCtr.couponList[index].couponCode.toString(), contextCtr.totalAmount.toString(), "0");
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
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            "Valid til ${contextCtr.couponList[index].endDate.toString()}",
                                            maxLines: 1,
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
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 16.h),
                              const Divider(
                                color: Color(0xFFFFD3AA),
                              ),
                              SizedBox(height: 16.h),
                            ],
                          )),
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
                                onPressed: () async {
                                  if (contextCtr.addressList.isEmpty) {
                                    var result = await Get.to(() => const AddAddressView(
                                          addressId: '',
                                          isEdit: false,
                                        ));
                                    if (result != null) {
                                      contextCtr.cartListGet(false);
                                    }
                                  } else {
                                    ProblemLocationSheet().show(context, contextCtr);
                                  }
                                },
                                text: contextCtr.addressList.isEmpty ? "Add" : "Edit",
                                style: CustomButtonStyle.style3,
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      if (contextCtr.addressSelected.value != "")
                        Text(
                          contextCtr.addressSelected.value,
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
                                  "Subtotal (${contextCtr.cartCount.value} Items)",
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                Text(
                                  "₹ ${contextCtr.cartTotal.value}",
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
                                  "₹ ${contextCtr.deliveryCharge.value}",
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
                                  "₹ ${contextCtr.gstAmount.value}",
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
                                  "₹ ${contextCtr.discount.value}",
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
                                  "₹ ${contextCtr.totalAmount}",
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
                        controller: contextCtr.comment,
                        maxCheck: 3,
                        borderCl: borderClLightMain,
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                );
              }),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.cartProductList.isEmpty
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
                                    onPressed: () {
                                      Get.off(() => const HomeView());
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
                                      if (contextCtr.selectedValue.value != "") {
                                        contextCtr.saveOrder();
                                      } else {
                                        errorToast("Selected Address");
                                      }
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
      },
    );
  }
}
