import 'package:gvb_charge/pages/login/login_controller.dart';

import '../pages/home/home_controller.dart';
import '../pages/home/home_page.dart';
import 'package:get/get.dart';

import '../pages/login/login_page.dart';

get pageList => [
      GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
      GetPage(name: '/login', page: () => LoginPage(), binding: LoginBinding()),
    ];
