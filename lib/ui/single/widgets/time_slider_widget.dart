import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/theme/theme.dart';

class TimeSliderWidget extends StatefulWidget {
  final bool animation;
  const TimeSliderWidget({Key? key, required this.animation}) : super(key: key);

  @override
  _TimeSliderWidgetState createState() => _TimeSliderWidgetState();
}

class _TimeSliderWidgetState extends State<TimeSliderWidget> {
  ValueNotifier<double> playNotifier = ValueNotifier(0);
  late Timer _timer;
  int playTime = 272; // Demo müzik süresi saniye olarak
  int stateTime = 0;
  late int min, sec;
  int lastMin = 0;
  int lastSec = 0;

  @override
  void initState() {
    min = playTime ~/ 60;
    sec = playTime % 60;

    delayed();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: playNotifier,
      builder: (context, value, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getParsedTime(lastMin) + ':' + getParsedTime(lastSec)),
                  Text(getParsedTime(min) + ':' + getParsedTime(sec)),
                ],
              ),
            ),
            Slider(
                min: 0,
                max: 272,
                value: value,
                activeColor: MusicPlayerTheme.darkColor,
                inactiveColor: MusicPlayerTheme.grayColor,
                onChanged: (double newValue) {
                  stateTime = newValue.toInt();
                  playNotifier = ValueNotifier(newValue);
                  setState(() {});
                }),
          ],
        );
      },
    );
  }

  String getParsedTime(int time) {
    String stringTime = time.toString();
    if (stringTime.length <= 1) return "0$stringTime";
    return stringTime;
  }

  delayed() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (widget.animation && stateTime < playTime) {
        stateTime++;
        lastMin = stateTime ~/ 60;
        lastSec = stateTime % 60;
        playNotifier = ValueNotifier(stateTime.toDouble());
        setState(() {});
      }
    });
  }
}
