import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../LoginPages/signup.dart';

import '../dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double horizontalPadding = screenWidth * 0.06;
    final double titleFontSize = screenWidth * 0.07;
    final double subtitleFontSize = screenWidth * 0.045;
    final double inputFontSize = screenWidth * 0.04;
    final double iconSize = screenWidth * 0.06;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 90, 144),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Let’s sign you in.",
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: screenHeight * 0.04),

            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white24,
                hintStyle: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: inputFontSize,
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: inputFontSize,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white24,
                hintStyle: TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: inputFontSize,
                  color: Colors.white70,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              style: TextStyle(
                fontFamily: 'Satoshi',
                fontSize: inputFontSize,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(fontFamily: 'Satoshi', color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(77, 0, 0, 0),
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.014),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),

                      //builder: (context) => const
                      // EmailVerificationScreen(
                      //  email: 'booimahlangu@gmail.com',
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: inputFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.04),

            Row(
              children: const [
                Expanded(child: Divider(color: Colors.white)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Or",
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: Divider(color: Colors.white)),
              ],
            ),

            SizedBox(height: screenHeight * 0.03),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: iconSize,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/icons/google.png',
                    width: iconSize,
                  ),
                ),
                SizedBox(width: screenWidth * 0.08),
                CircleAvatar(
                  radius: iconSize,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/icons/microsoft.png',
                    width: iconSize,
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.05),

            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    color: Colors.white,
                    fontSize: screenWidth * 0.035,
                  ),
                  children: [
                    const TextSpan(text: "Don’t have an account? "),
                    TextSpan(
                      text: "Signup",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RoleSelectionScreen(),
                            ),
                            (route) => route.isFirst,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
