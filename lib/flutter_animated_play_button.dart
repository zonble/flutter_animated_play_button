library flutter_animated_play_button;

/// Wraps [AnimatedPlayButton].

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// AnimatedPlayButton is a Flutter widget presenting several animating bars,
/// which represent we are playing an item such as a track or a playlist.
///
/// To use the widget, just creates an instance of it and place it into your
/// Widget tree. You can specify its [child] or [color] as well.
class AnimatedPlayButton extends StatefulWidget {
  /// Child of the button.
  final Widget child;

  /// Handles tap events on the button.
  final VoidCallback onPressed;

  /// Colors for drawing the bars within the button.
  final Color color;

  /// If the button has stopped animating.
  final bool stopped;

  /// Creates a new instance.
  AnimatedPlayButton({
    Key key,
    this.child,
    this.onPressed,
    this.color,
    this.stopped = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimatedPlayButtonState();
}

const _kBarCount = 5;
const _kAnimationDuration = 300;

class _AnimatedPlayButtonState extends State<AnimatedPlayButton>
    with TickerProviderStateMixin {
  Timer _timer;

  List<AnimationController> _animationControllers;
  List<Animation> _animations;

  @override
  Widget build(BuildContext context) {
    if (widget.stopped) {
      if (_timer != null) {
        _timer.cancel();
        _timer = null;
      }
      _setUpAnimation(true);
    } else {
      if (_timer == null) {
        _timer = Timer.periodic(
          Duration(milliseconds: _kAnimationDuration),
          (timer) => _setUpAnimation(false),
        );
      }
    }

    if (_animations == null) {
      return Container();
    }

    var values =
        List<double>.from(_animations.map((animation) => animation.value));
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 20, minHeight: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: CustomPaint(
              painter: _BarPainter(
                values: values,
                color: widget.color,
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }

  void _setUpAnimation(bool toStop) {
    List<double> animationBeginValues = () {
      if (_animations != null) {
        return List<double>.from(_animations.map((x) => x.value));
      }
      return List<double>.generate(
          _kBarCount, (index) => Random().nextDouble());
    }();

    if (_animationControllers == null) {
      _animationControllers = List.generate(_kBarCount, (index) {
        return AnimationController(
          vsync: this,
          duration: Duration(milliseconds: _kAnimationDuration),
          value: 0.0,
        );
      });
      _animationControllers[0].addListener(() => setState(() {}));
    } else {
      _animationControllers.forEach((controller) => controller.value = 0.0);
    }

    final newAnimations = List.generate(_kBarCount, (index) {
      double begin = animationBeginValues[index];
      double end = toStop ? 0.2 : Random().nextDouble();
      return Tween(begin: begin, end: end)
          .animate(_animationControllers[index]);
    });
    _animations = newAnimations;
    _animationControllers.forEach((controller) => controller.forward());
  }

  @override
  void dispose() {
    _animationControllers?.forEach((controller) => controller.dispose());
    _animationControllers = null;
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }
}

class _BarPainter extends CustomPainter {
  final List<double> values;
  final Color color;

  _BarPainter({@required this.values, this.color = Colors.black});

  @override
  void paint(Canvas canvas, Size size) {
    if (this.values == null || this.values.length == 0) {
      return;
    }
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final double interval = size.width / (values.length + 1);
    for (int index = 0; index < this.values.length; index++) {
      final value = values[index];
      final x = interval * (index + 1);
      final yBegin = size.height;
      final yEnd = size.height - (size.height * value);
      canvas.drawLine(Offset(x, yBegin), Offset(x, yEnd), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
