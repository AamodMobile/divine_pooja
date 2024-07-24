import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';

class DeleteSheet {
  Future<String?> show(BuildContext context,HomeController controller) async {
    return await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      useRootNavigator: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        cancelFillIc,
                        color: Colors.white,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.dm),
                          topRight: Radius.circular(20.dm),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width),
                          Row(
                            children: [
                              Image.asset(
                                deleteSheetIc,
                                height: 50.h,
                                width: 50.w,
                              ),
                              SizedBox(
                                width: 19.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delete Account",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: semiBold,
                                        fontSize: 18.sp,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Text(
                                      "Are You sure you want to Delete account ?",
                                      style: TextStyle(
                                        color: borderCl,
                                        fontFamily: regular,
                                        fontSize: 12.sp,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15.h),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
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
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 10.h),
                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4.dm), border: Border.all(color: mainColor)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "No",
                                          style: TextStyle(
                                            color: mainColor,
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
                                   controller.deleteAccount();
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
                                          "Yes",
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
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
