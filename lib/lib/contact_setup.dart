import 'package:flutter/material.dart';
import 'package:servicehub/repair.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

class ContactInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825),
        centerTitle: false, // Orange app bar
        title: Text(
          'ServiceHub',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold), // Poppins font
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          // Make the screen scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                ' Contact Information',
                style: GoogleFonts.poppins(
                  // Poppins font
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              _buildTextField('Enter Your Name', false), // No asterisk, pass false
              SizedBox(height: 28),
              _buildTextField('Enter your mobile number', false), // No asterisk, pass false
              SizedBox(height: 28),
              _buildTextField('House no., Building name/door no', false), // No asterisk, pass false
              SizedBox(height: 28),
              _buildTextField('Road name, Area/street/colony', false), // No asterisk, pass false
              SizedBox(height: 28),
              Row(
                children: <Widget>[
                  Expanded(
                   
                    child: _buildTextField('Pincode', true), // Asterisk, pass true
                  ),
                  SizedBox(width: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle Live Location tap
                    },
                    icon: Icon(Icons.location_on),
                    label: Text(
                      'Live Location',
                      style: GoogleFonts.poppins(color: Colors.white), // Poppins font, added white color for consistency
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    // Corrected: Added 'child:'
                    child: _buildTextField('State', true), // Asterisk, pass true
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    // Corrected: Added 'child:'
                    child: _buildTextField('City', true), // Asterisk, pass true
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RepairWorksScreen()),
                    );
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                        color: Colors.white,fontSize: 17), // Poppins font
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF9A825),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Modified _buildTextField to include a boolean for asterisk presence
  Widget _buildTextField(String labelTextPrefix, bool hasAsterisk) {
    return TextField(
      decoration: InputDecoration(
        labelText: hasAsterisk
            ? null // If it has an asterisk, use label instead of labelText
            : labelTextPrefix, // Otherwise, use the simple labelText
        labelStyle: hasAsterisk
            ? null // If using RichText, labelStyle is not directly applied here
            : GoogleFonts.poppins(color: Colors.grey[400]),
        // Use a RichText for label if asterisk is needed
        label: hasAsterisk
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$labelTextPrefix ', // Add space before asterisk
                      style: GoogleFonts.poppins(color: Colors.grey[400]),
                    ),
                    TextSpan(
                      text: '*',
                      style: GoogleFonts.poppins(color: Colors.red),
                    ),
                  ],
                ),
              )
            : null, // No RichText if no asterisk
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white), // White outline
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white), // White outline
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.white), // White outline
        ),
      ),
      style: GoogleFonts.poppins(color: Colors.white), // Poppins font for input text
    );
  }
}
