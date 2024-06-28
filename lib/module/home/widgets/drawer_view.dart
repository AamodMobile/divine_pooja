import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/cms/views/cms_view.dart';
import 'package:divine_pooja/module/help_support/views/help_and_support_view.dart';
import 'package:divine_pooja/module/home/widgets/delete_bottom_sheet.dart';
import 'package:divine_pooja/module/home/widgets/logout_bottom_sheet.dart';
import 'package:divine_pooja/module/home/widgets/otp_bottom_sheet.dart';
import 'package:divine_pooja/module/my_address/views/my_address_view.dart';
import 'package:divine_pooja/module/my_order/views/my_order_view.dart';
import 'package:flutter/cupertino.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.80,
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80,
        decoration: const BoxDecoration(
          color: whiteCl,
        ),
        child: Column(
          children: [
            SizedBox(height: 11.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    cancelFillIc,
                    color: Colors.black,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
              ),
            ),
            SizedBox(height: 11.h),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h),
                width: MediaQuery.of(context).size.width,
                color: const Color(0xFFFFF6ED),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 62.h,
                      width: 62.w,
                      padding: EdgeInsets.all(16.h),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0CCAD),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(userDefaultIc),
                    ),
                    SizedBox(width: 18.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Gaurav",
                            style: TextStyle(
                              color: textDarkCl,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                              fontFamily: semiBold,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "+91 8947841416",
                            style: TextStyle(
                              color: textDarkCl,
                              fontStyle: FontStyle.normal,
                              fontSize: 14.sp,
                              fontFamily: semiBold,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                        OTPSheet().show(context);
                      },
                      child: Image.asset(
                        editIc,
                        height: 30.h,
                        width: 30.w,
                      ),
                    )
                  ],
                ),
              ),
            ),
            contColumn(
              function: () {
                Get.back();
                Get.to(() => const MyOrderView());
              },
              assetImg: myOrderIc,
              tittle: 'My Order',
            ),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const MyAddressView());
                },
                assetImg: locationNewIc,
                tittle: 'My Address'),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const HelpAndSupportView());
                },
                assetImg: helpIc,
                tittle: 'Help And Support'),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const CMSView(tittle: "About Us"));
                },
                assetImg: infoIc,
                tittle: 'About Us'),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const CMSView(tittle: "Cancellation Policy"));
                },
                assetImg: cancelNewIc,
                tittle: 'Cancellation Policy'),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const CMSView(tittle: "Refund Policy"));
                },
                assetImg: refundIc,
                tittle: 'Refund Policy'),
            contColumn(
                function: () {
                  Get.back();
                  Get.to(() => const CMSView(tittle: "Terms And Conditions"));
                },
                assetImg: fileIc,
                tittle: 'Terms And Conditions'),
            contColumn(
                function: () {
                  Get.back();
                  DeleteSheet().show(context);
                },
                assetImg: deleteIc,
                tittle: 'Delete Account'),
            contColumn(
                function: () {
                  Get.back();
                  LogoutSheet().show(context);
                },
                assetImg: logoutIc,
                tittle: 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget contColumn({required Function() function, required String assetImg, required String tittle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: GestureDetector(
            onTap: function,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.h),
                  decoration: const BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    assetImg,
                    height: 16.h,
                    width: 16.w,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  tittle,
                  style: TextStyle(
                    color: borderCl,
                    fontFamily: medium,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Divider(height: 1.h, color: const Color(0xFFEAEAEA)),
      ],
    );
  }
}
