import 'dart:io';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/module/feedback/controller/give_feedback_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GiveFeedBackView extends StatefulWidget {
  final String orderId;
  final String productId;

  const GiveFeedBackView({super.key, required this.orderId, required this.productId});

  @override
  State<GiveFeedBackView> createState() => _GiveFeedBackViewState();
}

class _GiveFeedBackViewState extends State<GiveFeedBackView> {
  GiveFeedBackController controller = Get.put(GiveFeedBackController());

  @override
  void initState() {
    controller.feedback.text = "";
    controller.rating.value = "1";
    controller.itemImages.clear();
    controller.itemImages.add("upload");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<GiveFeedBackController>(),
      initState: (state) {
        Get.find<GiveFeedBackController>();
      },
      builder: (contextCtr) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: homeBgCl,
            resizeToAvoidBottomInset: false,
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
                    "Give Feedback",
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 24.h,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.all(3.h),
                    decoration: const BoxDecoration(color: mainColor),
                    child: Text(
                      "Order ID: 1201000Di",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "How Was Your Experience?",
                    style: TextStyle(
                      color: textDarkCl,
                      fontFamily: medium,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  RatingBar.builder(
                    glow: false,
                    initialRating: 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 60,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 30,
                            color: mainColor, // Use your main color here
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            _getLabelForRating(index),
                            style: TextStyle(
                              color: textDarkCl,
                              fontFamily: regular,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                            ), // Adjust the font size as needed
                          ),
                        ],
                      );
                    },
                    onRatingUpdate: (rating) {
                      var iNew = rating.round();
                      contextCtr.updateRating(iNew.toString());
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    labelText: "Review",
                    maxCheck: 5,
                    hintText: "Write Here",
                    borderCl: borderClLightMain,
                    controller: contextCtr.feedback,
                  ),
                  SizedBox(height: 24.h),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Product Images",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0D0140),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    height: 80.h,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListView.builder(
                        shrinkWrap: true,
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        reverse: true,
                        itemCount: contextCtr.itemImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (contextCtr.itemImages[index] == "upload") {
                            return GestureDetector(
                              onTap: () {
                                if (contextCtr.itemImages[index] == "upload") {
                                  contextCtr.selectImages().then((value) {
                                    setState(() {});
                                  });
                                }
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 9),
                                clipBehavior: Clip.antiAlias,
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Image.asset(uploadImg, fit: BoxFit.contain),
                                ),
                              ),
                            );
                          } else {
                            return Container(
                              margin: const EdgeInsets.only(left: 9),
                              height: 80.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor, width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(File(contextCtr.itemImages[index].path), fit: BoxFit.cover),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: Container(
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
                          if (contextCtr.rating.value == "") {
                            errorToast("enter rating please");
                          } else if (contextCtr.feedback.text == "") {
                            errorToast("enter feedback for item");
                          } else {
                            contextCtr.giveFeedback(widget.productId, widget.orderId);
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
                                "Submit Feedback",
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
                      )),
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

  String _getLabelForRating(int index) {
    switch (index) {
      case 0:
        return 'Terrible';
      case 1:
        return 'Bad';
      case 2:
        return 'Okay';
      case 3:
        return 'Good';
      case 4:
        return 'Amazing';
      default:
        return '';
    }
  }
}
