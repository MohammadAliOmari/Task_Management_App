import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  final BuildContext context;

  RPSCustomPainter(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.01658117, size.height * 0.6478010);
    path_0.cubicTo(
        size.width * -0.03744833,
        size.height * 0.4494157,
        size.width * 0.1271817,
        size.height * 0.2529408,
        size.width * 0.4180817,
        size.height * 0.1686387);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * 0.1125000, size.height);
    path_0.lineTo(size.width * 0.01658117, size.height * 0.6478010);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Theme.of(context).iconTheme.color!;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
