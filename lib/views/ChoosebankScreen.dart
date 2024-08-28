import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/ChoosebankController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/EnteraccScreen.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/GrowCircle.dart';

class ChooseBankScreen extends StatelessWidget {
  const ChooseBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    ChooseBankController homeController = Get.put(ChooseBankController());
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
              left: 35,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose Institution",
                style: GoogleFonts.poppins(
                  color:
                      isDarkMode ? ColorUtil.blackcolor : ColorUtil.whitecolor,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextField(
                onChanged: (value) => homeController.filterPlayer(value),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorUtil.bordercolor, width: 1),
                    ),
                    hintText: 'Search....',
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorUtil.bordercolor,
                    ),
                    hintStyle: TextStyle(color: ColorUtil.bordercolor)),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: homeController.foundPlayers.value.length,
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 7),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => EnterAccNo(
                                    namee: homeController
                                        .foundPlayers.value[index]['bankname'],
                                    imgg: homeController
                                        .foundPlayers.value[index]['bankimg'],
                                  )));
                    },
                    child: ListTile(
                      leading: GlowCircleAvatar(
                          imagePath: homeController.foundPlayers.value[index]
                              ['bankimg']),
                      // leading: ClipOval(

                      //   child: SvgPicture.asset(
                      //   homeController.foundPlayers.value[index]['bankimg'],
                      //   fit: BoxFit.cover,
                      // )
                      //     // radius: 20,
                      //     ),
                      title: Text(
                        homeController.foundPlayers.value[index]['bankname'],
                        style: GoogleFonts.poppins(
                          color: isDarkMode
                              ? ColorUtil.blackcolor
                              : ColorUtil.whitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ])),
    );
  }
}
