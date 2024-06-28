import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/module/splash/controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.put(SplashController());
@override
  void initState() {
   controller.navigator();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          splash,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
