import 'package:flutter/material.dart';
import 'package:servicehub/adhar_setup.dart';
import 'package:servicehub/contact_setup.dart';
import 'package:servicehub/license.dart';
import 'package:servicehub/profile_setup.dart';

class SetupAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825), // Orange app bar
        title: Text('ServiceHub'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Welcome, Jack',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Here\'s what you need to do to set up your account.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            _buildSetupItem(
              context,
              'TNEL Board-Front',
              'Recommended next step',
              () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyLicenseScreen()),
                      );
              },
            ),
            _buildSetupItem(
              context,
              'Profile photo',
              null, // No subtitle
              () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetProfilePhotoScreen()),
                      );
              },
            ),
            _buildSetupItem(
              context,
              'Aadhaar Card',
              null, // No subtitle
              () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifyAadhaarScreen()),
                      );
              },
            ),
            _buildSetupItem(
              context,
              'Contact info',
              null, // No subtitle
              () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactInfoScreen()),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSetupItem(
      BuildContext context, String title, String? subtitle, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[800]!), // Divider line
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.blue, // Recommended next step color
                      fontSize: 16,
                    ),
                  ),
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.white), // Right arrow
          ],
        ),
      ),
    );
  }
}