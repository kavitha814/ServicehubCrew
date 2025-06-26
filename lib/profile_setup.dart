import 'package:flutter/material.dart';
import 'package:servicehub/contact_setup.dart';

class SetProfilePhotoScreen extends StatelessWidget {
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
          crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Set Your Profile Photo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Stack(
              alignment: Alignment.bottomRight, // Position the edit icon
              children: <Widget>[
                CircleAvatar(
                  radius: 80, // Adjust size as needed
                  backgroundColor: Colors.grey[700], // Placeholder color
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                ),
                CircleAvatar(
                  radius: 20, // Size of the edit icon
                  backgroundColor: Color(0xFFF9A825),
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Why We Need Your Picture?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildReasonText(Icons.check, 'Builds trust between service providers and homeowners.'),
            _buildReasonText(Icons.check, 'Ensures easy recognition for smoother interactions.'),
            _buildReasonText(Icons.check, 'Adds a personal touch to enhance the service experience.'),
            Spacer(), // Push the button to the bottom
            ElevatedButton(
              onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ContactInfoScreen()),
                      );
                    },
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF9A825),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.green),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}