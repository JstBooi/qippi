import 'package:flutter/material.dart';
import 'verify.dart';

class IndividualDetailsScreen extends StatefulWidget {
  const IndividualDetailsScreen({super.key});

  @override
  State<IndividualDetailsScreen> createState() =>
      _IndividualDetailsScreenState();
}

class _IndividualDetailsScreenState extends State<IndividualDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool agreedToTerms = false;
  bool showErrors = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.037;
    final double titleFontSize = screenWidth * 0.07;
    final double subtitleFontSize = screenWidth * 0.045;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 5,
                right: 24,
                top: 1,
                bottom: 24,
              ),
              color: const Color.fromARGB(255, 110, 90, 144),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Almost Done.",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Satoshi',
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "Fill in your personal details.",
                      style: TextStyle(
                        fontSize: subtitleFontSize,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Satoshi',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: showErrors
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        _buildInputField(
                          "Full Name *",
                          fullNameController,
                          fontSize,
                          validator: (val) => val == null || val.isEmpty
                              ? "Full name is required"
                              : null,
                        ),
                        const SizedBox(height: 16),
                        _buildInputField(
                          "Email *",
                          emailController,
                          fontSize,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return "Email is required";
                            if (!val.contains('@'))
                              return "Enter a valid email";
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildInputField(
                          "Mobile Number *",
                          mobileController,
                          fontSize,
                          keyboardType: TextInputType.phone,
                          validator: (val) => val == null || val.isEmpty
                              ? "Mobile number is required"
                              : null,
                        ),
                        const SizedBox(height: 16),
                        _buildInputField(
                          "Password *",
                          passwordController,
                          fontSize,
                          obscureText: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return "Password is required";
                            if (val.length < 6)
                              return "Minimum 6 characters required";
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildInputField(
                          "Confirm Password *",
                          confirmPasswordController,
                          fontSize,
                          obscureText: true,
                          validator: (val) {
                            if (val == null || val.isEmpty)
                              return "Confirm your password";
                            if (val != passwordController.text)
                              return "Passwords do not match";
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Checkbox(
                              value: agreedToTerms,
                              onChanged: (val) {
                                setState(() => agreedToTerms = val ?? false);
                              },
                              activeColor: Colors.white,
                              checkColor: Colors.deepPurple,
                            ),
                            const Expanded(
                              child: Text(
                                "I agree to the Terms of Service and Privacy Policy.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (showErrors && !agreedToTerms)
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Text(
                                "You must agree before continuing.",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontFamily: 'Satoshi',
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                showErrors = true;
                              });

                              if (_formKey.currentState!.validate() &&
                                  agreedToTerms) {
                                print("sdfdf");
                                // Proceed logic
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EmailVerificationScreen(
                                          email: 'booimahlangu@gmail.com',
                                        ),

                                    //builder: (context) => const
                                    // EmailVerificationScreen(
                                    //  email: 'booimahlangu@gmail.com',
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                101,
                                0,
                                0,
                                0,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // --- Social Sign-In Section ---
                        Row(
                          children: const [
                            Expanded(child: Divider(color: Colors.white54)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Or',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontFamily: 'Satoshi',
                                ),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.white54)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialIcon('assets/icons/google.png', () {
                              // TODO: Handle Google sign-up
                              print('Google sign-up clicked');
                            }),
                            const SizedBox(width: 24),
                            _buildSocialIcon('assets/icons/microsoft.png', () {
                              // TODO: Handle Microsoft sign-up
                              print('Microsoft sign-up clicked');
                            }),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: Colors.white70,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    TextEditingController controller,
    double fontSize, {
    String? Function(String?)? validator,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(fontSize: fontSize, fontFamily: 'Satoshi'),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: fontSize,
            fontFamily: 'Satoshi',
          ),
          filled: true,
          fillColor: const Color(0xFFD3B8FF),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
            fontFamily: 'Satoshi',
          ),
        ),
      ),
    );
  }

  static Widget _buildSocialIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Image.asset(assetPath),
        ),
      ),
    );
  }
}
