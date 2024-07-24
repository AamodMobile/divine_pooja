import 'package:cached_network_image/cached_network_image.dart';
import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/custom_buttons.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/check_out/views/check_out_view.dart';
import 'package:divine_pooja/module/item_list/views/item_details_view.dart';
import 'package:divine_pooja/module/wishlist/controller/wish_list_controller.dart';
import 'package:divine_pooja/service/api_url.dart';

class WishListView extends StatefulWidget {
  const WishListView({super.key});

  @override
  State<WishListView> createState() => _WishListViewState();
}

class _WishListViewState extends State<WishListView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  List itemList = ["1"];
  WishListController controller = Get.put(WishListController());

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
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
      init: Get.find<WishListController>(),
      initState: (state) {
        Get.find<WishListController>().wishlistList();
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
                    "WishList",
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
              padding: EdgeInsets.all(14.h),
              child: Builder(builder: (context) {
                if (contextCtr.isLoading) {
                  return LoaderClass(height: MediaQuery.of(context).size.height - 100);
                }
                if (contextCtr.wishList.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 130.h,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        noOrderImg,
                        height: 210.h,
                        width: 210.w,
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12.w,
                          mainAxisSpacing: 12.h,
                          childAspectRatio: 1 / 1.3,
                        ),
                        itemCount: contextCtr.wishList.length,
                        itemBuilder: (context, index) {
                          return SlideTransition(
                            position: _offsetAnimation,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                    () => const ItemDetailsView(
                                          productId: '',
                                        ),
                                    transition: Transition.fadeIn,
                                    duration: const Duration(seconds: 1));
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
                                          borderRadius: BorderRadius.circular(15),
                                          child: contextCtr.wishList[index].image != ""
                                              ? CachedNetworkImage(
                                                  errorWidget: (context, url, error) => Image.asset(
                                                    demoHawanImg,
                                                    height: 100.h,
                                                    width: MediaQuery.of(context).size.width,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  height: 100.h,
                                                  width: MediaQuery.of(context).size.width,
                                                  fit: BoxFit.fill,
                                                  imageUrl: ApiUrl.imageUrl + contextCtr.wishList[index].image.toString(),
                                                  placeholder: (a, b) => const Center(
                                                    child: CircularProgressIndicator(
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                )
                                              : Image.asset(
                                                  demoHawanImg,
                                                  height: 100.h,
                                                ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: GestureDetector(
                                            onTap: (){
                                              contextCtr.addWishList( contextCtr.wishList[index].id.toString());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(5.dm),
                                              child: Image.asset(
                                                heartFillIc,
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
                                      contextCtr.wishList[index].name.toString(),
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
                                          "${contextCtr.wishList[index].averageRating == "" ? "0.0" : contextCtr.wishList[index].averageRating} (${contextCtr.wishList[index].ratingCount})",
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
                                        text: "₹ ${contextCtr.wishList[index].price}  ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: semiBold,
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 10.sp,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "₹ ${contextCtr.wishList[index].regularPrice}",
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
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      height: 30.h,
                                      child: CustomButtonWidget(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          if(contextCtr.wishList[index].isCart.toString()=="1"){
                                            Get.to(() => const CheckOutView(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 250));
                                          }else{
                                            contextCtr.addCartApi(contextCtr.wishList[index].id.toString(), "1",);
                                          }
                                        },
                                        text: contextCtr.wishList[index].isCart.toString()=="1"?"Go to cart":"Add To Cart",
                                        iconWidget: Image.asset(
                                          cartOutlineIc,
                                          height: 16.h,
                                          width: 16.w,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
            bottomSheet: contextCtr.isLoading
                ? const SizedBox()
                : contextCtr.wishList.isEmpty
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
                                  "No Item Found ",
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
                                      Get.back();
                                    },
                                    text: "Continue Shopping",
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
