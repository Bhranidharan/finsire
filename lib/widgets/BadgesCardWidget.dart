import 'package:flutter/material.dart';

class BadgesCard extends StatelessWidget {
  final Size screenSize;

  const BadgesCard({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Badges',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.upload_rounded),
              ],
            ),
            SizedBox(height: screenSize.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBadgeIcon(Icons.book, screenSize),
                _buildBadgeIcon(Icons.star, screenSize),
                _buildBadgeIcon(Icons.ac_unit, screenSize),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBadgeIcon(Icons.book, screenSize),
                _buildBadgeIcon(Icons.star, screenSize),
                _buildBadgeIcon(Icons.ac_unit, screenSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon, Size screenSize) {
    return Container(
      width: screenSize.width * 0.1,
      height: screenSize.width * 0.1,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(screenSize.width * 0.05),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
