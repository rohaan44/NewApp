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
import 'package:paysense/widgets/BottomBar.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: RouteName.signupScreen,
      page: () => const SignupScreen(),
      transitionDuration: const Duration(seconds: 1),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
        name: RouteName.loginScreen,
        page: () => LoginScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.dashboardScreen,
        page: () => BottomBar(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.sendAmountScreen,
        page: () => const SendAmountScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.sendmoneyScreen,
        page: () => const SendMoneyScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.chooseBankScreen,
        page: () => const ChooseBankScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.enterAccNoScreen,
        page: () => EnterAccNo(
              namee: Get.arguments['namee'],
              imgg: Get.arguments['imgg'],
            ),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.afterPayAmntScreen,
        page: () => AfterPaymentScreen(
              userData: Get.arguments,
            ),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.transConfirmScreen,
        page: () => const TransConfirmScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RouteName.transScriptScreen,
        page: () => const TransScriptScreen(),
        transitionDuration: const Duration(seconds: 1),
        transition: Transition.leftToRightWithFade),
  ];
}
