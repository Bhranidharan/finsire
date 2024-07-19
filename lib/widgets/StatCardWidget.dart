import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;
  final Size screenSize;

  const StatCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(screenSize.width * 0.04),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenSize.width * 0.04),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.upload_rounded),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                children: [
                  Icon(icon),
                  SizedBox(width: screenSize.width * 0.02),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.01),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenSize.width * 0.035,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
