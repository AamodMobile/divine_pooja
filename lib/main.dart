import 'dart:io';

import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/home/controllers/home_controller.dart';
import 'package:divine_pooja/module/item_list/controllers/item_controller.dart';
import 'package:divine_pooja/module/splash/views/splash_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        useInheritedMediaQuery: true,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          child: GetMaterialApp(
            initialBinding: BindingsBuilder(() {
              Get.put(HomeController());
              Get.put(ItemController());
            }),
            title: 'Divine Pooja',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
            ),
            home: const SplashView(),
          ),
        ),
      ),
    );
  }
}
