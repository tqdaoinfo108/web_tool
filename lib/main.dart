import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gvb_charge/pages/home/home_controller.dart';
import 'package:gvb_charge/pages/home/home_page.dart';
import 'package:gvb_charge/pages/login/login_controller.dart';
import 'pages/login/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'router/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //Add this

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        getPages: pageList,
        initialRoute: "/home",
        initialBinding: HomeBinding(),
      ),
    );
  }
}
