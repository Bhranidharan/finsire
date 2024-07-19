import 'package:finsire/widgets/BadgesCardWidget.dart';
import 'package:finsire/widgets/Header.dart';
import 'package:finsire/widgets/StatCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:finsire/ApiServices.dart';

class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      int progress = await ApiServices.fetchRandomNumber();
      setState(() {
        _progress = progress;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var padding = EdgeInsets.all(screenSize.width * 0.04);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Amy's reader stats",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(screenSize: screenSize),
              SizedBox(height: screenSize.height * 0.02),
              StatCard(
                title: 'PROGRESS',
                value: '$_progress',
                subtitle: 'Out of 1,225 pages\n#5 among friends',
                color: Colors.yellow,
                icon: Icons.book,
                screenSize: screenSize,
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'TIME',
                      value: '6:24',
                      subtitle:
                          'Global avg. read time for your progress 7:28\n23% faster',
                      color: Colors.orange,
                      icon: Icons.timer,
                      screenSize: screenSize,
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.04),
                  Expanded(
                    child: StatCard(
                      title: 'STREAK',
                      value: '7',
                      subtitle:
                          'Day streak, come back tomorrow to keep it up!\n19% more consistent',
                      color: Colors.green,
                      icon: Icons.thunderstorm_sharp,
                      screenSize: screenSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: StatCard(
                      title: 'LEVEL',
                      value: '2',
                      subtitle:
                          '145 reader points to level up!\nTop 5% for this book',
                      color: Colors.purple,
                      icon: Icons.cloud,
                      screenSize: screenSize,
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.04),
                  Expanded(child: BadgesCard(screenSize: screenSize)),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              _buildButton(screenSize),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                "Leaderboard",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(Size screenSize) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenSize.width * 0.04),
              ),
            ),
            onPressed: () {},
            child: Text(
              '+ Add friends',
              style: TextStyle(fontSize: screenSize.width * 0.045),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.upload,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
