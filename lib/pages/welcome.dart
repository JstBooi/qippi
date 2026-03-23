import 'package:flutter/material.dart';
import 'LoginPages/login.dart';
import '../pages/onboarding/onboarding.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _logoCtrl;
  late final Animation<Offset> _logoSlide;

  @override
  void initState() {
    super.initState();
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _logoSlide = Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.20))
        .animate(
          CurvedAnimation(
            parent: _logoCtrl,
            curve: Curves.easeOut,
            reverseCurve: Curves.easeIn,
          ),
        );
  }

  @override
  void dispose() {
    _logoCtrl.dispose();
    super.dispose();
  }

  Future<void> _openLogin() async {
    _logoCtrl.forward();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SlideTransition(
                position: _logoSlide,
                child: Column(
                  children: [
                    SizedBox(
                      height: screen.height * .10,
                      child: Image.asset(
                        'lib/images/logo.png',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -screen.height * 0.02),
                      child: const Text(
                        'Qippi',
                        style: TextStyle(
                          fontFamily: 'Satoshi',
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      'Smart Procurement & Quote Management',
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(225, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screen.height * .09),

              SizedBox(
                height: screen.height * .30,
                child: Image.asset(
                  'lib/images/agreement.png',
                  width: 120,
                  height: 120,
                ),
              ),

              Container(
                height: screen.height * .30,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OnboardingScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(240, 40),
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          'Get started',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      ElevatedButton(
                        onPressed: _openLogin,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(240, 40),
                          backgroundColor: const Color.fromARGB(97, 0, 0, 0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
