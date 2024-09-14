import 'package:get/get.dart';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/views/AfterpaymentScreen.dart';
import 'package:paysense/views/ChoosebankScreen.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/DrawerScreen.dart';
import 'package:paysense/views/EnteraccScreen.dart';
import 'package:paysense/views/HomeScreen.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:paysense/views/NotificationScreen.dart';
import 'package:paysense/views/SendamountScreen.dart';
import 'package:paysense/views/SendmoneyScreen.dart';
import 'package:paysense/views/SignupScreen.dart';
import 'package:paysense/views/SplashScreen.dart';
import 'package:paysense/views/TransconfirmScreen.dart';
import 'package:paysense/views/TranscriptScreen.dart';
import 'package:paysense/widgets/PersistentBottom.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RouteName.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteName.drawerScreen,
      page: () => const DrawerScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteName.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteName.notificationScreen,
      page: () => const NotiView(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteName.signupScreen,
      page: () => const SignupScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: RouteName.loginScreen,
        page: () => LoginScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.dashboardScreen,
        page: () => Persistent(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.sendAmountScreen,
        page: () => const SendAmountScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.sendmoneyScreen,
        page: () => const SendMoneyScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.chooseBankScreen,
        page: () => const ChooseBankScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.enterAccNoScreen,
        page: () => EnterAccNo(
              namee: Get.arguments['namee'],
              imgg: Get.arguments['imgg'],
            ),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.afterPayAmntScreen,
        page: () => AfterPaymentScreen(
              userData: Get.arguments,
            ),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.transConfirmScreen,
        page: () => const TransConfirmScreen(),
        transition: Transition.leftToRight),
    GetPage(
        name: RouteName.transScriptScreen,
        page: () => const TransScriptScreen(),
        transition: Transition.leftToRight),
  ];
}
