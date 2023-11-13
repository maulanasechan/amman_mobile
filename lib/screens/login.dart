import 'package:amman_mobile_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyBorderClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 2 / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 231, 246, 62),
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 2 / 3 - 25,
                      width: double.infinity,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 2, 65, 91),
                              Color.fromARGB(255, 74, 183, 186),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.overlay,
                        child: Image.asset(
                          'assets/images/login.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 183,
                      height: 155,
                      child: Image.asset(
                        'assets/logo/logo_text_white.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
            child: Column(
              children: [
                Text(
                  'Sign in',
                  style: GoogleFonts.notoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => const HomeScreen(),
                      ),
                    );
                  },
                  icon: Image.asset(
                    'assets/logo/microsoft.png',
                    width: 21,
                    height: 21,
                    fit: BoxFit.cover,
                  ),
                  label: Text(
                    'Sign in with Microsoft',
                    style: GoogleFonts.notoSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 6, 38, 51),
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
                    ),
                    side: MaterialStateProperty.all(const BorderSide(
                        color: Color.fromARGB(255, 146, 159, 177))),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    Text(
                      'Don\'t have an account',
                      style: GoogleFonts.notoSans(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Please request an access at',
                          style: GoogleFonts.notoSans(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Ticketing Application',
                          style: GoogleFonts.notoSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 74, 183, 186),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 20)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 20,
        size.width,
        size.height - 20,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, size.height - 35)
      ..quadraticBezierTo(
        size.width / 2,
        size.height + 30,
        size.width,
        size.height - 35,
      )
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
