import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:senior_fitness_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Myfit extends StatefulWidget {
  const Myfit({Key? key}) : super(key: key);

  @override
  State<Myfit> createState() => _Myfit();
}


class _Myfit extends State<Myfit> {
  String? name;
  String? birth;
  String? gender;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name');
      birth = prefs.getString('birth');
      gender = prefs.getString('gender');
    });
  }

  static String youtubeId = 'AdYRASHRKwE';

  final YoutubePlayerController _con = YoutubePlayerController(
    initialVideoId: youtubeId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 80.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10.0), // 여백 추가
          child: Image.asset('images/rumi.png'),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0), // 텍스트 위쪽 여백 추가
          child: Text(
            '루미',
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              height: 1.2, // 텍스트의 높이 조절
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                '$name 님의 점수는?',
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              '90점',
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 50,
                  color: Color(0xFFCEE9E3), // 'CEE9E3' 색상
                  child: Center(
                    child: Text('나이', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  width: 70,
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: Text('70', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  color: Color(0xFFCEE9E3), // 'CEE9E3' 색상
                  child: Center(
                    child: Text('신체나이', style: TextStyle(fontSize: 20)),
                  ),
                ),
                Container(
                  width: 70,
                  height: 50,
                  color: Colors.white,
                  child: Center(
                    child: Text('80', style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),

            SizedBox(
              height: 30.0,
            ),

            ElevatedButton(
              onPressed: () {
                // 여기에 측정하기 버튼이 눌렸을 때의 동작 추가
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFCEE9E3), // 색상 코드 CEE9E3
                minimumSize: const Size(210.0, 70.0),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                '측정하기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 300.0, // 조절하고자 하는 너비
              height: 200.0, // 조절하고자 하는 높이
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  minX: 0,
                  maxX: 7,
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 30),
                        FlSpot(1, 40),
                        FlSpot(2, 20),
                        FlSpot(3, 60),
                        FlSpot(4, 50),
                        FlSpot(5, 70),
                        FlSpot(6, 70),
                        FlSpot(7, 90),
                      ],
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 300.0, // 조절하고자 하는 너비
              height: 200.0, // 조절하고자 하는 높이
              child: YoutubePlayer(
                controller: _con,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  // 여기에 메인으로 이동 버튼이 눌렸을 때의 동작 추가
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFFCEE9E3),
                  minimumSize: const Size(210.0, 70.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  '처음으로 이동',
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
