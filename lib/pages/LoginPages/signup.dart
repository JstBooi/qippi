import 'package:flutter/material.dart';
import 'clientSignUp.dart'; // Make sure this is imported

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;
    final double titleFontSize = screenWidth * 0.07;
    final double subtitleFontSize = screenWidth * 0.045;
    final double roleTitleFontSize = isTablet
        ? 22
        : 18; // Title size for Supplier & Client

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 90, 144),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Role.",
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Satoshi',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "How will you primarily use Qippi?",
              style: TextStyle(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
                fontFamily: 'Satoshi',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Center(
                child: isTablet
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: _roleCard(
                              context,
                              iconPath: 'assets/icons/supplier.png',
                              title: 'Supplier',
                              titleFontSize: roleTitleFontSize,
                              features: [
                                'Discover New Clients',
                                'Receive Quote Requests',
                                'Send Quotes & Invoices',
                              ],
                              onTap: () {
                                print("Supplier Selected");
                              },
                            ),
                          ),
                          const SizedBox(width: 24),
                          Flexible(
                            child: _roleCard(
                              context,
                              iconPath: 'assets/icons/client.png',
                              title: 'Client',
                              titleFontSize: roleTitleFontSize,
                              features: [
                                'Requests Quotes',
                                'Discover Suppliers Near You',
                                'Maintain Audit trail',
                              ],
                              onTap: () {
                                print("Client Selected");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ClientTypeScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _roleCard(
                            context,
                            iconPath: 'assets/icons/supplier.png',
                            title: 'Supplier',
                            titleFontSize: roleTitleFontSize,
                            features: [
                              'Discover New Clients',
                              'Receive Quote Requests',
                              'Send Quotes & Invoices',
                            ],
                            onTap: () {
                              print("Supplier Selected");
                            },
                          ),
                          const SizedBox(height: 24),
                          _roleCard(
                            context,
                            iconPath: 'assets/icons/client.png',
                            title: 'Client',
                            titleFontSize: roleTitleFontSize,
                            features: [
                              'Requests Quotes',
                              'Discover Suppliers Near You',
                              'Maintain Audit trail',
                            ],
                            onTap: () {
                              print("Client Selected");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ClientTypeScreen(),
                                ),
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

  Widget _roleCard(
    BuildContext context, {
    required String iconPath,
    required String title,
    required List<String> features,
    required VoidCallback onTap,
    double titleFontSize = 20, // Default title size
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth > 600 ? 280.0 : double.infinity;
    final double featureFontSize = screenWidth > 600
        ? 15
        : 13; // Responsive font size for features

    return Material(
      color: const Color(0xFFD9B8FF),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: cardWidth,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconPath, height: 70),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'Satoshi',
                ),
              ),
              const SizedBox(height: 12),
              ...features.map(
                (f) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    f,
                    style: TextStyle(
                      fontSize: featureFontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontFamily: 'Satoshi',
                    ),
                    textAlign: TextAlign.center,
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
