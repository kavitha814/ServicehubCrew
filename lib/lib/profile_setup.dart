import 'package:flutter/material.dart';
import 'package:servicehub/contact_setup.dart'; // Make sure this path is correct
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker
import 'dart:io'; // Import for File

// Convert to StatefulWidget to manage the selected image state
class SetProfilePhotoScreen extends StatefulWidget {
  @override
  _SetProfilePhotoScreenState createState() => _SetProfilePhotoScreenState();
}

class _SetProfilePhotoScreenState extends State<SetProfilePhotoScreen> {
  XFile? _image; // Variable to store the selected image (nullable)

  // Function to pick an image from either camera or gallery
  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = pickedFile; // Update the state with the selected image
        });
      }
    } catch (e) {
      // Catch and print any errors during image picking (e.g., permissions)
      print('Error picking image: $e');
      // Show a user-friendly message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not pick image: ${e.toString()}')),
      );
    }
  }

  // Function to show the bottom sheet for selecting image source
  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF2E2E38), // Dark background for the sheet
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min, // Make the column as small as possible
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt, color: Color(0xFFF9A825)),
              title: Text(
                'Take Photo',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                _pickImage(ImageSource.camera); // Pick from camera
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Color(0xFFF9A825)),
              title: Text(
                'Choose from Gallery',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                _pickImage(ImageSource.gallery); // Pick from gallery
              },
            ),
            SizedBox(height: 10), // Add some padding at the bottom for aesthetics
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825), // Orange app bar
        title: Text(
          'ServiceHub',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
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
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Stack(
              alignment: Alignment.bottomRight, // Position the edit icon at the bottom-right of the stack
              children: <Widget>[
                CircleAvatar(
                  radius: 80, // Size of the main profile photo circle
                  backgroundColor: Colors.grey[700], // Placeholder background color
                  // Conditionally display the selected image or a default icon
                  backgroundImage: _image != null
                      ? FileImage(File(_image!.path)) // If image is selected, display it
                      : null, // Otherwise, no background image
                  child: _image == null
                      ? Icon( // If no image is selected, display the person icon
                          Icons.person,
                          size: 80,
                          color: Colors.grey[400],
                        )
                      : null, // If image is displayed, no child icon needed
                ),
                Positioned( // Position the edit button precisely
                  right: 0,
                  bottom: 0,
                  child: GestureDetector( // Make the edit icon tappable
                    onTap: () {
                      _showImageSourceActionSheet(context); // Show image source options
                    },
                    child: CircleAvatar(
                      radius: 20, // Size of the edit icon circle
                      backgroundColor: Color(0xFFF9A825), // Orange background
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Why We Need Your Picture?',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildReasonText(Icons.check, 'Builds trust between service providers and homeowners.'),
            _buildReasonText(Icons.check, 'Ensures easy recognition for smoother interactions.'),
            _buildReasonText(Icons.check, 'Adds a personal touch to enhance the service experience.'),
            Spacer(), // Pushes the following widgets to the bottom of the available space
            ElevatedButton(
              onPressed: () {
                // Navigate to the ContactInfoScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactInfoScreen()), // Ensure ContactInfoScreen is imported correctly
                );
              },
              child: Text(
                'Submit',
                style: GoogleFonts.poppins(color: Colors.white,fontSize: 17), // Apply Poppins font
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF9A825), // Orange background
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15), // Button padding
              ),
            ),
            SizedBox(height: 20), // Padding at the bottom of the screen
          ],
        ),
      ),
    );
  }

  // Helper widget to build the reason text with an icon
  Widget _buildReasonText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.green), // Checkmark icon in green
          SizedBox(width: 10), // Spacing between icon and text
          Expanded( // Allows text to wrap if it's too long
            child: Text(
              text,
              style: GoogleFonts.poppins(color: Colors.white), // Apply Poppins font
            ),
          ),
        ],
      ),
    );
  }
}
