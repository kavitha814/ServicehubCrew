import 'package:flutter/material.dart';
import 'package:servicehub/choosing_screen.dart'; // Make sure this path is correct
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage; // To store the selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38), // Dark background
      appBar: AppBar( 
        backgroundColor: Color(0xFFF9A825),
        centerTitle: false, // Orange app bar
        title: Text(
          'ServiceHub',
          style: GoogleFonts.poppins( // Use GoogleFonts.poppins()
            color: Colors.white, // Adjust color if needed
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Stack( // Use Stack to position the button
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  'Select Your Language',
                  style: GoogleFonts.poppins( // Use GoogleFonts.poppins()
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'You can change your language on this screen or anytime in Help',
                  style: GoogleFonts.poppins( // Use GoogleFonts.poppins()
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Language',
                  style: GoogleFonts.poppins( // Use GoogleFonts.poppins()
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    value: selectedLanguage,
                    hint: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Select',
                        style: GoogleFonts.poppins(color: Colors.white), // Use GoogleFonts.poppins()
                      ),
                    ),
                    items: <String>['Tamil', 'English']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            value,
                            style: GoogleFonts.poppins(color: Colors.white), // Use GoogleFonts.poppins()
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue;
                      });
                    },
                    dropdownColor: Color(0xFF2E2E38),
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Next Button
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChooseEarnScreen()),
                );
              },
              child: Text(
                'Next',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 17, // Increased font size for 'Next'
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF9A825),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Adjusted padding
              ),
            ),
          ),
        ],
      ),
    );
  }
}
