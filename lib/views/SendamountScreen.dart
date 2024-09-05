import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/SendingamountController.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/views/SendmoneyScreen.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Customkeyboard.dart';

class SendAmountScreen extends StatelessWidget {
  const SendAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final SendingAmountController bePayAmntView =
        Get.put(SendingAmountController());
    final UserController userController = Get.find<UserController>();
    return Scaffold(
      body: Stack(
        children: [
          const Uitemplate(),
          const Positioned(
              bottom: 0,
              right: -100,
              child: SizedBox(height: 150, child: Uitemplate())),
          Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
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
                ),
              ),
              Center(
                child: Obx(
                  () {
                    if (userController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userController.errorMessage.isNotEmpty) {
                      return Center(
                          child: Text(userController.errorMessage.value));
                    } else if (userController.userData.isEmpty) {
                      return Center(child: Text('No data available'));
                    } else {
                      var userData = userController.userData.value;
                      return Text(
                        "Current Balance \n \t\t\t\t\t\t\tRs " +
                            userData['amount'],
                        style: GoogleFonts.poppins(
                          color: isDarkMode
                              ? ColorUtil.whitecolor
                              : ColorUtil.blackcolor,
                          height: 1.3,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rs.  ",
                      style: GoogleFonts.poppins(
                        color: isDarkMode
                            ? ColorUtil.whitecolor
                            : ColorUtil.blackcolor,
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Obx(
                        () => TextField(
                          style: TextStyle(
                            fontSize: bePayAmntView.fontSize.value,
                            color: isDarkMode
                                ? ColorUtil.whitecolor
                                : ColorUtil.blackcolor,
                          ),
                          onChanged: (newText) {
                            bePayAmntView.onTextChanged(newText);
                          },
                          controller: bePayAmntView.textEdit,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '0',
                            hintStyle: TextStyle(
                              fontSize: 40,
                              color: isDarkMode
                                  ? ColorUtil.whitecolor
                                  : ColorUtil.blackcolor,
                            ),
                            // errorText: bePayAmntView.showError.value
                            //     ? 'Value must be <= 200000'
                            //     : null,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CustomKeyboard(
                  height: 1.5,
                  onKeyPressed: (value) {
                    if (value == '⌫') {
                      if (bePayAmntView.textEdit.text.isNotEmpty) {
                        bePayAmntView.textEdit.text =
                            bePayAmntView.textEdit.text.substring(
                                0, bePayAmntView.textEdit.text.length - 1);
                      }
                    } else {
                      bePayAmntView.textEdit.text += value;
                    }
                    bePayAmntView.onTextChanged(bePayAmntView.textEdit.text);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: bePayAmntView.isButtonEnabled.value
                                ? const Color(0xff75b3fc)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Request",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: ColorUtil.whitecolor,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          if (bePayAmntView.isButtonEnabled.value) {
                            Get.toNamed(RouteName.sendmoneyScreen);
                          } else {
                            null;
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                            color: bePayAmntView.isButtonEnabled.value
                                ? const Color(0xff75b3fc)
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 0.8,
                                color: ColorUtil.whitecolor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
    );
  }
}
