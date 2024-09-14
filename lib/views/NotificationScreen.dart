import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/UiTemplate.dart';

class NotiView extends StatelessWidget {
  const NotiView({super.key});

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
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        DummyImg.chevleft,
                        width: 30,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    Text('Notifications',
                        style: GoogleFonts.poppins(
                            fontSize: 23, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.8, color: ColorUtil.dividercolor))),
                  child: ListTile(
                    leading: Image.asset(DummyImg.standardchart),
                    title: Text('Incoming Fund Transfer',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    subtitle: Text(
                        'Incoming fund transfer of RS. 5,000 from Standard Charted- 7901',
                        style: GoogleFonts.poppins(
                            fontSize: 9, fontWeight: FontWeight.w400)),
                    trailing: Text('16 April 2023',
                        style: GoogleFonts.poppins(
                            fontSize: 8, fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.8, color: ColorUtil.dividercolor))),
                  child: ListTile(
                    leading: Image.asset(DummyImg.standardchart),
                    title: Text('Incoming Fund Transfer',
                        style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w400)),
                    subtitle: Text(
                        'Incoming fund transfer of RS. 5,000 from Standard Charted- 7901',
                        style: GoogleFonts.poppins(
                            fontSize: 9, fontWeight: FontWeight.w400)),
                    trailing: Text('14 Sept 2024',
                        style: GoogleFonts.poppins(
                            fontSize: 8, fontWeight: FontWeight.w400)),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
