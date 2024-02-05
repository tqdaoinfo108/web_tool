import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gvb_charge/pages/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'router/router.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Add this
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: pageList,
        initialRoute: "/login",
        defaultTransition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 200),
      );
    });
  }
}
