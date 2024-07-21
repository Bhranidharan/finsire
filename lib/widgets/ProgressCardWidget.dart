import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color color;
  final IconData icon;
  final Size screenSize;

  const ProgressCard({
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
                  SizedBox(width: screenSize.width * 0.07),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize.width * 0.035,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              LinearProgressBar(
                maxSteps: 6,
                progressType:
                    LinearProgressBar.progressTypeLinear, // Use Linear progress
                currentStep: 3,
                progressColor: Colors.black,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(10), //  NEW
              ),
              SizedBox(height: screenSize.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: screenSize.width * 0.08,
                    height: screenSize.width * 0.08,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/001/234/815/original/zombie-skull-soldier-side-profile-vector.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
