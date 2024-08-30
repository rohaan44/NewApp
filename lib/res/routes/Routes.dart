import 'package:get/get.dart';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/views/AfterpaymentScreen.dart';
import 'package:paysense/views/ChoosebankScreen.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/EnteraccScreen.dart';
import 'package:paysense/views/HomeScreen.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:paysense/views/SendamountScreen.dart';
import 'package:paysense/views/SendmoneyScreen.dart';
import 'package:paysense/views/SignupScreen.dart';
import 'package:paysense/views/SplashScreen.dart';
import 'package:paysense/views/TransconfirmScreen.dart';
import 'package:paysense/views/TranscriptScreen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RouteName.signupScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: RouteName.sendAmountScreen,
      page: () => SendAmountScreen(),
    ),
    GetPage(
      name: RouteName.sendmoneyScreen,
      page: () => SendMoneyScreen(),
    ),
    GetPage(
      name: RouteName.chooseBankScreen,
      page: () => ChooseBankScreen(),
    ),
    GetPage(
      name: RouteName.enterAccNoScreen,
      page: () => EnterAccNo(namee: '', imgg: ''),
    ),
    GetPage(
      name: RouteName.afterPayAmntScreen,
      page: () => AfterPaymentScreen(
        userData: Get.arguments,
      ),
    ),
    GetPage(
      name: RouteName.transConfirmScreen,
      page: () => TransConfirmScreen(),
    ),
    GetPage(
      name: RouteName.transScriptScreen,
      page: () => TransScriptScreen(),
    ),
  ];
}
