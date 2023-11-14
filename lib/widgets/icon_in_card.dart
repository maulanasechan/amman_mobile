import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IconInCard extends StatelessWidget {
  const IconInCard({
    super.key,
    required this.imageIcon,
    this.titleIcon = '',
    this.iconType = 1,
  });

  final String imageIcon;
  final String titleIcon;
  final int iconType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconType == 1
                  ? const Color.fromARGB(255, 219, 241, 241)
                  : null,
              gradient: iconType == 2
                  ? const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 4, 172, 234),
                        Color.fromARGB(255, 25, 109, 195),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Image.asset(
              imageIcon,
              width: 25,
              height: 25,
            ),
          ),
          const SizedBox(
              height: 8), // Add some spacing between the icon and text
          Container(
            constraints: const BoxConstraints(
              maxWidth: 58,
            ),
            child: Text(
              titleIcon,
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSans(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 6, 38, 51),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
