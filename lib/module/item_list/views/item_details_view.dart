import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/expandable_text_widget.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/item_list/views/all_review_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key});

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  bool isShow = false;
  bool isShow1 = false;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    demoHawanImg,
                    height: 217.h,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Varalakshmi Vratham",
                  style: TextStyle(
                    color: textDarkCl,
                    fontFamily: medium,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                RichText(
                  text: TextSpan(
                    text: "₹ 190  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: semiBold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 15.sp,
                    ),
                    children: [
                      TextSpan(
                        text: "₹ 220",
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
                SizedBox(height: 16.h),
                Container(
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
                              "03-16 Jun",
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
                              "Free",
                              style: TextStyle(
                                color: greenCl,
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
                                  "4.6 (120)",
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
                SizedBox(height: 22.h),
                const MySeparator(
                  height: 1,
                  color: hintColor,
                ),
                SizedBox(height: 22.h),
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
                SizedBox(height: 22.h),
                const Divider(
                  color: Color(0xFFFFD3AA),
                ),
                SizedBox(height: 22.h),
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
                          Row(
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
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                "Material",
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
                                "Brass",
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
                          SizedBox(height: 8.h),
                          const ExpandableTextWidget(
                            text:
                                'Pure Puja Kit - Welcome blessings of the Lord into your home with this pure Puja Kit! Featuring everything you need for the perfect prayer ceremony, this kit includes necessary Pooja Samagri and Puja Items....$demoString',
                          )
                        ],
                      )
                    : const SizedBox(),
                SizedBox(height: 22.h),
                const Divider(
                  color: Color(0xFFFFD3AA),
                ),
                SizedBox(height: 22.h),
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
                                "Arrives by 03-16 Jun",
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
                                "Free Delivery",
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
                                "Returns & Exchanges: Accepted",
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
                          Text(
                            "See Full Cancellation and Return Policy",
                            style: TextStyle(
                              color: const Color(0xFF2E65E7),
                              fontFamily: semiBold,
                              fontSize: 12.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
                SizedBox(height: 22.h),
                const Divider(
                  color: Color(0xFFFFD3AA),
                ),
                SizedBox(height: 22.h),
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
                            "4.8",
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
                            initialRating: 3,
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
                            "4.6 (120)",
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
                                  percent: 80 / 100,
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
                                  percent: 80 / 100,
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
                                  percent: 80 / 100,
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
                                  percent: 80 / 100,
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
                                  percent: 80 / 100,
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
                SizedBox(
                  height: 215.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 2,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.dm),
                                    child: Image.asset(
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
                                        "Gaurav SSSS",
                                        style: TextStyle(
                                          color: textDarkCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        "2 days ago",
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
                                    initialRating: 3,
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
                                    "4.5 Stars",
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
                                "Kirpan, Bhagauti, Sikh Kakar, Sikh Kirpan, Kukri, Sikh Kakkar, Dori ,In publishing and graphic design, Lorem ipsum is a placeholder ....",
                                style: TextStyle(
                                  color: borderCl,
                                  fontFamily: medium,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              SizedBox(
                                height: 40.h,
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.only(right: 5.w),
                                      child: Image.asset(
                                        demoHawanImg,
                                        height: 40.h,
                                        width: 40.w,
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 80.w),
                  height: 36.h,
                  child: CustomButtonWidget(
                    onPressed: () {
                      Get.to(() => const AllReviewView(),transition:Transition.rightToLeftWithFade,duration: const Duration(seconds: 1));
                    },
                    text: "See All review 120",
                    style: CustomButtonStyle.style3,
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 22.h),
                const Divider(color: hintColor),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
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
                        Get.to(() => const CheckOutView());
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
                              "Add To Cart",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
