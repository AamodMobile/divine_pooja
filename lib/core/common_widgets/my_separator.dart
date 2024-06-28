import 'package:flutter/material.dart';

class MySeparator extends StatelessWidget {
  const MySeparator({
    super.key,
    this.height = 1,
    this.color = Colors.black,
    this.orientation = Axis.horizontal,
    this.dash=1.5,
  });

  final double height;
  final double dash;
  final Color color;
  final Axis orientation;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxLength = orientation == Axis.horizontal
            ? constraints.constrainWidth()
            : constraints.constrainHeight();
        const dashLength = 5.0;
        final dashThickness = height;
        final dashCount = (boxLength / (dash * dashLength)).floor();

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: orientation,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: orientation == Axis.horizontal ? dashLength : dashThickness,
              height: orientation == Axis.horizontal ? dashThickness : dashLength,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
