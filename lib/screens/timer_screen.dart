import 'package:flutter/material.dart';
import 'dart:async';

class timer_screen extends StatefulWidget {
  const timer_screen({Key? key}) : super(key: key);

  @override
  _timer_screenState createState() => _timer_screenState();
}

int timeLeft = 10;


class _timer_screenState extends State<timer_screen> {

    void startCountdown () {
      Timer.periodic(Duration(seconds: 1), (timer) {
       if (timeLeft > 0) {
         setState(() {
           timeLeft--;
         });
       } else {
         timer.cancel();
       }
      });
    }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
            timeLeft.toString(),
              style: TextStyle(fontSize: 80),
        ),
            MaterialButton(
                onPressed: startCountdown,
                child: Text(
                    'START',
                  style: TextStyle(color: Colors.white)
                ),
              color: Colors.black,
                ),
          ],
        ),
      ),
    );
  }
}
