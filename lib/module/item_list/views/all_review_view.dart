import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/item_list/controllers/item_controller.dart';
import 'package:divine_pooja/service/api_url.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllReviewView extends StatefulWidget {
  final String id;

  const AllReviewView({super.key, required this.id});

  @override
  State<AllReviewView> createState() => _AllReviewViewState();
}

class _AllReviewViewState extends State<AllReviewView> {
  ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<ItemController>(),
      initState: (state) {
        Get.find<ItemController>().feedbackListGet(widget.id);
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
                    "Reviews",
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
                children: [
                  Builder(builder: (context) {
                    if (contextCtr.isLoading) {
                      return LoaderClass(height: MediaQuery.of(context).size.height - 200);
                    }
                    if (contextCtr.allFeedbackList.isEmpty) {
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
                                "No Review Found ",
                                style: TextStyle(
                                  color: textDarkCl,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              SizedBox(height: 90.h),
                            ],
                          ));
                    }
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: contextCtr.allFeedbackList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10.h),
                              margin: EdgeInsets.only(bottom: 16.h),
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
                                        child:  contextCtr.allFeedbackList[index].userProfile != ""
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
                                          imageUrl: ApiUrl.imageUrl + contextCtr.allFeedbackList[index].userProfile.toString(),
                                          placeholder: (a, b) => const Center(
                                            child: CircularProgressIndicator(
                                              color: mainColor,
                                            ),
                                          ),
                                        )
                                            :Image.asset(
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
                                            contextCtr.allFeedbackList[index].userName.toString(),
                                            style: TextStyle(
                                              color: textDarkCl,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            _getTimeAgo(contextCtr.allFeedbackList[index].createdAt!),
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
                                        initialRating: double.parse(contextCtr.allFeedbackList[index].rating.toString()),
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
                                        "${contextCtr.allFeedbackList[index].rating.toString()} Stars",
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
                                    contextCtr.allFeedbackList[index].feedback.toString(),
                                    style: TextStyle(
                                      color: borderCl,
                                      fontFamily: medium,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(height: 15.h),
                                  SizedBox(
                                    height: 40.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemCount: contextCtr.allFeedbackList[index].feedbackImages?.length,
                                      itemBuilder: (BuildContext context, int ind) {
                                        return Container(
                                          margin: EdgeInsets.only(right: 5.w),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5.dm),
                                            child: contextCtr.allFeedbackList[index].feedbackImages != null && contextCtr.allFeedbackList[index].feedbackImages![ind].image != ""
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
                                                    imageUrl: ApiUrl.imageUrl + contextCtr.allFeedbackList[index].feedbackImages![ind].image.toString(),
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
                                                  ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    );
                  })
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
}
