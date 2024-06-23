// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterchallenge/Home/detail_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final LocalAuthentication _auth = LocalAuthentication();
  bool _isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/background_dog.png'),
          Center(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 43,
                  ),
                  Image.asset(
                    'assets/images/Logo.png',
                    height: 22,
                    width: 148,
                  ),
                  const SizedBox(
                    height: 55,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Helping you\nto keep ",
                      style: GoogleFonts.manrope(
                          fontSize: 24,
                          color: const Color(0xFFDEE1FE),
                          letterSpacing: 3.5 / 100,
                          height: 152 / 100),
                      children: const [
                        TextSpan(
                            text: "your bestie",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800)),
                        TextSpan(text: "\nstay healthy!"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          _biometric(context)
        ],
      ),
    );
  }

  Center _biometric(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Sign Here",
                style: GoogleFonts.mavenPro(
                  fontSize: 18,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () async {
                  if (!_isAuthenticated) {
                    final bool canAuthenticateWithBiometrics =
                        await _auth.canCheckBiometrics;
                    if (canAuthenticateWithBiometrics) {
                      try {
                        final bool didAuthenticate = await _auth.authenticate(
                          localizedReason: 'Please authenticate to proceed',
                          options: const AuthenticationOptions(
                            biometricOnly: false,
                          ),
                        );
                        setState(() {
                          _isAuthenticated = didAuthenticate;
                        });
                        if (didAuthenticate) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DetailView()));
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    }
                  } else {
                    setState(() {
                      _isAuthenticated = false;
                    });
                  }
                },
                icon: Icon(
                  _isAuthenticated ? Icons.fingerprint : Icons.fingerprint,
                  size: 50,
                ),
                color: Colors.white,
                iconSize: 60,
              ),
              Center(
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svgs/faceID.svg',
                    color: Colors.white,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 130,
          ),
        ],
      ),
    );
  }
}
