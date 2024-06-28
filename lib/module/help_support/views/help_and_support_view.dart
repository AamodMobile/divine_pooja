import 'package:divine_pooja/constants/constants.dart';

class HelpAndSupportView extends StatefulWidget {
  const HelpAndSupportView({super.key});

  @override
  State<HelpAndSupportView> createState() => _HelpAndSupportViewState();
}

class _HelpAndSupportViewState extends State<HelpAndSupportView> {
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
                "Help and Support",
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
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
                width: MediaQuery.of(context).size.width,
              ),
              Image.asset(
                helpImg,
                width: 197.w,
                height: 200.h,
              ),
              SizedBox(height: 17.h),
              Text(
                "Hello, How Can We ",
                style: TextStyle(
                  color: textDarkCl,
                  fontFamily: medium,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp,
                ),
              ),
              Text(
                "Help You?",
                style: TextStyle(
                  color: mainColor,
                  fontFamily: medium,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 70.h),
              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.dm),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      whatsappIc,
                      height: 26.h,
                      width: 26.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Chat On WhatsApp",
                      style: TextStyle(
                        color: borderCl,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      arrowForwardIc,
                      height: 24.h,
                      width: 12.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.dm),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      phoneIc,
                      height: 26.h,
                      width: 26.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Customer Care support",
                      style: TextStyle(
                        color: borderCl,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      arrowForwardIc,
                      height: 24.h,
                      width: 12.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 22.h),
              Container(
                padding: EdgeInsets.all(10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.dm),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      communicationIc,
                      height: 26.h,
                      width: 26.w,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        color: borderCl,
                        fontFamily: medium,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.sp,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      arrowForwardIc,
                      height: 24.h,
                      width: 12.w,
                    ),
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
