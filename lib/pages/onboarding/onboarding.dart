import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../LoginPages/signup.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  String buttonText = 'Next';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final pageIndex = _controller.page?.round() ?? 0;
      if (pageIndex == 2 && buttonText != 'Sign up') {
        setState(() {
          buttonText = 'Sign up';
        });
      } else if (pageIndex != 2 && buttonText != 'Next') {
        setState(() {
          buttonText = 'Next';
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true, //SAFEARE ONLY APPLIED AT THE BOTTOM BAR
      top: false,

      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 110, 90, 144),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller,
                    children: [firstPage(), secondPage(), thirdPage()],
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),

            // Dot indicator
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    dotColor: Colors.white24,
                    dotHeight: 6,
                    dotWidth: 8,
                    spacing: 10,
                    radius: 0,
                  ),
                ),
              ),
            ),

            // Button
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // No page check here — only button action
                    if (_controller.page?.round() == 2) {
                      // Navigate or perform sign-up logic
                      print("Sign up pressed");
                      // showSignUpSheet(context);
                      //showAuthSheet(context, showSignUp: true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RoleSelectionScreen(),
                        ),
                        (route) => route.isFirst,
                      );
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF6E559F),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  child: Text(buttonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
