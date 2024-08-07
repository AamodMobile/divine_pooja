import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/add_address/controllers/add_address_controller.dart';
import 'package:divine_pooja/module/add_address/views/add_address_view.dart';

class MyAddressView extends StatefulWidget {
  const MyAddressView({super.key});

  @override
  State<MyAddressView> createState() => _MyAddressViewState();
}

class _MyAddressViewState extends State<MyAddressView> {
  AddAddressController controller = Get.put(AddAddressController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<AddAddressController>(),
      initState: (state) {
        Get.find<AddAddressController>().addressListGet(true);
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
                    "My Address",
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
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return LoaderClass(height: MediaQuery.of(context).size.height - 100);
                }
                if (contextCtr.addressList.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 130.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        noAddressImg,
                        height: 210.h,
                        width: 210.w,
                      ),
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    SizedBox(height: 15.h),
                    GestureDetector(
                      onTap: () async {
                      var result=await  Get.to(() => const AddAddressView(addressId: '', isEdit: false));
                      if(result!=null){
                        contextCtr.addressListGet(false);
                      }
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
                        itemCount: contextCtr.addressList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              if (contextCtr.addressList[index].isSelected.toString() == "0") {
                                contextCtr.selectAddress(contextCtr.addressList[index].id.toString());
                              } else {}
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 16.h),
                              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: contextCtr.addressList[index].isSelected.toString() == "1" ? const Color(0xFFFFEDDD) : Colors.white,
                                borderRadius: BorderRadius.circular(7.dm),
                                border: Border.all(color: contextCtr.addressList[index].isSelected.toString() == "1" ? mainColor : Colors.transparent),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: Colors.black.withOpacity(0.15),
                                  ),
                                ],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (contextCtr.addressList[index].isSelected.toString() == "0") {
                                        contextCtr.selectAddress(contextCtr.addressList[index].id.toString());
                                      } else {}
                                    },
                                    child: Image.asset(
                                      contextCtr.addressList[index].isSelected.toString() == "1" ? circleSelectIc : circleDefultIc,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contextCtr.addressList[index].addressType.toString().toUpperCase(),
                                          style: TextStyle(
                                            color: textDarkCl,
                                            fontFamily: medium,
                                            fontSize: 16.sp,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          "${controller.addressList[index].houseNumber} ${controller.addressList[index].apartmentName} ${controller.addressList[index].nearByLandmark} ${controller.addressList[index].city} ${controller.addressList[index].pincode}",
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
                                              onTap: () async {
                                                var result = await Get.to(() => AddAddressView(
                                                      addressId: contextCtr.addressList[index].id.toString(),
                                                      isEdit: true,
                                                      addressListModel: contextCtr.addressList[index],
                                                    ));
                                                if (result != null) {
                                                  contextCtr.addressListGet(true);
                                                }
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                  color: contextCtr.addressList[index].isSelected.toString() == "1" ? const Color(0xFFE3F4D9) : const Color(0xFFF1F1F1),
                                                  borderRadius: BorderRadius.circular(4.dm),
                                                ),
                                                child: Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                    color: contextCtr.addressList[index].isSelected.toString() == "1" ? greenCl : hintColor,
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
                                              onTap: () {
                                                contextCtr.deleteAddress(contextCtr.addressList[index].id.toString());
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                                                decoration: BoxDecoration(
                                                  color: contextCtr.addressList[index].isSelected.toString() == "1" ? const Color(0xFFFFBCBC) : const Color(0xFFF1F1F1),
                                                  borderRadius: BorderRadius.circular(4.dm),
                                                ),
                                                child: Text(
                                                  "Remove",
                                                  style: TextStyle(
                                                    color: contextCtr.addressList[index].isSelected.toString() == "1" ? const Color(0xFFF40000) : hintColor,
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              }),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.addressList.isEmpty
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
                                SizedBox(height: 36.h),
                                Text(
                                  "No Address Add",
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
                                SizedBox(height: 90.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                                  height: 40.h,
                                  child: CustomButtonWidget(
                                    onPressed: () {
                                      Get.to(() => const AddAddressView(
                                            addressId: '',
                                            isEdit: false,
                                          ));
                                    },
                                    text: "Add Address",
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
}
