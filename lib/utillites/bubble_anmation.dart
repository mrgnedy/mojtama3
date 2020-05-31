//import 'dart:async';
//
//import 'package:flutter/material.dart';
//import 'package:mojtam3/model/provider/design.dart';
//import 'package:mojtam3/utillites/bubble_painter.dart';
//
//class Animator extends StatefulWidget {
//  final Widget child;
//  final Duration time;
//
//
//  Animator(this.child, this.time);
//
//  @override
//  _AnimatorState createState() => _AnimatorState();
//}
//
//class _AnimatorState extends State<Animator>
//    with SingleTickerProviderStateMixin {
//  Timer timer;
//  AnimationController _animationController;
//  Animation animation;
//
//  List<Bubble> bubbles;
//  final int numberOfBubbles = 50;
//  final Color color = Colors.grey[800];
//  final double maxBubbleSize = 12.0;
//  Design d = new Design();
//  @override
//  void initState() {
//    super.initState();
//
//    // Initialize bubbles
//    bubbles = List();
//    int i = numberOfBubbles;
//    while (i > 0) {
//      bubbles.add(Bubble(d.coloreball, maxBubbleSize));
//      i--;
//    }
//
//    // animation controller
//    _animationController = new AnimationController(
//        duration: const Duration(seconds: 1500), vsync: this);
//    _animationController.addListener(() {
//      updateBubblePosition();
//    });
//    _animationController.forward();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    timer.cancel();
//    _animationController.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return AnimatedBuilder(
//      animation: animation,
//      child: widget.child,
//      builder: (BuildContext context, Widget child) {
//        return Opacity(
//          opacity: animation.value,
//          child: Transform.translate(
//            offset: Offset(0.0, (1 - animation.value) * 20),
//            child: child,
//          ),
//        );
//      },
//    );
//  }
//  void updateBubblePosition() {
//    bubbles.forEach((it) => it.updatePosition());
//    setState(() {});
//  }
//}
//
//Timer timer;
//Duration duration = Duration();
//
//wait(int dur) {
//  if (timer == null || !timer.isActive) {
//    timer = Timer(Duration(microseconds: 120), () {
//      duration = Duration();
//    });
//  }
//  duration += Duration(milliseconds: dur);
//  return duration;
//}
//
//class WidgetANimator extends StatelessWidget {
//  final Widget child;
//
//  WidgetANimator(this.child);
//
//  @override
//  Widget build(BuildContext context) {
//    return Animator(child, wait(100));
//  }
//}
//
//class WidgetANimator2 extends StatelessWidget {
//  final Widget child;
//
//  WidgetANimator2(this.child);
//
//  @override
//  Widget build(BuildContext context) {
//    return Animator(child, wait(150));
//  }
//}
//
//class WidgetANimator3 extends StatelessWidget {
//  final Widget child;
//
//  WidgetANimator3(this.child);
//
//  @override
//  Widget build(BuildContext context) {
//    return Animator(child, wait(70));
//  }
//}
