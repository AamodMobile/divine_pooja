import 'package:divine_pooja/constants/constants.dart';

class CMSView extends StatefulWidget {
  final String tittle;

  const CMSView({super.key, required this.tittle});

  @override
  State<CMSView> createState() => _CMSViewState();
}

class _CMSViewState extends State<CMSView> {
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
                widget.tittle,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Text(
                  demoString + demoString+demoString,
                  style: TextStyle(
                    color: borderCl,
                    fontFamily: medium,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 12.sp,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
