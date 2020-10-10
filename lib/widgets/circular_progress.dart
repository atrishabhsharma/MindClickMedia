import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProgress extends StatefulWidget {
  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  int count = 0;
  double _progress;
  void calculateProgress(int count) {
    _progress = (count / 21);
    // if (_progress >= 0 && _progress <= 1) {
    //   print(_progress);
    // } else {
    //   print('error');
    // }
  }

  @override
  void initState() {
    super.initState();
    calculateProgress(count);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: GestureDetector(
        onDoubleTap: () {
          setState(() {
            count++;
            if (count <= 21) {
              calculateProgress(count);
            }
          });
        },
        child: Card(
          margin: EdgeInsets.all(50),
          elevation: 7,
          color: Colors.white,
          child: CircularPercentIndicator(
            radius: 200,
            center: Text(
              "${(100 * _progress).truncateToDouble().toStringAsFixed(0)}" +
                  "%",
              style: TextStyle(fontSize: 30),
            ),
            progressColor: Colors.green,
            percent: _progress,
            lineWidth: 12,
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
          ),
        ),
      ),
    );
  }
}
