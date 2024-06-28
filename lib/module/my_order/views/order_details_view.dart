import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/my_separator.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  List statusList = [
    {"title": "Order Placed", "date": "12-06-24, 12:20 PM", "isTrue": "true"},
    {"title": "Tracking update", "date": "12-06-24, 12:20 PM", "isTrue": "false"},
    {"title": "Estimated Delivery Date", "date": "12-06-24, 12:20 PM", "isTrue": "false"},
  ];

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
        body: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12.h),
                decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(image: AssetImage(subtractImg), fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "#222222222",
                          style: TextStyle(
                            color: textDarkCl,
                            fontFamily: medium,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.sp,
                          ),
                        ),
                        Text(
                          "₹ 190",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "#222222222",
                          style: TextStyle(
                            color: borderCl,
                            fontFamily: regular,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          "₹ 190",
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
                    SizedBox(height: 27.h),
                    Divider(
                      color: mainColor,
                      height: 1.h,
                    ),
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
                                    "1200120012001",
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
                                "DHL",
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
                      children: statusList.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                item["isTrue"] == "true"
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
                                            width: 10,
                                          ),
                                        ),
                                      ),
                                if (index < statusList.length - 1)
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 4.w,
                                        height: 60.h,
                                        child: item["isTrue"] != "true"
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
                                  item["title"].toString(),
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  item["date"].toString(),
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
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 14.h)
                  ],
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
                      "Vaishali Tower 2nd Nursery Circle Vaishali Nagar Jaipur 302021",
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
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
