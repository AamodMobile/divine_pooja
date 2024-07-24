import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';
import 'package:divine_pooja/module/home/widgets/drawer_view.dart';
import 'package:divine_pooja/module/item_list/views/item_details_view.dart';
import 'package:divine_pooja/module/item_list/views/item_list_view.dart';
import 'package:divine_pooja/module/notification/views/notification_view.dart';
import 'package:divine_pooja/service/api_url.dart';

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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  HomeController controller = Get.put(HomeController());

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
    return GetBuilder(
      init: Get.find<HomeController>(),
      initState: (state) {},
      builder: (contextCtr) {
        return SafeArea(
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: homeBgCl,
            drawer: DrawerView(
              mobile: contextCtr.mobileNo.value,
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      contextCtr.loadCountFromPrefs();
                      if (scaffoldKey.currentState!.isDrawerOpen) {
                        scaffoldKey.currentState!.openEndDrawer();
                      } else {
                        scaffoldKey.currentState!.openDrawer();
                      }
                    },
                    child: SizedBox(
                    height: 40,
                    width: 40,
                    child:Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.dm),
                          child:  SizedBox(
                              height: 40,
                              width: 40,
                              child: Center(
                                child: Image.asset(
                                  divineLogo,
                                  height: 30.h,
                                  width: 30.w,
                                  fit: BoxFit.cover,
                            ),
                          ),
                        ),),
                        Positioned(
                          right: -3,
                          bottom: -2,
                          child: Image.asset(
                            menuIc,
                            height: 20.h,
                            width: 20.w,
                          ),
                        )
                      ],
                    ),
                  ),),
                  SizedBox(width: 14.w),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CheckOutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
                  },
                  child: SizedBox(
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
                            child: Obx(
                              () => Text(
                                contextCtr.cartCount.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: regular,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 8.sp,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const NotificationView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
                  },
                  child: SizedBox(
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
                              contextCtr.unreadNotification.value,
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
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
            body: SingleChildScrollView(
              child: Builder(
                builder: (context) {
                  if (contextCtr.isLoading) {
                    return LoaderClass(height: MediaQuery.of(context).size.height - 100);
                  }
                  return Column(
                    children: [
                      SizedBox(height: 16.h),
                      SlideTransition(
                        position: _offsetAnimation,
                        child: Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
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
                                    contextCtr.bannerList.length,
                                    (ind) => InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 133,
                                        width: MediaQuery.of(context).size.width,
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
                                          child: contextCtr.bannerList[ind].banner != ""
                                              ? CachedNetworkImage(
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    eventsImg,
                                                    width: MediaQuery.of(context).size.width,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  width: MediaQuery.of(context).size.width,
                                                  fit: BoxFit.fill,
                                                  imageUrl: ApiUrl.imageUrl + contextCtr.bannerList[ind].banner.toString(),
                                                  placeholder: (a, b) => const Center(
                                                    child: CircularProgressIndicator(
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                )
                                              : Image.asset(
                                                  demoHawanImg,
                                                  width: MediaQuery.of(context).size.width,
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
                                  contextCtr.bannerList.length,
                                  (ind) => Container(
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
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(color: Color(0xFFF9E8D9)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shop our popular categories",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: semiBold,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100.h,
                                child: ListView.builder(
                                  itemCount: contextCtr.categoryList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(
                                                    () => ItemListView(
                                                          id: contextCtr.categoryList[index].id.toString(),
                                                          title: contextCtr.categoryList[index].name.toString(),
                                                        ),
                                                    transition: Transition.rightToLeft,
                                                    duration: const Duration(milliseconds: 500));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(14.h),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: const Color(0xFFFFCFA5), width: 2.h),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color: Color.fromRGBO(217, 143, 82, 0.15),
                                                      offset: Offset(0, 0),
                                                      blurRadius: 10,
                                                      spreadRadius: 0,
                                                    ),
                                                  ],
                                                ),
                                                child: contextCtr.categoryList[index].bannerImage != ""
                                                    ? ClipRRect(
                                                        borderRadius: BorderRadius.circular(0),
                                                        child: CachedNetworkImage(
                                                          errorWidget: (context, url, error) => Image.asset(
                                                            eventsImg,
                                                            height: 36.h,
                                                            width: 36.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          height: 36.h,
                                                          width: 36.w,
                                                          fit: BoxFit.cover,
                                                          imageUrl: ApiUrl.imageUrl + contextCtr.categoryList[index].bannerImage.toString(),
                                                          placeholder: (a, b) => const Center(
                                                            child: CircularProgressIndicator(
                                                              color: mainColor,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    : Image.asset(
                                                        eventsImg,
                                                        height: 36.h,
                                                        width: 36.w,
                                                      ),
                                              ),
                                            ),
                                            SizedBox(height: 12.h),
                                            Text(
                                              contextCtr.categoryList[index].name.toString(),
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
                      MediaQuery.removePadding(
                        removeTop: true,
                        context: context,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          clipBehavior: Clip.none,
                          shrinkWrap: true,
                          itemCount: contextCtr.categoryList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Visibility(
                              visible: contextCtr.categoryList[index].products!.isEmpty ? false : true,
                              child: Column(
                                children: [
                                  SlideTransition(
                                    position: _offsetAnimation,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            contextCtr.categoryList[index].name.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: semiBold,
                                              fontWeight: FontWeight.w600,
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => ItemListView(
                                                        id: contextCtr.categoryList[index].id.toString(),
                                                        title: contextCtr.categoryList[index].name.toString(),
                                                      ),
                                                  transition: Transition.rightToLeft,
                                                  duration: const Duration(milliseconds: 500));
                                            },
                                            child: SizedBox(
                                              height: 30.h,
                                              child: Center(
                                                child: Text(
                                                  "View All",
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: medium,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 12.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  SlideTransition(
                                    position: _offsetAnimation,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                                      child:  GridView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: const NeverScrollableScrollPhysics(),
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,childAspectRatio: 0.95,
                                          crossAxisSpacing: 10.w,
                                          mainAxisSpacing: 0.h,
                                        ),
                                        itemCount: contextCtr.categoryList[index].products!.length,
                                        itemBuilder: (context, ind) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(() => ItemDetailsView(productId: contextCtr.categoryList[index].products![ind].id.toString()));
                                            },
                                            child: Container(
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
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(10.dm),
                                                        child: contextCtr.categoryList[index].products![ind].image != ""
                                                            ? CachedNetworkImage(
                                                          errorWidget: (context, url, error) => Image.asset(
                                                            demoHawanImg,
                                                            height: 100.h,
                                                            width: MediaQuery.of(context).size.width,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          height: 100.h,
                                                          width: MediaQuery.of(context).size.width,
                                                          fit: BoxFit.fill,
                                                          imageUrl: ApiUrl.imageUrl + contextCtr.categoryList[index].products![ind].image.toString(),
                                                          placeholder: (a, b) => const Center(
                                                            child: CircularProgressIndicator(
                                                              color: mainColor,
                                                            ),
                                                          ),
                                                        )
                                                            : Image.asset(
                                                          demoHawanImg,
                                                          height: 100.h,
                                                          width: MediaQuery.of(context).size.width,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 0,
                                                        right: 0,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            contextCtr.addWishList(contextCtr.categoryList[index].products![ind].id.toString());
                                                          },
                                                          child: Container(
                                                            padding: EdgeInsets.all(5.dm),
                                                            child: Image.asset(
                                                              contextCtr.categoryList[index].products![ind].isLike == 1 ? heartFillIc : heartIc,
                                                              height: 20.h,
                                                              width: 20.w,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                    contextCtr.categoryList[index].products![ind].name.toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: semiBold,
                                                      fontWeight: FontWeight.w600,
                                                      fontStyle: FontStyle.normal,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4.h),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        starRateIc,
                                                        height: 10.h,
                                                        width: 10.w,
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Text(
                                                        "${contextCtr.categoryList[index].products![ind].averageRating == "" ? "0.0" : contextCtr.categoryList[index].products![ind].averageRating} (${contextCtr.categoryList[index].products![ind].ratingCount.toString()})",
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
                                                  SizedBox(height: 4.h),
                                                  RichText(
                                                    text: TextSpan(
                                                      text: "₹ ${contextCtr.categoryList[index].products![ind].price.toString()} ",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: semiBold,
                                                        fontWeight: FontWeight.w600,
                                                        fontStyle: FontStyle.normal,
                                                        fontSize: 12.sp,
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                          text: " ₹ ${contextCtr.categoryList[index].products![ind].regularPrice.toString()}",
                                                          style: TextStyle(
                                                            color: greyTextCl,
                                                            fontFamily: semiBold,
                                                            fontWeight: FontWeight.w400,
                                                            fontStyle: FontStyle.normal,
                                                            fontSize: 12.sp,
                                                            decoration: TextDecoration.lineThrough,
                                                          ),
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
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Visibility(
                        visible: contextCtr.recentlyViewed.isEmpty ? false : true,
                        child: SlideTransition(
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
                                    color: Colors.black,
                                    fontFamily: semiBold,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
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
                            itemCount: contextCtr.recentlyViewed.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => ItemDetailsView(productId: contextCtr.recentlyViewed[index].id.toString()));
                                },
                                child: Container(
                                  height: 104.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFf5f4f6),
                                    borderRadius: BorderRadius.circular(10.dm),
                                  ),
                                  child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.dm),
                              child:  contextCtr.recentlyViewed[index].image != ""
                                      ? CachedNetworkImage(
                                    errorWidget: (context, url, error) => Image.asset(
                                      demoHawanImg,
                                      height: 104.h,
                                      fit: BoxFit.cover,
                                    ),
                                    height: 104.h,
                                    fit: BoxFit.fill,
                                    imageUrl: ApiUrl.imageUrl + contextCtr.recentlyViewed[index].image.toString(),
                                    placeholder: (a, b) => const Center(
                                      child: CircularProgressIndicator(
                                        color: mainColor,
                                      ),
                                    ),
                                  ):
                                  Image.asset(
                                    demoHawanImg,
                                    height: 104.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
