import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _MyPainterState();
}

class _MyPainterState extends State<Background> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Curved(),
      child: Container(
        height: 1000.0,
      ),
    );
  }
}

class Curved extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
    //     size.width * 0.17, size.height * 0.90);
    // path.quadraticBezierTo(
    //     size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    // path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
    //     size.width * 0.50, size.height * 0.70);
    // path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
    //     size.width * 0.65, size.height * 0.65);
    // path.quadraticBezierTo(
    //     size.width * 0.70, size.height * 0.90, size.width, 0);
    // path.close();

    // paint.color = const Color.fromARGB(255, 201, 84, 221);
    // canvas.drawPath(path, paint);

    // path = Path();
    // path.lineTo(0, size.height * 0.50);
    // path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
    //     size.width * 0.15, size.height * 0.60);
    // path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
    //     size.width * 0.27, size.height * 0.60);
    // path.quadraticBezierTo(
    //     size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    // path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
    //     size.width * 0.75, size.height * 0.75);
    // path.quadraticBezierTo(
    //     size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    // path.lineTo(size.width, 0);
    // path.close();

    // paint.color = const Color.fromARGB(255, 144, 31, 163);
    // canvas.drawPath(path, paint);

    // path = Path();
    // path.lineTo(0, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
    //     size.width * 0.22, size.height * 0.70);
    // path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
    //     size.width * 0.40, size.height * 0.75);
    // path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
    //     size.width * 0.65, size.height * 0.70);
    // path.quadraticBezierTo(
    //     size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    // path.lineTo(size.width, 0);
    // path.close();

    // paint.color = const Color.fromARGB(255, 144, 31, 163);
    // canvas.drawPath(path, paint);
    path = Path();
    path.lineTo(0, size.height / 4.25);
    var firstControlPoint = Offset(size.width / 4, size.height / 3);
    var firstEndPoint = Offset(size.width / 2, size.height / 3 - 60);
    var secondControlPoint =
        Offset(size.width - (size.width / 4), size.height / 4 - 65);
    var secondEndPoint = Offset(size.width, size.height / 3 - 40);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    paint.color = const Color.fromARGB(255, 144, 31, 163);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CirclePainter extends CustomPainter {
  final double radius;
  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: radius,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
