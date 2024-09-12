import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/QrTransconfirmController.dart';
import 'package:paysense/controllers/SendingamountController.dart';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/QrTransConfirmScreen.dart';
import 'package:paysense/views/UiTemplate.dart';

class QrAfterPaymentScreen extends StatelessWidget {
  final RxMap<dynamic, dynamic> userData;
  const QrAfterPaymentScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final SendingAmountController bePayAmntController =
        Get.put(SendingAmountController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Uitemplate(),
          const Positioned(
              bottom: 0,
              right: -100,
              child: SizedBox(height: 150, child: Uitemplate())),
          ListView(children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 45.0, bottom: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      DummyImg.chevleft,
                      width: 32,
                      height: 32,
                      color: isDarkMode
                          ? ColorUtil.whitecolor
                          : ColorUtil.blackcolor,
                    ),
                  ),
                  Text(
                    "Confirm",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.12,
                      color: isDarkMode
                          ? ColorUtil.whitecolor
                          : ColorUtil.blackcolor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(RouteName.dashboardScreen);
                    },
                    child: SvgPicture.asset(
                      DummyImg.closecircle,
                      width: 32,
                      height: 32,
                      color: isDarkMode
                          ? ColorUtil.whitecolor
                          : ColorUtil.blackcolor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.13,
                  decoration: BoxDecoration(
                    color: ColorUtil.whitecolor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(185, 85, 164, 254),
                          spreadRadius: 1,
                          blurRadius: 15)
                    ],
                  ),
                  child: Center(
                    child: ListTile(
                      leading: const CircleAvatar(
                          //backgroundImage: NetworkImage(imgg), // Display user image
                          ),
                      title: Text(
                        userData['fullName'] ??
                            "Unknown User", // Display user name
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.36,
                          color: isDarkMode ? Colors.black87 : Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        userData['phoneNumber'] ??
                            "Unknown Number", // Display phone number
                        style: GoogleFonts.poppins(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? Colors.black87 : Colors.black87,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(185, 85, 164, 254),
                        spreadRadius: 1,
                        blurRadius: 15)
                  ],
                  color: ColorUtil.whitecolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  children: ListTile.divideTiles(
                      context: context,
                      color: isDarkMode ? Colors.grey : Colors.grey,
                      tiles: [
                        Container(
                          height: 65,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sender fee\t",
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                  color: ColorUtil.blackcolor,
                                ),
                              ),
                              Text(
                                "Rs. 0🔥",
                                style: GoogleFonts.poppins(
                                  color: isDarkMode
                                      ? Colors.black87
                                      : Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recipient will get",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                  color: isDarkMode
                                      ? Colors.black87
                                      : Colors.black87,
                                ),
                              ),
                              Text(
                                "Rs. ${bePayAmntController.textEdit.text}",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                  color: isDarkMode
                                      ? Colors.black87
                                      : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Kuch kehna haw?\t",
                                style: GoogleFonts.poppins(
                                  fontSize: 15.6,
                                  color: isDarkMode
                                      ? Colors.black87
                                      : Colors.black87,
                                  height: -1.0000001,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.6,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: TextField(
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: ColorUtil.bgblue, width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: const BorderSide(
                                            color: Color(0xff979797), width: 1),
                                      ),
                                      hintText: 'e.g today’s Break Fast 🍞',
                                      hintStyle: const TextStyle(
                                        color: Color(0xff979797),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ]).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35, top: 40),
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>QrTransConfirmScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.09,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(185, 85, 164, 254),
                          spreadRadius: 1,
                          blurRadius: 15)
                    ],
                    color: const Color(0xff55a3fe),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send Rs. ${bePayAmntController.textEdit.text}",
                          style: GoogleFonts.poppins(
                              fontSize: 19.5,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.whitecolor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ]),
        ],
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Confirm Payment"),
    //   ),
    //   body: ListView(
    //     padding: const EdgeInsets.all(20.0),
    //     children: [
    //       ListTile(
    //         leading: CircleAvatar(
    //           backgroundImage: NetworkImage(userData['profilePicUrl'] ?? ''),
    //         ),
    //         title: Text(userData['fullName'] ?? 'Unknown User'),
    //         subtitle: Text(userData['phoneNumber'] ?? 'Unknown Number'),
    //       ),
    //       // Additional UI for payment confirmation
    //     ],
    //   ),
    // );
  }
}
