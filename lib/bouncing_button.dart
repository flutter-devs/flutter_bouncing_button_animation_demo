
import 'package:flutter/material.dart';

class BouncingButton extends StatefulWidget {
  @override
  _BouncingButtonState createState() => _BouncingButtonState();
}

class _BouncingButtonState extends State<BouncingButton> with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Bouncing Button Animation Demo"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Press the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: GestureDetector(
                onTapDown: _tapDown,
                onTapUp: _tapUp,
                child: Transform.scale(
                  scale: _scale,
                  child: _animatedButton(),
                ),
              ),
            ),
          ],

        ),
    );
  }

  Widget  _animatedButton() {
    return Container(
      height: 70,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x80000000),
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff33ccff),
              Color(0xffff99cc),
            ],
          )),
      child: Center(
        child: Text(
          'Press',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
    );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}