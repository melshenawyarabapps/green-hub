import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({
    super.key,
    required this.min,
    required this.max,
    required this.startValue,
    required this.endValue,
    required this.startThumb,
    required this.endThumb,
    required this.onChanged,
  });

  final double min;
  final double max;
  final double startValue;
  final double endValue;
  final Widget startThumb;
  final Widget endThumb;
  final Function(double start, double end) onChanged;

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  late double _start;
  late double _end;

  @override
  void initState() {
    super.initState();
    _start = widget.startValue;
    _end = widget.endValue;
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: context.locale.languageCode == 'ar' ? 2 : 4,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final startX = (_start - widget.min) / (widget.max - widget.min) * width;
          final endX = (_end - widget.min) / (widget.max - widget.min) * width;

          return SizedBox(
            // height: 60,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                // Track
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                // Active Track
                PositionedDirectional(
                  end: startX,
                  width: endX - startX,
                  child: Container(
                    height: 4,
                    color: Theme.of(context).primaryColor,
                  ),
                ),

                // Start Thumb with larger hit area
                PositionedDirectional(
                  end: startX - 24,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanUpdate: (details) {
                      setState(() {
                        _start += details.delta.dx / width * (widget.max - widget.min);
                        _start = _start.clamp(
                          widget.min,
                          _end,
                        );
                        widget.onChanged(_start, _end);
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: widget.startThumb,
                    ),
                  ),
                ),

                // End Thumb with larger hit area
                PositionedDirectional(
                  end: endX - 24,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanUpdate: (details) {
                      setState(() {
                        _end += details.delta.dx / width * (widget.max - widget.min);
                        _end = _end.clamp(
                          _start,
                          widget.max,
                        );
                        widget.onChanged(_start, _end);
                      });
                    },
                    child: Container(
                      width: 48,
                      height: 48,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: widget.endThumb,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
