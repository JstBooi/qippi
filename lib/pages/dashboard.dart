// IMPORT FLUTTER MATERIAL DESIGN PACKAGE FOR UI COMPONENTS
import 'package:flutter/material.dart';
// IMPORT GOOGLE NAV BAR PACKAGE FOR CUSTOM NAVIGATION BAR
import 'package:google_nav_bar/google_nav_bar.dart';
// IMPORT SERVICES TO CONTROL SYSTEM UI
import 'package:flutter/services.dart';

// CREATE A STATEFUL WIDGET FOR THE DASHBOARD SCREEN
class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

// CREATE THE STATE CLASS FOR THE DASHBOARD SCREEN
class _DashboardScreenState extends State<DashboardScreen> {
  // VARIABLE TO TRACK THE SELECTED TAB INDEX (0 = HOME BY DEFAULT)
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // HIDE SYSTEM BOTTOM NAVIGATION AND STATUS BAR
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  Widget build(BuildContext context) {
    // GET THE SCREEN WIDTH FOR RESPONSIVE DESIGN
    final screenWidth = MediaQuery.of(context).size.width;

    // BUILD THE SCAFFOLD (MAIN APP LAYOUT STRUCTURE)
    return Scaffold(
      // SET BACKGROUND COLOR TO PURPLE
      backgroundColor: const Color.fromARGB(255, 110, 90, 144),
      // SAFE AREA ENSURES CONTENT IS NOT HIDDEN BY NOTCHES ETC
      body: SafeArea(
        // COLUMN LAYOUT FOR VERTICAL ARRANGEMENT OF WIDGETS
        child: Column(
          // ALIGN CHILDREN TO THE START (LEFT) OF THE SCREEN
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ADD PADDING AROUND THE TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              // DASHBOARD TITLE TEXT
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // CENTER THE DASHBOARD METRICS CONTAINER
            Center(
              child: Container(
                // INTERNAL PADDING
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                // MARGIN AROUND THE CONTAINER
                margin: const EdgeInsets.symmetric(horizontal: 20),
                // SET WIDTH TO 90% OF SCREEN WIDTH
                width: screenWidth * 0.9,
                // STYLING FOR THE CONTAINER
                decoration: BoxDecoration(
                  color: const Color(0xFFB996E6),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(32, 0, 0, 0),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                // ROW LAYOUT FOR HORIZONTAL ARRANGEMENT OF METRICS
                child: Row(
                  // SPACE ITEMS EVENLY ALONG THE ROW
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // CALL CUSTOM WIDGET TO SHOW ICON AND NUMBER
                    dashboardItem(Icons.assignment_turned_in, '17'),
                    // ADD VERTICAL DIVIDER BETWEEN ITEMS
                    verticalDivider(),
                    dashboardItem(Icons.schedule, '3'),
                    verticalDivider(),
                    dashboardItem(Icons.assignment_turned_in, '26'),
                  ],
                ),
              ),
            ),
            // EXPANDED WIDGET TAKES UP ALL REMAINING SPACE
            Expanded(
              child: Center(
                // PLACEHOLDER ICON IN CENTER OF SCREEN
                child: Icon(Icons.add, size: 64, color: Colors.white54),
              ),
            ),
          ],
        ),
      ),
      // FLOATING ACTION BUTTON AT BOTTOM CENTER
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Container(
          // RESPONSIVE SIZE BASED ON SCREEN WIDTH
          height: screenWidth * 0.15,
          width: screenWidth * 0.15,
          // CIRCULAR CONTAINER STYLING
          decoration: BoxDecoration(
            color: const Color(0xFF2F1B4C),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(52, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          // BUTTON WITH CIRCULAR SHAPE
          child: RawMaterialButton(
            shape: const CircleBorder(),
            onPressed: () {
              // EMPTY ONPRESS HANDLER (WILL DO SOMETHING WHEN TAPPED)
            },
            child: const Icon(Icons.add, size: 36, color: Colors.white),
          ),
        ),
      ),
      // POSITION THE FLOATING BUTTON ABOVE THE NAVIGATION BAR
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF4C3574),
          // ROUNDED CORNERS
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          // GOOGLE NAVIGATION BAR IMPLEMENTATION
          child: GNav(
            backgroundColor: const Color(0xFF4C3574),
            color: Colors.white70,
            activeColor: Colors.white,
            tabBackgroundColor: const Color(0xFF6A4BAF),
            gap: 8,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              // UPDATE SELECTED INDEX WHEN TAB CHANGES
              setState(() {
                _selectedIndex = index;
              });
            },
            // NAVIGATION BAR ITEMS
            tabs: const [
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.assignment, text: 'Suppliers'),
              GButton(icon: Icons.notifications, text: 'Alerts'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  // HELPER WIDGET TO CREATE DASHBOARD METRIC ITEMS
  Widget dashboardItem(IconData icon, String number) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ICON WITH SPECIFIED SIZE AND COLOR
          Icon(icon, size: 32, color: Colors.white70),
          const SizedBox(height: 4),
          // TEXT BELOW THE ICON
          Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // HELPER WIDGET TO CREATE VERTICAL DIVIDERS
  Widget verticalDivider() {
    return Container(width: 1, height: 40, color: Colors.white38);
  }
}
