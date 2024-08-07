import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/auth/views/login_view.dart';
import 'package:divine_pooja/module/intro/controllers/intro_controller.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);
  IntroController con = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: const Color(0xFFF1F9FF), body: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        Positioned(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _buildPageView(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01, width: MediaQuery.of(context).size.width),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    divineLogo,
                    width: 43.w,
                    height: 40.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => const LoginView());
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: medium,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.031,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        con.images.length,
                        (ind) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(5),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ind == con.currentPage.value ? mainColor : const Color(0xFFD9D9D9).withOpacity(0.93),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (con.currentPage.value < 2) {
                        con.currentPage.value++;
                        _pageController.animateToPage(con.currentPage.value, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                      } else {
                        Get.offAll(() => const LoginView());
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(6.dm)),
                      child: Row(
                        children: [
                          Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                          Image.asset(
                            nextArrowIc,
                            height: 14.h,
                            width: 14.w,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 19.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      itemCount: con.totalPages.value,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
            }
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0.0, 100 * (1 - value)),
                // Adjust the offset as needed
                child: child,
              ),
            );
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  con.images[index],
                  height: 475.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Text(
                    "We have an exclusive pooja kits. ",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: bold,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 9.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Text(
                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: regular,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
        con.currentPage.value = index;
      },
    );
  }
}
