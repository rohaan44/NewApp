import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/DrawerScreenController.dart';
import 'package:paysense/utils/CustomDialogue.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/UiTemplate.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final DrawerScreenController drawerController =
        Get.put(DrawerScreenController());
    return Scaffold(
      body: Stack(children: [
        const Uitemplate(),
        const Positioned(
            bottom: 0,
            right: -100,
            child: SizedBox(height: 150, child: Uitemplate())),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 80.0, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      DummyImg.chevleft,
                      width: 35,
                      // ignore: deprecated_member_use
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        drawerController.toggleSwitchTheme(
                            !drawerController.isSwitched.value);
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                          color: drawerController.isSwitched.value
                              ? const Color(0xFF333333)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              offset: const Offset(5, 5),
                              blurRadius: 15,
                            ),
                            const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-5, -5),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 10,
                              child: Icon(
                                Icons.sunny, // Replacing sun with settings icon
                                color: drawerController.isSwitched.value
                                    ? Colors.white
                                    : Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              child: Icon(
                                Icons.nightlight_round,
                                color: drawerController.isSwitched.value
                                    ? Colors.white
                                    : const Color(0xFF333333),
                              ),
                            ),
                            AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              left: drawerController.isSwitched.value ? 35 : 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  color: drawerController.isSwitched.value
                                      ? Colors.white
                                      : const Color(0xFF333333),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: const Offset(5, 5),
                                      blurRadius: 15,
                                    ),
                                    const BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(-5, -5),
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    drawerController.isSwitched.value
                                        ? Icons.nightlight_round
                                        : Icons.sunny,
                                    color: drawerController.isSwitched.value
                                        ? const Color(0xff3333333)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ListTile(
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(11)),
                  child: CircleAvatar(
                    radius: 100,
                    child: SvgPicture.asset(
                      DummyImg.dp,
                    ),
                  ),
                ),
                title: Text(
                  'My Account',
                  style: GoogleFonts.poppins(
                    fontSize: Get.width * 0.080,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                subtitle: Text(
                  'Profile, Setting, & Mores',
                  style: GoogleFonts.poppins(
                    fontSize: Get.width * 0.040,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                  leading: Text(
                    'Account Settings',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ListTile(
                  leading: Text(
                    'Switch to Business',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                  leading: Text(
                    'Account level',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                  leading: Text(
                    'My Favorites',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Help',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                  leading: Text(
                    'How to use Pay Sense',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              child: ListTile(
                  leading: Text(
                    'Customer Support',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  trailing: const Icon(Icons.chevron_right)),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      onPressed: () {
                        drawerController.signOutUser(context);
                      },
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sign out',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      // floatingActionButton: SingleChildScrollView(
      //   child: Column(
      //     children: [

      //     ],
      //   ),
      // ),
    );
  }
}
