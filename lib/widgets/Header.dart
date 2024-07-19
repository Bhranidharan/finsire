import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Size screenSize;

  const Header({required this.screenSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: screenSize.width * 0.13,
              height: screenSize.width * 0.13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/001/234/815/original/zombie-skull-soldier-side-profile-vector.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: screenSize.width * 0.03),
            Text(
              'War and Peace',
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(width: screenSize.width * 0.04),
        Icon(Icons.add, color: Colors.white),
      ],
    );
  }
}
