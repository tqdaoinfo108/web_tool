import 'package:gvb_charge/pages/add_money/add_money_controller.dart';
import 'package:gvb_charge/pages/add_money/add_money_page.dart';
import 'package:gvb_charge/pages/login/login_controller.dart';
import 'package:gvb_charge/pages/pick_time/pick_time_booking_controller.dart';
import 'package:gvb_charge/pages/pick_time/pick_time_booking_page.dart';
import 'package:gvb_charge/pages/qr_scan/qr_scan_controller.dart';
import 'package:gvb_charge/pages/qr_scan/qr_scan_page.dart';

import '../pages/home/home_controller.dart';
import '../pages/home/home_page.dart';
import 'package:get/get.dart';

import '../pages/login/login_page.dart';

get pageList => [
      GetPage(
          name: '/home', page: () => const HomePage(), binding: HomeBinding()),
      GetPage(
          name: '/login',
          page: () => const LoginPage(),
          binding: LoginBinding()),
      GetPage(
          name: '/qr_scan', page: () => QRScanPage(), binding: QRScanBinding()),
      GetPage(
          name: '/add_money',
          page: () => const AddMoneyPage(),
          binding: AddMoneyBinding()),
      GetPage(
          name: '/pick_time_booking',
          page: () => const PickTimeBookingPage(),
          binding: PickTimeBookingBinding()),
    ];
