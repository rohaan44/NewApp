import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class GlowCircleAvatar extends StatelessWidget {
  final String imagePath;
  final bool isSvg;
  final Color bg;

  GlowCircleAvatar(
      {required this.imagePath, this.isSvg = false, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(151, 33, 149, 243),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 50, // Adjust the radius as needed
        backgroundColor: bg,
        child: Padding(
            padding: const EdgeInsets.all(10.0), // Optional padding
            child: SvgPicture.asset(
              imagePath,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
