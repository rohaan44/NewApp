import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/EnteraccController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Button.dart';

class EnterAccNo extends StatelessWidget {
  String namee;
  String imgg;
  EnterAccNo({super.key, required this.namee, required this.imgg});

  @override
  Widget build(BuildContext context) {
    EnterAccController enterAccController = Get.put(EnterAccController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            const Positioned(
                bottom: 0,
                right: -100,
                child: SizedBox(height: 150, child: Uitemplate())),
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 45.0, bottom: 20),
                child: Row(
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
                            ? ColorUtil.blackcolor
                            : ColorUtil.whitecolor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter account number",
                    style: GoogleFonts.poppins(
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ListTile(
                  leading: ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          imgg,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    namee,
                    style: TextStyle(
                        color: isDarkMode
                            ? ColorUtil.blackcolor
                            : ColorUtil.whitecolor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Account number",
                    style: GoogleFonts.poppins(
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                    ),
                    controller: enterAccController.textacc,
                    onTap: () => enterAccController.openModal(context),
                    readOnly: true,
                    decoration: InputDecoration(
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: Color(0xff459BFF),
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 2,
                            color: Color(0xff459BFF),
                          ),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(11),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 2, color: Colors.red),
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Obx(() {
                  return DummyButton(
                    isLoading: enterAccController.loading.value,
                    title: "Continue",
                    clr: ColorUtil.bgblue,
                    onPress: () => enterAccController.verifyAccountNumber(),
                    textClr: ColorUtil.whitecolor,
                  );
                }),
              ),
              SizedBox(
                height: Get.height * 0.09,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
