import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/ChoosebankScreen.dart';
import 'package:paysense/views/UiTemplate.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          const Uitemplate(),
          const Positioned(
                      bottom: 0,
                      right: -100,
                      child: SizedBox(height: 150, child: Uitemplate())),
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 35, top: 45.0, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: SvgPicture.asset(DummyImg.chevleft,
                      width: 32,
                      height: 32,
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, bottom: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Send Money",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: GestureDetector(
                onTap: () {
                  Get.to(()=>ChooseBankScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.145,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorUtil.bgcolor,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: ColorUtil.whitecolor,
                        child: const Icon(Icons.food_bank_rounded),
                      ),
                      title: Text(
                        "New bank transfer",
                        style: GoogleFonts.poppins(
                          color: ColorUtil.blackcolor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        "Send money to any bank or wallet account in Pakistan.",
                        style: GoogleFonts.poppins(
                          color: isDarkMode
                              ? ColorUtil.blackcolor
                              : ColorUtil.whitecolor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
