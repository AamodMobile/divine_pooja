import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/notification/controllers/notification_list_controller.dart';
import 'package:intl/intl.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationListController controller = Get.put(NotificationListController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<NotificationListController>(),
      initState: (state) {
        Get.find<NotificationListController>().notificationListGet();
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
                    "Notification",
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
                children: [
                  SizedBox(height: 14.h),
                  Builder(builder: (context) {
                    if (contextCtr.isLoading) {
                      return LoaderClass(height: MediaQuery.of(context).size.height - 200);
                    }
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contextCtr.notificationList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.dm), border: Border.all(color: borderClLightMain)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contextCtr.notificationList[index].title.toString(),
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: medium,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  formatDate(contextCtr.notificationList[index].createdAt ?? DateTime.now()),
                                  style: TextStyle(
                                    color: hintColor,
                                    fontFamily: regular,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  contextCtr.notificationList[index].description.toString(),
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
                          );
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.notificationList.isEmpty
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
                                Image.asset(
                                  bellColour,
                                  height: 80.h,
                                  width: 80.w,
                                ),
                                SizedBox(height: 50.h),
                                Text(
                                  "You have No Notification",
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
                                SizedBox(height: 30.h),
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

  String formatDate(DateTime dateString) {
    DateFormat dateFormat1 = DateFormat('dd-MM-yyyy');
    String formattedEndDate = dateFormat1.format(dateString);
    return formattedEndDate;
  }
}
