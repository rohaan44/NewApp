import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DummyButton extends StatelessWidget {
  final Object title;
  final bool isLoading;
  final Color clr;
  final Color textClr;
  final VoidCallback onPress;
  const DummyButton(
      {super.key,
      required this.title,
      required this.clr,
      required this.textClr,
      this.isLoading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration:
          BoxDecoration(color: clr, borderRadius: BorderRadius.circular(12)),
      child: MaterialButton(
        onPressed: onPress,
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  "$title",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color: textClr,
                  ),
                ),
        ),
      ),
    );
  }
}
