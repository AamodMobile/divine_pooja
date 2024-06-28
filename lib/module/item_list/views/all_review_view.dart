import 'package:divine_pooja/constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AllReviewView extends StatefulWidget {
  const AllReviewView({super.key});

  @override
  State<AllReviewView> createState() => _AllReviewViewState();
}

class _AllReviewViewState extends State<AllReviewView> {
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
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
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
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.dm),
                                  child: Image.asset(
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
                                      "Gaurav SSSS",
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: semiBold,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      "2 days ago",
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
                                  initialRating: 3,
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
                                  "4.5 Stars",
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
                              "Kirpan, Bhagauti, Sikh Kakar, Sikh Kirpan, Kukri, Sikh Kakkar, Dori ,In publishing and graphic design, Lorem ipsum is a placeholder ....",
                              style: TextStyle(
                                color: borderCl,
                                fontFamily: medium,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 40.h,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: 2,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    child: Image.asset(
                                      demoHawanImg,
                                      height: 40.h,
                                      width: 40.w,
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
