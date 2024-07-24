import 'package:divine_pooja/constants/constants.dart';
import 'package:divine_pooja/core/common_widgets/loader_class.dart';
import 'package:divine_pooja/module/cms/controllers/cms_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class CMSView extends StatefulWidget {
  final String tittle;
  final String type;

  const CMSView({super.key, required this.tittle, required this.type});

  @override
  State<CMSView> createState() => _CMSViewState();
}

class _CMSViewState extends State<CMSView> {
  CMSController controller = Get.put(CMSController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<CMSController>(),
      initState: (state){
        Get.find<CMSController>().cmsGetApi(widget.type);
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
              child: Builder(builder: (context){
                 if(contextCtr.isLoading){
                   return LoaderClass(height: MediaQuery.of(context).size.height-200);
                 }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Html(
                        data: contextCtr.des.value,shrinkWrap: true,
                        style: {
                          "body": Style(
                              fontFamily: medium,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: FontSize(12.h)
                          ),
                        },
                      )
                    ],
                  ),
                );
              },),
            ),
          ),
        );
      },
    );
  }
}
