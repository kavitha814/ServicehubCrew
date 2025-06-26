import 'package:flutter/material.dart';
import 'package:servicehub/setup2.dart';
import 'package:servicehub/setup_account.dart';

class ChooseEarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E2E38),
      appBar: AppBar(
        backgroundColor: Color(0xFFF9A825),
        title: Text('ServiceHub'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
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
              'Choose How You Want to\nEarn With ServiceHub',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildServiceCard(
                    context,
                    'Electric Works',
                    'Electrical work involves installing, repairing, and maintaining wiring and systems.',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupAccountScreen(),
                        ),
                      );
                    },
                    'lib/images/electric_works.jpg',
                  ),
                  _buildServiceCard(
                    context,
                    'Plumbing Works',
                    'Plumbing involves installing, repairing pipes, fixtures, and water systems.',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupAccountScreen2(),
                        ),
                      );
                    },
                    'lib/images/Plumbing_work.jpg',
                  ),
                  _buildServiceCard(
                    context,
                    'Technician Works',
                    'Technicians diagnose, repair, and maintain equipment, machinery, and systems.',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupAccountScreen2(),
                        ),
                      );
                    },
                    'lib/images/technician_works.png',
                  ),
                  _buildServiceCard(
                    context,
                    'Painting Works',
                    'Painting involves surface preparation, applying paint, and finishing walls or structures.',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupAccountScreen2(),
                        ),
                      );
                    },
                    'lib/images/home_painting_work.jpg',
                  ),
                  _buildServiceCard(
                    context,
                    'House Cleaning Works',
                    'House cleaning involves dusting, sweeping, mopping, and sanitizing rooms and surfaces.',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetupAccountScreen2(),
                        ),
                      );
                    },
                    'lib/images/home_cleaning_works.jpeg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
      BuildContext context,
      String title,
      String description,
      VoidCallback onTap,
      String imagePath) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Color(0xFF42424E),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}