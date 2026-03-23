import 'package:flutter/material.dart';
import 'individualSign.dart';

class ClientTypeScreen extends StatelessWidget {
  const ClientTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenWidth = screen.width;

    final double titleFontSize = screenWidth * 0.065;
    final double subtitleFontSize = screenWidth * 0.042;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      body: Column(
        children: [
          // Header section
          Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 110, 90, 144),
            padding: const EdgeInsets.only(
              left: 6,
              right: 24,
              top: 25,
              bottom: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Client Type.",
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
                    "Are you representing a company or purchasing as an individual?",
                    style: TextStyle(
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Options section centered
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Company Option
                    GestureDetector(
                      onTap: () {
                        print("Supplier selected");
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E8FF),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/people.png',
                              width: 70,
                              height: 70,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: 14),
                            Text(
                              "Company",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              "I'm purchasing for my company",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Individual Option with PNG icon
                    GestureDetector(
                      onTap: () {
                        print("Client selected");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const IndividualDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3E8FF),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'lib/images/user.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "Individual",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                fontFamily: 'Satoshi',
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              "I'm purchasing for personal use",
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Satoshi',
                                fontWeight: FontWeight.w500,
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
          ),
        ],
      ),
    );
  }
}
