import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  IconData iconn;
  String title;
  RoundButton({super.key, required this.iconn, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          // width: MediaQuery.of(context).size.width * 0.15,
          // height: MediaQuery.of(context).size.height * 0.08 ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorUtil.bgblue,
          ),
          child: Icon(
            iconn,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              height: 1.1,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
