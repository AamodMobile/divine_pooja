import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/expandable_text_widget.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/cms/views/cms_view.dart';
import 'package:divine_pooja/module/item_list/controllers/item_controller.dart';
import 'package:divine_pooja/module/item_list/views/all_review_view.dart';
import 'package:divine_pooja/service/api_url.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemDetailsView extends StatefulWidget {
  final String productId;

  const ItemDetailsView({super.key, required this.productId});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  bool isShow = false;
  bool isShow1 = false;
  ItemController controller = Get.put(ItemController());
  CarouselController carouselController = CarouselController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<ItemController>(),
      initState: (state) {
        Get.find<ItemController>().productDetails(widget.productId, true);
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
                    "Details",
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
              actions: [
                Image.asset(
                  shareOutlineIc,
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(
                  width: 15.w,
                )
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(14.w),
              child: Builder(
                builder: (context) {
                  if (contextCtr.isLoading) {
                    return LoaderClass(height: MediaQuery.of(context).size.height - 200);
                  }
                  if (contextCtr.noData) {
                    return const Column(
                      children: [],
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            contextCtr.productDetail.value.productImages != null && contextCtr.productDetail.value.productImages!.isNotEmpty
                                ? SizedBox(
                                    height: 240.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: CarouselSlider(
                                        carouselController: carouselController,
                                        options: CarouselOptions(
                                          aspectRatio: 26 / 18,
                                          autoPlay: false,
                                          enlargeCenterPage: true,
                                          viewportFraction: 1,
                                          padEnds: false,
                                          pauseAutoPlayOnTouch: true,
                                          enableInfiniteScroll: false,
                                          onPageChanged: (index, reason) {
                                            setState(() {
                                              selectedIndex = index;
                                            });
                                          },
                                        ),
                                        items: List.generate(
                                          contextCtr.productDetail.value.productImages!.length,
                                          (ind) => InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 250.h,
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.dm),
                                                boxShadow: [
                                                  BoxShadow(
                                                    offset: const Offset(0, 1),
                                                    blurRadius: 10,
                                                    spreadRadius: 0,
                                                    color: Colors.grey.withOpacity(0.05),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(20.dm),
                                                child: contextCtr.productDetail.value.productImages != null && contextCtr.productDetail.value.productImages![ind].src != ""
                                                    ? CachedNetworkImage(
                                                        errorWidget: (context, url, error) => Image.asset(
                                                          eventsImg,
                                                          height: 217.h,
                                                          width: MediaQuery.of(context).size.width,
                                                          fit: BoxFit.fill,
                                                        ),
                                                        height: 217.h,
                                                        width: MediaQuery.of(context).size.width,
                                                        fit: BoxFit.fill,
                                                        imageUrl: ApiUrl.imageUrl + contextCtr.productDetail.value.productImages![ind].src.toString(),
                                                        placeholder: (a, b) => const Center(
                                                          child: CircularProgressIndicator(
                                                            color: mainColor,
                                                          ),
                                                        ),
                                                      )
                                                    : Image.asset(
                                                        demoHawanImg,
                                                        width: MediaQuery.of(context).size.width,
                                                        fit: BoxFit.fill,
                                                      ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 217.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.dm),
                                      child: Image.asset(
                                        demoHawanImg,
                                        width: MediaQuery.of(context).size.width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                            Positioned(
                              bottom: 20,
                              right: 0,
                              left: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  contextCtr.productDetail.value.productImages!.length,
                                  (ind) => Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 2),
                                    padding: const EdgeInsets.all(5),
                                    height: 6,
                                    width: 6,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: ind == selectedIndex ? mainColor : Colors.black.withOpacity(0.20),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  contextCtr.addWishList("", widget.productId.toString(), true);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.dm),
                                  child: Image.asset(
                                    contextCtr.productDetail.value.isLike.toString() == "1" ? heartFillIc : heartIc,
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                contextCtr.productDetail.value.name.toString(),
                                style: TextStyle(
                                  color: textDarkCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            SizedBox(width: 30.h),
                            RichText(
                              text: TextSpan(
                                text: "₹ ${contextCtr.productDetail.value.price.toString()}  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 15.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: "₹ ${contextCtr.productDetail.value.regularPrice.toString()}",
                                    style: TextStyle(
                                      color: greyTextCl,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15.sp,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Visibility(
                          visible: false,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Est. arrival",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        formatDate(contextCtr.productDetail.value.createdAt.toString()),
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 40.h,
                                  width: 2.w,
                                  child: VerticalDivider(
                                    color: hintColor,
                                    width: 2.w,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delivery",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        contextCtr.productDetail.value.isDeliveryCharge == "0" ? "Free" : "Paid",
                                        style: TextStyle(
                                          color: contextCtr.productDetail.value.isDeliveryCharge == "0" ? greenCl : Colors.red,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                                  height: 40.h,
                                  width: 2.w,
                                  child: VerticalDivider(
                                    color: hintColor,
                                    width: 2.w,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Row(
                                        children: [
                                          Image.asset(
                                            starRateIc,
                                            height: 16.h,
                                            width: 16.w,
                                            color: const Color(0xFFE48606),
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            "${contextCtr.productDetail.value.averageRating == "" ? "0.0" : contextCtr.productDetail.value.averageRating.toString()} (${contextCtr.productDetail.value.ratingCount.toString()})",
                                            style: TextStyle(
                                              color: textDarkCl,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w500,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 22.h),
                        const MySeparator(
                          height: 1,
                          color: hintColor,
                        ),
                        SizedBox(height: 22.h),
                        Visibility(
                          visible: contextCtr.couponList.isEmpty ? false : true,
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
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                      color: textDarkCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 7.h),
                              SizedBox(
                                height: 80.h,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: contextCtr.couponList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      return GestureDetector(
                                        child: Container(
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
                                                    contextCtr.couponList[index].shortHeading.toString(),
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
                                                    contextCtr.couponList[index].couponName.toString(),
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
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              const Divider(color: Color(0xFFFFD3AA)),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product Information",
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
                                setState(() {
                                  isShow = !isShow;
                                });
                              },
                              child: Image.asset(
                                isShow ? upArrowIc : downArrowIc,
                                height: 24.h,
                                width: 24.w,
                              ),
                            )
                          ],
                        ),
                        isShow
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 14.h),
                                  Visibility(
                                    visible: false,
                                    child: Row(
                                      children: [
                                        Text(
                                          "Quantity",
                                          style: TextStyle(
                                            color: hintColor,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        Text(
                                          ":",
                                          style: TextStyle(
                                            color: hintColor,
                                            fontFamily: medium,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        Text(
                                          "1 Qty.",
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
                                  SizedBox(height: 10.h),
                                  ExpandableTextWidget(text: contextCtr.productDetail.value.description.toString())
                                ],
                              )
                            : const SizedBox(),
                        SizedBox(height: 10.h),
                        const Divider(
                          color: Color(0xFFFFD3AA),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery & Polices",
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
                                setState(() {
                                  isShow1 = !isShow1;
                                });
                              },
                              child: Image.asset(
                                isShow1 ? upArrowIc : downArrowIc,
                                height: 24.h,
                                width: 24.w,
                              ),
                            )
                          ],
                        ),
                        isShow1
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 14.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        rangeCalenderIc,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "Arrives in ${contextCtr.productDetail.value.deliveryEndDay} days",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        locationIc,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "Delivery From india",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        truckDeliveryIc,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        contextCtr.productDetail.value.isDeliveryCharge == "0" ? "Free Delivery" : "Paid Delivery",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18.h),
                                  Row(
                                    children: [
                                      Image.asset(
                                        tablerArrowBackIc,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                      SizedBox(width: 14.w),
                                      Text(
                                        "Returns & Exchanges: ${contextCtr.productDetail.value.isReturnAccepted == "1" ? "Accepted" : "No"}",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.h),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const CMSView(
                                            tittle: "Cancellation Policy",
                                            type: 'cancellation-policy',
                                          ));
                                    },
                                    child: Text(
                                      "See Full Cancellation and Return Policy",
                                      style: TextStyle(
                                        color: const Color(0xFF2E65E7),
                                        fontFamily: semiBold,
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                        SizedBox(height: 10.h),
                        const Divider(
                          color: Color(0xFFFFD3AA),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Rating & Reviews",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 16.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(11.dm)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    contextCtr.productRatingModel.value.averageRating.toString() == "" ? "0.0" : contextCtr.productRatingModel.value.averageRating.toString(),
                                    style: TextStyle(
                                      color: textDarkCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 32.sp,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  RatingBar.builder(
                                    initialRating:
                                        double.parse(contextCtr.productRatingModel.value.averageRating.toString() == "" ? "0.0" : contextCtr.productRatingModel.value.averageRating.toString()),
                                    ignoreGestures: false,
                                    minRating: 1,
                                    itemSize: 15.sp,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                                    itemBuilder: (context, _) => Image.asset(
                                      starRateIc,
                                      color: const Color(0xFFE48606),
                                    ),
                                    onRatingUpdate: (rating) {},
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    "${contextCtr.productRatingModel.value.averageRating.toString() == "" ? "0.0" : contextCtr.productRatingModel.value.averageRating} (${contextCtr.productRatingModel.value.totalRatings})",
                                    style: TextStyle(
                                      color: borderCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.w),
                                height: 92.h,
                                width: 1,
                                child: const VerticalDivider(
                                  color: mainColor,
                                ),
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "5",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        alignment: Alignment.center,
                                        child: LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(5),
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 8.0,
                                          percent: int.parse(contextCtr.productRatingModel.value.ratingCounts!.average5.round().toString()) / 100,
                                          progressColor: mainColor,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        "4",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        alignment: Alignment.center,
                                        child: LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(5),
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 8.0,
                                          percent: int.parse(contextCtr.productRatingModel.value.ratingCounts!.average4.round().toString()) / 100,
                                          progressColor: mainColor,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        "3",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        alignment: Alignment.center,
                                        child: LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(5),
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 8.0,
                                          percent: int.parse(contextCtr.productRatingModel.value.ratingCounts!.average3.round().toString()) / 100,
                                          progressColor: mainColor,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        "2",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        alignment: Alignment.center,
                                        child: LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(5),
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 8.0,
                                          percent: int.parse(contextCtr.productRatingModel.value.ratingCounts!.average2.round().toString()) / 100,
                                          progressColor: mainColor,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: borderCl,
                                          fontFamily: medium,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      SizedBox(width: 5.w),
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.37,
                                        alignment: Alignment.center,
                                        child: LinearPercentIndicator(
                                          padding: EdgeInsets.zero,
                                          barRadius: const Radius.circular(5),
                                          animation: true,
                                          animationDuration: 1000,
                                          lineHeight: 8.0,
                                          percent: int.parse(contextCtr.productRatingModel.value.ratingCounts!.average1.round().toString()) / 100,
                                          progressColor: mainColor,
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Visibility(
                            visible: contextCtr.feedbackList.isEmpty ? false : true,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 215.h,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: contextCtr.feedbackList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: 215.h,
                                        width: MediaQuery.of(context).size.width * 0.70,
                                        padding: EdgeInsets.all(10.h),
                                        margin: EdgeInsets.only(right: 11.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(11.dm),
                                          border: Border.all(
                                            color: const Color(0xFFFFD3AA),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(20.dm),
                                                  child: contextCtr.feedbackList[index].userProfile != ""
                                                      ? CachedNetworkImage(
                                                          errorWidget: (context, url, error) => Image.asset(
                                                            eventsImg,
                                                            height: 36.h,
                                                            width: 36.w,
                                                            fit: BoxFit.fill,
                                                          ),
                                                          height: 36.h,
                                                          width: 36.w,
                                                          fit: BoxFit.fill,
                                                          imageUrl: ApiUrl.imageUrl + contextCtr.feedbackList[index].userProfile.toString(),
                                                          placeholder: (a, b) => const Center(
                                                            child: CircularProgressIndicator(
                                                              color: mainColor,
                                                            ),
                                                          ),
                                                        )
                                                      : Image.asset(
                                                          userDefaultIc,
                                                          height: 36.h,
                                                          width: 36.w,
                                                        ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      contextCtr.feedbackList[index].userName.toString(),
                                                      style: TextStyle(
                                                        color: textDarkCl,
                                                        fontFamily: semiBold,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                    Text(
                                                      _getTimeAgo(contextCtr.feedbackList[index].createdAt!),
                                                      style: TextStyle(
                                                        color: textDarkCl,
                                                        fontFamily: regular,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Row(
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: double.parse(contextCtr.feedbackList[index].rating.toString()),
                                                  ignoreGestures: false,
                                                  minRating: 1,
                                                  itemSize: 12.sp,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: 1.w),
                                                  itemBuilder: (context, _) => Image.asset(
                                                    starRateIc,
                                                    color: const Color(0xFFE48606),
                                                  ),
                                                  onRatingUpdate: (rating) {},
                                                ),
                                                SizedBox(width: 8.w),
                                                Text(
                                                  "${contextCtr.feedbackList[index].feedback.toString()} Stars",
                                                  style: TextStyle(
                                                    color: hintColor,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 10.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.h),
                                            Text(
                                              contextCtr.feedbackList[index].feedback.toString(),
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                color: borderCl,
                                                fontFamily: medium,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: 10.sp,
                                              ),
                                            ),
                                            const Spacer(),
                                            SizedBox(
                                              height: 40.h,
                                              width: MediaQuery.of(context).size.width * 0.70,
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: contextCtr.feedbackList[index].feedbackImages?.length,
                                                itemBuilder: (BuildContext context, int ind) {
                                                  return Container(
                                                    margin: EdgeInsets.only(right: 5.w),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(5.dm),
                                                      child: contextCtr.feedbackList[index].feedbackImages != null && contextCtr.feedbackList[index].feedbackImages![ind].image != ""
                                                          ? CachedNetworkImage(
                                                              errorWidget: (context, url, error) => Image.asset(
                                                                eventsImg,
                                                                height: 40.h,
                                                                width: 40.w,
                                                                fit: BoxFit.fill,
                                                              ),
                                                              height: 40.h,
                                                              width: 40.w,
                                                              fit: BoxFit.fill,
                                                              imageUrl: ApiUrl.imageUrl + contextCtr.feedbackList[index].feedbackImages![ind].image.toString(),
                                                              placeholder: (a, b) => const Center(
                                                                child: CircularProgressIndicator(
                                                                  color: mainColor,
                                                                ),
                                                              ),
                                                            )
                                                          : Image.asset(
                                                              demoHawanImg,
                                                              height: 40.h,
                                                              width: 40.w,
                                                              fit: BoxFit.fill,
                                                            ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 80.w),
                                  height: 36.h,
                                  child: CustomButtonWidget(
                                    onPressed: () {
                                      Get.to(() => AllReviewView(id: contextCtr.productDetail.value.id.toString()), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: 300));
                                    },
                                    text: "See All review ${contextCtr.feedbackList.length}",
                                    style: CustomButtonStyle.style3,
                                    padding: EdgeInsets.zero,
                                  ),
                                ),
                                SizedBox(height: 22.h),
                              ],
                            )),
                        const Divider(color: hintColor),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  );
                },
              ),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.noData
                    ? const SizedBox()
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
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
                                      if (contextCtr.productDetail.value.isCart.toString() == "1") {
                                        Get.to(() => const CheckOutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 250));
                                      } else {
                                        contextCtr.addCartApi("",contextCtr.productDetail.value.id.toString(), "1", false,true);
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4.dm),
                                        border: Border.all(color: textDarkCl, width: 1.w),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            cartOutlineIc,
                                            color: textDarkCl,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            contextCtr.productDetail.value.isCart.toString() == "1" ? "Go To Cart" : "Add To Cart",
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
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      contextCtr.addCartApi("",contextCtr.productDetail.value.id.toString(), "1", true,true);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 7),
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(4.dm),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Buy Now",
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
  String _getTimeAgo(DateTime from) {
    Duration diff = DateTime.now().difference(from);
    if (diff.inMinutes < 1) {
      return 'just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} min ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} h ago';
    } else if (diff.inDays < 30) {
      return '${diff.inDays} d ago';
    } else if (diff.inDays < 365) {
      int months = (diff.inDays / 30).floor();
      return '$months ${months == 1 ? "month" : "months"} ago';
    } else {
      int years = (diff.inDays / 365).floor();
      return '$years ${years == 1 ? "year" : "years"} ago';
    }
  }
  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat formatter = DateFormat('dd-MM MMM');
    return formatter.format(dateTime);
  }
}
