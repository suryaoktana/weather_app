import 'package:flutter/material.dart';
import '../weather_detail.dart';

class WeatherForecastOverlay extends StatefulWidget {
  const WeatherForecastOverlay({
    super.key,
  });

  @override
  State<WeatherForecastOverlay> createState() => _WeatherForecastOverlayState();
}

class _WeatherForecastOverlayState extends State<WeatherForecastOverlay>
    with TickerProviderStateMixin {
  double _drawerBottom = 0;
  Animation<double>? _animation;
  AnimationController? _controller;
  final Duration openAndCloseAnimationDuration =
      const Duration(milliseconds: 250);
  final Duration dragAnimationDuration = const Duration(milliseconds: 100);
  final double maxHeight = 316;

  @override
  void dispose() {
    if (_animation != null) {
      _animation!.removeListener(() {});
    }
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        width: MediaQuery.of(context).size.width,
        height: maxHeight,
        bottom: _drawerBottom,
        child: GestureDetector(
          onPanEnd: _onPanEnd,
          onPanUpdate: _onPanUpdate,
          child: const WeatherHourlyForecasts(),
        ));
  }

  void _onDragExceedHalfOfScreen() {
    ///animation will pull down to bottom (close)
    _controller =
        AnimationController(duration: dragAnimationDuration, vsync: this);
    _animation = Tween<double>(begin: 1, end: 0).animate(_controller!)
      ..addListener(() {
        setState(() {
          _drawerBottom = -250;
        });

        ///do something on close animation ends
        if (_animation!.value == 0) {
          _onClosed();
        }
      });
    _controller!.forward();
  }

  void _onDragBelowHalfOfScreen() {
    ///animation will pull up to top
    final double startingPoint = _drawerBottom;
    _controller =
        AnimationController(duration: dragAnimationDuration, vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller!)
      ..addListener(() {
        setState(() {
          _drawerBottom = startingPoint - startingPoint * _animation!.value;
        });
      });
    _controller!.forward();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    ///update position on drag
    setState(() {
      _drawerBottom -= details.delta.dy;
    });
  }

  void _onPanEnd(DragEndDetails dragEndDetails) {
    ///do animation on drag release based on current position
    if (_drawerBottom <= -maxHeight / 2) {
      _onDragExceedHalfOfScreen();
    } else {
      _onDragBelowHalfOfScreen();
    }
  }

  void _onClosed() {
    ///do something on animation closed
  }
}
