import 'package:carousel_slider/carousel_slider.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/home/widgets/drawer_view.dart';
import 'package:divine_pooja/module/item_list/views/item_details_view.dart';
import 'package:divine_pooja/module/item_list/views/item_list_view.dart';
import 'package:divine_pooja/module/notification/views/notification_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  CarouselController carouselController = CarouselController();
  int selectedIndex = 0;
  int ind = 0;
  var imageList = [bannerImg, bannerImg, bannerImg];
  var categoriesList = [
    {"tittle": "Festival", "icon": festivalImg},
    {"tittle": "Events", "icon": eventsImg},
    {"tittle": "Pooja", "icon": poojaImg},
    {"tittle": "Homa / Havan", "icon": havanImg},
  ];
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: homeBgCl,
        drawer: const DrawerView(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.dm),
                    child: GestureDetector(
                      onTap: () {
                        if (scaffoldKey.currentState!.isDrawerOpen) {
                          scaffoldKey.currentState!.openEndDrawer();
                        } else {
                          scaffoldKey.currentState!.openDrawer();
                        }
                      },
                      child: Image.asset(
                        userDefaultIc,
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: -3,
                    bottom: -2,
                    child: Image.asset(
                      menuIc,
                      height: 16.h,
                      width: 16.w,
                    ),
                  )
                ],
              ),
              SizedBox(width: 14.w),
              Text(
                "Hi, dear",
                style: TextStyle(
                  color: textDarkCl,
                  fontFamily: medium,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
          actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const CheckOutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
            }, child: SizedBox(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    cartIc,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -5,
                  child: Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: const BoxDecoration(
                      color: mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: regular,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),),
            SizedBox(width: 5.w),
            GestureDetector(
              onTap: () {
                Get.to(() => const CheckOutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
              }, child: SizedBox(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      bellIc,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
                  Positioned(
                    right: 2,
                    top: -6,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: mainColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        "0",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: regular,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 8.sp,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),),
            SizedBox(width: 10.w),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: EdgeInsets.symmetric(horizontal: 14.w),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: CarouselSlider(
                          carouselController: carouselController,
                          options: CarouselOptions(
                            aspectRatio: 16 / 6,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            padEnds: false,
                            pauseAutoPlayOnTouch: true,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                          ),
                          items: List.generate(
                            imageList.length,
                                (ind) =>
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 133,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                          color: Colors.grey.withOpacity(0.05),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        imageList[ind],
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          imageList.length,
                              (ind) =>
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                padding: const EdgeInsets.all(5),
                                height: 6,
                                width: ind == selectedIndex ? 6 : 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ind == selectedIndex ? mainColor : Colors.black.withOpacity(0.20),
                                ),
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: const BoxDecoration(color: Color(0xFFF9E8D9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop our popular categories",
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: regular,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: 100.h,
                        child: ListView.builder(
                          itemCount: categoriesList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => const ItemListView(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 500));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(14.h),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xFFFFCFA5), width: 2.h),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color.fromRGBO(217, 143, 82, 0.15),
                                              offset: Offset(0, 0),
                                              blurRadius: 10,
                                              spreadRadius: 0,
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          categoriesList[index]["icon"].toString(),
                                          height: 36.h,
                                          width: 36.w,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Text(
                                      categoriesList[index]["tittle"].toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: textDarkCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 14.w)
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Homa /Haven",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ItemListView());
                        },
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              arrowNextIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: List.generate(2, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const ItemDetailsView());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            padding: EdgeInsets.all(7.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.dm),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    demoHawanImg,
                                    height: 100.h,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "Ganapathi Homam",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      starRateIc,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "4.6 (120)",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: borderCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                RichText(
                                  text: TextSpan(
                                    text: "₹ 190  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "₹ 220",
                                        style: TextStyle(
                                          color: greyTextCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Events",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ItemListView());
                        },
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              arrowNextIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: List.generate(2, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const ItemDetailsView());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            padding: EdgeInsets.all(7.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.dm),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    demoHawanImg,
                                    height: 100.h,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "Marriage",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      starRateIc,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "4.6 (120)",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: borderCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                RichText(
                                  text: TextSpan(
                                    text: "₹ 190  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "₹ 220",
                                        style: TextStyle(
                                          color: greyTextCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pooja",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ItemListView());
                        },
                        child: SizedBox(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: Image.asset(
                              arrowNextIc,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    children: List.generate(2, (index) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const ItemDetailsView());
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7.w),
                            padding: EdgeInsets.all(7.h),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.dm),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  offset: const Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    demoHawanImg,
                                    height: 100.h,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "Satyanarayana vrathart",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: textDarkCl,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Row(
                                  children: [
                                    Image.asset(
                                      starRateIc,
                                      height: 10.h,
                                      width: 10.w,
                                    ),
                                    SizedBox(width: 5.w),
                                    Text(
                                      "4.6 (120)",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: borderCl,
                                        fontFamily: medium,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                                RichText(
                                  text: TextSpan(
                                    text: "₹ 190  ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: semiBold,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 10.sp,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "₹ 220",
                                        style: TextStyle(
                                          color: greyTextCl,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 22.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Because you viewed",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textDarkCl,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SlideTransition(
                position: _offsetAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.w,
                      mainAxisSpacing: 4.h,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const ItemDetailsView());
                        },
                        child: Container(
                          height: 104.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFf5f4f6),
                            borderRadius: BorderRadius.circular(10.dm),
                          ),
                          child: Image.asset(
                            demoHawanImg,
                            height: 104.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
