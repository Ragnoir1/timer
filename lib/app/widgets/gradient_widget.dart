// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimateGradient extends StatefulWidget {
  AnimateGradient({
    Key? key,
    this.controller,
    this.duration = const Duration(seconds: 4),
    required this.primaryColors,
    required this.secondaryColors,
    this.shape = BoxShape.rectangle,
    this.primaryBegin,
    this.primaryEnd,
    this.secondaryBegin,
    this.secondaryEnd,
    this.animateAlignments = true,
    this.reverse = true,
    this.child,
  })  : assert(primaryColors.length >= 2),
        assert(primaryColors.length == secondaryColors.length),
        super(key: key);

  final AnimationController? controller;

  final Duration duration;

  final List<Color> primaryColors;

  final List<Color> secondaryColors;

  final Alignment? primaryBegin;

  final Alignment? primaryEnd;

  final Alignment? secondaryBegin;

  final Alignment? secondaryEnd;

  final bool animateAlignments;

  final bool reverse;

  final Widget? child;

  final BoxShape shape;

  @override
  State<AnimateGradient> createState() => _AnimateGradientState();
}

class _AnimateGradientState extends State<AnimateGradient>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  late List<ColorTween> _colorTween;

  late AlignmentTween begin;
  late AlignmentTween end;
  List<Color> primaryColors = [];
  List<Color> secondaryColors = [];

  @override
  void initState() {
    primaryColors = widget.primaryColors;
    secondaryColors = widget.secondaryColors;

    _colorTween = getColorTweens();
    begin = AlignmentTween(
      begin: widget.primaryBegin ?? Alignment.topLeft,
      end: widget.primaryEnd ?? Alignment.topRight,
    );
    end = AlignmentTween(
      begin: widget.secondaryBegin ?? Alignment.bottomLeft,
      end: widget.secondaryEnd ?? Alignment.bottomRight,
    );

    _controller = widget.controller ??
        (AnimationController(
          vsync: this,
          duration: widget.duration,
        )..repeat(reverse: widget.reverse));
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            shape: widget.shape,
            gradient: LinearGradient(
              begin: widget.animateAlignments
                  ? begin.evaluate(_animation)
                  : (widget.primaryBegin as Alignment),
              end: widget.animateAlignments
                  ? end.evaluate(_animation)
                  : widget.primaryEnd as Alignment,
              colors: evaluateColors(_animation),
            ),
          ),
          child: widget.child,
        );
      },
    );
  }

  List<ColorTween> getColorTweens() {
    if (widget.primaryColors.length != widget.secondaryColors.length) {
      throw Exception('primaryColors.length != secondaryColors.length');
    }

    final List<ColorTween> _colorTweens = [];

    for (int i = 0; i < primaryColors.length; i++) {
      _colorTweens.add(
        ColorTween(
          begin: primaryColors[i],
          end: secondaryColors[i],
        ),
      );
    }

    return _colorTweens;
  }

  List<Color> evaluateColors(Animation<double> animation) {
    final List<Color> _colors = [];
    for (int i = 0; i < _colorTween.length; i++) {
      _colors.add(_colorTween[i].evaluate(animation)!);
    }
    return _colors;
  }
}
