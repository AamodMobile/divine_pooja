import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_input_fields.dart';
import 'package:divine_pooja/module/add_address/controllers/add_address_controller.dart';

class AddAddressView extends StatefulWidget {
  const AddAddressView({super.key});

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
  AddAddressController controller =Get.put(AddAddressController());
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
                "Add Address",
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
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: MediaQuery.of(context).size.width, height: 16.h),
                Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDABB),
                    borderRadius: BorderRadius.circular(10.dm)
                  ),
                  child: Row(
                    children: [
                      Image.asset(locationFillIc,height: 24.h,width: 24.w,),
                      SizedBox(width: 10.w),
                      Text(
                        "Use my current location",
                        style: TextStyle(
                          color: const Color(0xFFFA7900),
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                        ),
                      ),
                      const Spacer(),
                      Image.asset(checkFillIc,height: 24.h,width: 24.w,),
                      SizedBox(width: 7.w),
                      Image.asset(cancelFillIc,height: 24.h,width: 24.w,),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  txKeyboardType: TextInputType.name,
                  borderCl: borderClLightMain,
                  controller: controller.houseNo,
                  labelWidget: Row(
                    children: [
                      Image.asset(
                        homeWorkIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Flat / House Number",
                        style: TextStyle(
                          color: textDarkCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Enter Flat / House Number",
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  txKeyboardType: TextInputType.name,
                  borderCl: borderClLightMain,
                  controller: controller.apartmentName,
                  labelWidget: Row(
                    children: [
                      Image.asset(
                        homeWorkIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Apartment Name",
                        style: TextStyle(
                          color: textDarkCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Enter Apartment Name",
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  txKeyboardType: TextInputType.name,
                  borderCl: borderClLightMain,
                  controller: controller.addressLine,
                  labelWidget: Row(
                    children: [
                      Image.asset(
                        streetRoadIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Address line",
                        style: TextStyle(
                          color: textDarkCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Enter Address line",
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  txKeyboardType: TextInputType.name,
                  borderCl: borderClLightMain,
                  controller: controller.pincode,
                  labelWidget: Row(
                    children: [
                      Image.asset(
                        outlineZipIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Zip code",
                        style: TextStyle(
                          color: textDarkCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Enter Zip code",
                ),
                SizedBox(height: 20.h),
                 CustomTextField(
                        txKeyboardType: TextInputType.name,
                        borderCl: borderClLightMain,
                        controller: controller.city,
                        labelWidget: Row(
                          children: [
                            Image.asset(
                              cityOutlineIc,
                              height: 16.h,
                              width: 16.w,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "City / Village",
                              style: TextStyle(
                                color: textDarkCl,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                fontFamily: regular,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        hintText: "Enter City / Village",
                      ),
                SizedBox(height: 20.h),
                CustomTextField(
                  txKeyboardType: TextInputType.name,
                  borderCl: borderClLightMain,
                  controller: controller.nearby,
                  labelWidget: Row(
                    children: [
                      Image.asset(
                        cityOutlineIc,
                        height: 16.h,
                        width: 16.w,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "Near By landmark",
                        style: TextStyle(
                          color: textDarkCl,
                          fontStyle: FontStyle.normal,
                          fontSize: 12.sp,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Enter Near By landmark",
                ),
                SizedBox(height: 15.h),
                Text(
                  "Address Type",
                  style: TextStyle(
                    color: textDarkCl,
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    fontFamily: semiBold,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.addressType = "home";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: whiteCl,
                            borderRadius: BorderRadius.circular(10.dm),
                            border: Border.all(
                              color: controller.addressType == "home" ? mainColor : greyColorTxt1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                homeTypeIc,
                                height: 18.h,
                                width: 18.w,
                                color: controller.addressType == "home" ? mainColor : greyColorTxt1,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(
                                  color: controller.addressType == "home" ? mainColor : greyColorTxt1,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: 15.h,
                                width: 15.w,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.addressType == "home" ? mainColor : greyColorTxt1,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.addressType == "home" ? mainColor : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.addressType = "work";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: whiteCl,
                            borderRadius: BorderRadius.circular(10.dm),
                            border: Border.all(
                              color: controller.addressType == "work" ? mainColor : greyColorTxt1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                workTypeIc,
                                height: 18.h,
                                width: 18.w,
                                color: controller.addressType == "work" ? mainColor : greyColorTxt1,
                              ),
                              Text(
                                "Office",
                                style: TextStyle(
                                  color: controller.addressType == "work" ? mainColor : greyColorTxt1,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: 15.h,
                                width: 15.w,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.addressType == "work" ? mainColor : greyColorTxt1,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.addressType == "work" ? mainColor : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.addressType = "other";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: whiteCl,
                            borderRadius: BorderRadius.circular(10.dm),
                            border: Border.all(
                              color: controller.addressType == "other" ? mainColor : greyColorTxt1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                otherTypeIc,
                                height: 18.h,
                                width: 18.w,
                                color: controller.addressType == "other" ? mainColor : greyColorTxt1,
                              ),
                              Text(
                                "Other",
                                style: TextStyle(
                                  color: controller.addressType == "other" ? mainColor : greyColorTxt1,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12.sp,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Container(
                                height: 15.h,
                                width: 15.w,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: controller.addressType == "other" ? mainColor : greyColorTxt1,
                                    width: 1,
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: controller.addressType == "other" ? mainColor : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 150.h)
              ],
            ),
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
                            "Save Address",
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
