import 'package:finsire/ApiServices.dart';
import 'package:flutter/material.dart';

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
              _buildHeader(screenSize),
              SizedBox(height: screenSize.height * 0.02),
              _buildStatCard(
                'PROGRESS',
                '$_progress',
                'Out of 1,225 pages\n#5 among friends',
                Colors.yellow,
                Icons.book,
                screenSize,
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'TIME',
                      '6:24',
                      'Global avg. read time for your progress 7:28\n23% faster',
                      Colors.orange,
                      Icons.timer,
                      screenSize,
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.04),
                  Expanded(
                    child: _buildStatCard(
                      'STREAK',
                      '7',
                      'Day streak, come back tomorrow to keep it up!\n19% more consistent',
                      Colors.green,
                      Icons.thunderstorm_sharp,
                      screenSize,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'LEVEL',
                      '2',
                      '145 reader points to level up!\nTop 5% for this book',
                      Colors.purple,
                      Icons.cloud,
                      screenSize,
                    ),
                  ),
                  SizedBox(width: screenSize.width * 0.04),
                  Expanded(child: _buildBadgesCard(screenSize)),
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

  Widget _buildHeader(Size screenSize) {
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

  Widget _buildStatCard(
    String title,
    String value,
    String subtitle,
    Color color,
    IconData icon,
    Size screenSize,
  ) {
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

  Widget _buildBadgesCard(Size screenSize) {
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
            //SizedBox(height: screenSize.height * 0.01),
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
