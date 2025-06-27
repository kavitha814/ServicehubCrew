import 'package:flutter/material.dart';
import 'package:servicehub/profile_setup.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class VerifyAadhaarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38), // Dark background
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825), // Orange app bar
        title: Text(
          'ServiceHub',
          style: GoogleFonts.poppins( // Apply Poppins font
            color: Colors.white, // Adjust color if needed
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
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
              'Verify your Aadhaar and\nDate of Birth',
              style: GoogleFonts.poppins( // Apply Poppins font
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'lib/images/adhar.png', // Replace with your image asset
                  width: double.infinity,
                  height: 150, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Aadhaar Number',
              style: GoogleFonts.poppins( // Apply Poppins font
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'ex: xxxx XXXX XXXX',
                hintStyle: GoogleFonts.poppins(color: Colors.grey[600]), // Apply Poppins font to hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white), // Apply Poppins font to input text
            ),
            SizedBox(height: 20),
            Text(
              'Date of birth',
              style: GoogleFonts.poppins( // Apply Poppins font
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'ex: 14/11/2005',
                hintStyle: GoogleFonts.poppins(color: Colors.grey[600]), // Apply Poppins font to hint
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(color: Colors.white), // White outline
                ),
              ),
              style: GoogleFonts.poppins(color: Colors.white), // Apply Poppins font to input text
            ),
            SizedBox(height: 20),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle Upload Aadhaar Instead tap
                },
                child: Text(
                  'Upload your Aadhaar Instead',
                  style: GoogleFonts.poppins(color: Colors.blue), // Apply Poppins font
                ),
              ),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SetProfilePhotoScreen(),
                    ),
                  );
                },
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(color: Colors.white,fontSize: 17), // Apply Poppins font
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF9A825),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
