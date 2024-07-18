import 'package:finsire/ApiServices.dart';
import 'package:flutter/material.dart';

class page1 extends StatefulWidget {
  @override
  State<page1> createState() => _page1State();
}

class _page1State extends State<page1> {
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

  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 16),
              _yellowCard(
                  'PROGRESS',
                  '$_progress',
                  'Out of 1,225 pages\n#5 among friends',
                  Colors.yellow,
                  Icons.book),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: _buildStatCard(
                          'TIME',
                          '6:24',
                          'Global avg. read time for your progress 7:28\n23% faster',
                          Colors.orange,
                          Icons.timer)),
                  SizedBox(width: 16),
                  Expanded(
                      child: _buildStatCard(
                          'STREAK',
                          '7',
                          'Day streak, come back tomorrow to keep it up!\n19% more consistent',
                          Colors.green,
                          Icons.thunderstorm_sharp)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: _buildStatCard(
                          'LEVEL',
                          '2',
                          '145 reader points to level up!\nTop 5% for this book',
                          Colors.purple,
                          Icons.cloud)),
                  SizedBox(width: 16),
                  Expanded(child: _buildBadgesCard()),
                ],
              ),
              SizedBox(height: 16),
              _buildButton(),
              SizedBox(
                height: 16,
              ),
              Text(
                "Leaderboard",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/previews/001/234/815/original/zombie-skull-soldier-side-profile-vector.jpg'), // Make sure you have the image in your assets
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'War and Peace',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(width: 16),

        //  crossAxisAlignment: CrossAxisAlignment.,

        Icon(Icons.add, color: Colors.white),
      ],
    );
  }

  Widget _buildStatCard(
      String title, String value, String subtitle, Color color, IconData icon) {
    return Container(
      //  width: 1000,
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.upload_rounded),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(icon),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    value,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                subtitle,
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _yellowCard(
      String title, String value, String subtitle, Color color, IconData icon) {
    return Container(
      width: 1000,
      // height: 180,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.upload)
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(icon),
                SizedBox(
                  width: 10,
                ),
                Text(
                  value,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesCard() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.upload_rounded)
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBadgeIcon(Icons.book),
                _buildBadgeIcon(Icons.star),
                _buildBadgeIcon(Icons.ac_unit),
                // _buildBadgeIcon(Icons.access_time),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBadgeIcon(Icons.book),
                _buildBadgeIcon(Icons.star),
                _buildBadgeIcon(Icons.ac_unit),
                // _buildBadgeIcon(Icons.access_time),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgeIcon(IconData icon) {
    return Container(
      // width: 20,
      // height: 20,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget _buildButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () {},
            child: Text('+ Add friends'),
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
