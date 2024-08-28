import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/colors.dart';

class CustomKeyboard extends StatefulWidget {
  final Function(String) onKeyPressed;
  final double height;
  const CustomKeyboard(
      {super.key, required this.onKeyPressed, required this.height});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(['1', '2', '3']),
        buildRow(['4', '5', '6']),
        buildRow(['7', '8', '9']),
        buildRow(['', '0', '⌫'], special: true),
      ],
    );
  }

  Widget buildRow(List<String> keys, {bool special = false}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: keys.map((key) {
        return Expanded(
          child: TextButton(
            onPressed: () => widget.onKeyPressed(key),
            child: Text(key,
                style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? ColorUtil.blackcolor
                        : ColorUtil.whitecolor,
                    fontSize: 25,
                    height: widget.height,
                    fontWeight: FontWeight.w500)),
          ),
        );
      }).toList(),
    );
  }
}
