import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/add_address/views/add_address_view.dart';

class ProblemLocationSheet {
  final List<String> location = [
    "Califon, United States",
    "California, United States",
    "California City, United States",
  ];
  String selectedValue = "";

  Future<String?> show(BuildContext context) async {
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
                Padding(
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
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 12.h),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                          ),
                          Text(
                            "Saved addresses",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textDarkCl,
                              fontFamily: semiBold,
                              fontSize: 16.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                              Get.to(() => const AddAddressView());
                            },
                            child: Text(
                              "+ Add another address",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mainColor,
                                fontFamily: medium,
                                fontSize: 14.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          MediaQuery.removePadding(
                            removeTop: true,
                            removeBottom: true,
                            removeLeft: true,
                            removeRight: true,
                            context: context,
                            child: ListView.builder(
                              itemCount: location.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedValue = location[index];
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedValue = location[index];
                                          });
                                        },
                                        child: Image.asset(
                                          selectedValue == location[index] ? circleSelectIc : circleDefultIc,
                                          height: 18.h,
                                          width: 18.w,
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Home",
                                              style: TextStyle(
                                                color: selectedValue == location[index] ? mainColor : textDarkCl,
                                                fontFamily: regular,
                                                fontSize: 14.sp,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Text(
                                              location[index],
                                              style: TextStyle(
                                                color: hintColor,
                                                fontFamily: regular,
                                                fontSize: 14.sp,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF1F1F1),
                                                      borderRadius: BorderRadius.circular(4.dm),
                                                    ),
                                                    child: Text(
                                                      "Edit",
                                                      style: TextStyle(
                                                        color: hintColor,
                                                        fontFamily: regular,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFF1F1F1),
                                                      borderRadius: BorderRadius.circular(4.dm),
                                                    ),
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        color: hintColor,
                                                        fontFamily: regular,
                                                        fontWeight: FontWeight.w400,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.sp,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 12.h),
                                            Divider(
                                              color: const Color(0xFFEBEBEB),
                                              height: 1.h,
                                            ),
                                            SizedBox(height: 12.h),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                    Container(
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
                                  onTap: (){
                                    Get.back();
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
                                          "Confirm",
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
