import 'package:flutter/material.dart';
import 'package:servicehub/activity.dart';
import 'package:servicehub/purchase.dart';
import 'package:google_fonts/google_fonts.dart'; // Ensure this is imported

class RepairWorksScreen extends StatefulWidget {
  const RepairWorksScreen({Key? key}) : super(key: key);

  @override
  State<RepairWorksScreen> createState() => _RepairWorksScreenState();
}

class _RepairWorksScreenState extends State<RepairWorksScreen> {
  // A map to store the selection state of each service
  final Map<String, bool> _serviceSelection = {
    'Fan Installation': false,
    'AC Services': false,
    'Refrigerator Services': false,
    'Washing machine': false,
    'Mixer & Grinder': false,
    'Computer Services': false,
  };

  // Declare _currentIndex here within the State class
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF22222E), // Dark background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9A825), // App Bar background color set to orange
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text( // Changed to use GoogleFonts
          'Repair works',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.white), // Changed to white for better contrast
                const SizedBox(width: 4),
                Text( // Changed to use GoogleFonts
                  'Chennai',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Text( // Changed to use GoogleFonts
              'Select the services you provide!',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.9),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: _serviceSelection.keys.map((serviceName) {
                return _buildServiceCard(
                  serviceName,
                  _getImageForService(serviceName),
                  _serviceSelection[serviceName]!,
                  (bool? newValue) {
                    setState(() {
                      _serviceSelection[serviceName] = newValue!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit logic here
                  print('Selected Services:');
                  _serviceSelection.forEach((service, isSelected) {
                    if (isSelected) {
                      print(service);
                    }
                  });
                  // Example: Navigate to another screen or show a success message
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF9A825), // Orange button background
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text( // Changed to use GoogleFonts
                  'SUBMIT',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          _buildBottomNavigationBar(), // Call the bottom navigation bar
        ],
      ),
    );
  }

  Widget _buildServiceCard(
      String serviceName, String imagePath, bool isSelected, ValueChanged<bool?> onChanged) {
    return Card(
      color: const Color(0xFF3B3E52), // Darker card background
      margin: const EdgeInsets.only(bottom: 15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          onChanged(!isSelected); // Toggle selection on tap
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text( // Changed to use GoogleFonts
                  serviceName,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Theme(
                data: ThemeData(
                  unselectedWidgetColor: Colors.white, // Unchecked box color set to white
                ),
                child: Checkbox(
                  value: isSelected,
                  onChanged: onChanged,
                  activeColor: const Color(0xFFF9A825), // Orange checkmark color
                  checkColor: Colors.white, // Color of the check itself
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce tap area
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getImageForService(String serviceName) {
    // Ensure these paths are correct for your assets folder and pubspec.yaml declaration
    switch (serviceName) {
      case 'Fan Installation':
        return 'lib/images/fan_installation.png';
      case 'AC Services':
        return 'lib/images/repair.jpg';
      case 'Refrigerator Services':
        return 'lib/images/refridgerator.jpg';
      case 'Washing machine':
        return 'lib/images/washing_machine.webp';
      case 'Mixer & Grinder':
        return 'lib/images/mixer.jpg';
      case 'Computer Services':
        return 'lib/images/computer.jpg';
      default:
        return 'lib/images/placeholder.jpg'; // A placeholder image
    }
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE69023), // Bottom nav bar background is orange
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(Icons.home_outlined, 'Home', 0),
          _buildBottomNavItem(Icons.shopping_cart_outlined, 'Shopping', 1),
          _buildBottomNavItem(Icons.calendar_today_outlined, 'Booking', 2),
          _buildBottomNavItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData iconData, String label, int index) {
    // Both active and inactive icons/text are white on the orange background
    Color color = Colors.white;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index; // Update the selected index
        });
        _navigateToPage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(iconData, color: color, size: 22),
          const SizedBox(height: 3),
          Text(
            label,
            style: GoogleFonts.poppins(color: color, fontSize: 11), // Already using Poppins
          ),
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        // Current screen is 'Repair Works', if 'Home' is this screen, no navigation needed.
        // If 'Home' is a separate screen, you would navigate to it.
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PurchaseScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ActivityScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
        break;
    }
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile', style: GoogleFonts.poppins())), // Changed to use GoogleFonts
      body: Center(child: Text('Profile Page Content', style: GoogleFonts.poppins())), // Changed to use GoogleFonts
    );
  }
}