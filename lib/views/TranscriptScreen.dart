import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:paysense/controllers/EnteraccController.dart';
import 'package:paysense/controllers/SendingamountController.dart';
import 'package:paysense/controllers/TranscriptController.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/UiTemplate.dart';

class TransScriptScreen extends StatelessWidget {
  const TransScriptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final TranscriptController controller = Get.put(TranscriptController());
    final SendingAmountController recieverAmount =
        Get.find<SendingAmountController>();
    var userData = Get.find<UserController>().userData;
    var RecieverData = Get.find<EnterAccController>();
    String Datetime = DateFormat('hh:mma dd/MM/yyyy').format(DateTime.now());
    return Scaffold(
      body: RepaintBoundary(
        key: controller.globalKey,
        child: Stack(
          children: [
            const Uitemplate(),
            const Positioned(
                bottom: 0,
                right: -100,
                child: SizedBox(height: 150, child: Uitemplate())),
            Padding(
              padding: const EdgeInsets.only(left: 105.0, top: 47),
              child: Stack(children: [
                SvgPicture.asset(
                  DummyImg.splashLogo,
                  width: 78,
                ),
              ]),
            ),
            Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80, left: 55),
                    child: Text(
                      "AYSENSE",
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: ColorUtil.heading),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.50,
                            width: MediaQuery.of(context).size.width * 1.5,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: ColorUtil.bgblue,
                                      // spreadRadius: 0.5,
                                      blurRadius: 7)
                                ],
                                borderRadius: BorderRadius.circular(15),
                                color: ColorUtil.whitecolor),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Stack(children: [
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Sender Name",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                              userData['fullName'],
                                              style: GoogleFonts.poppins(
                                                  color: ColorUtil.blackcolor,
                                                  fontSize: 15,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Account ID",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                                controller.maskPhoneNumber(
                                                    userData['phoneNumber']),
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.blackcolor,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Reciever Title",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                              RecieverData.userData['fullName'],
                                              style: GoogleFonts.poppins(
                                                  color: ColorUtil.blackcolor,
                                                  fontSize: 15,
                                                  height: 1,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("To Account ID",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                                controller.maskPhoneNumber(
                                                    RecieverData.userData[
                                                        'phoneNumber']),
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.blackcolor,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Amount",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(
                                                "Rs: " +
                                                    recieverAmount
                                                        .textEdit.text,
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.blackcolor,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Date & Time",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text(Datetime,
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.blackcolor,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Channel",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.bgblue,
                                                    fontSize: 17,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Text("Paysense",
                                                style: GoogleFonts.poppins(
                                                    color: ColorUtil.blackcolor,
                                                    fontSize: 15,
                                                    height: 1,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ]),
                                  Positioned(
                                    bottom: 2,
                                    right: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              controller.captureAndSavePng();
                                            },
                                            icon: Icon(
                                              Icons.save_alt,
                                              size: 30,
                                              color: ColorUtil.bgblue,
                                            )),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                              size: 25,
                                              color: ColorUtil.bgblue,
                                            ))
                                      ],
                                    ),
                                  )
                                ])),
                          ),
                        ),
                      ),
                      FractionalTranslation(
                        translation: const Offset(0.0, -0.4),
                        child: Align(
                          alignment: const FractionalOffset(0.5, 0.0),
                          child: CircleAvatar(
                            radius: 35.0,
                            backgroundColor: ColorUtil.heading,
                            child: const Icon(
                              Icons.done,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: Get.width * 1,
        height: MediaQuery.of(context).size.height * 0.09,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => DashboardScreen());
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: MediaQuery.of(context).size.width - 70,
            height: MediaQuery.of(context).size.height * 0.09,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorUtil.bgblue, spreadRadius: 2, blurRadius: 15)
              ],
              color: const Color(0xff55a3fe),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Close",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  const Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
