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
    final size = MediaQuery.of(context).size;
    return Center(
        child: Container(
            color: Colors.white,
            child: CustomPaint(
              size: Size(size.width, size.height),
              painter: Curved(),
            )));
  }
}

class Curved extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    Paint paint = Paint();
    paint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [.01, .25],
      colors: [
        Color.fromARGB(255, 183, 27, 204),
        Color.fromARGB(255, 127, 20, 141),
      ],
    ).createShader(rect);

    Paint paint2 = Paint();
    paint2.shader = const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [.05, 1],
      colors: [
        Color.fromARGB(255, 183, 27, 204),
        Color.fromARGB(255, 127, 20, 141),
      ],
    ).createShader(rect);

    var path = Path();
    var path2 = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.07,
      size.width * 0.6,
      size.height * 0.07,
    );
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.08,
      size.width * 0.1,
      size.height * 0.18,
    );
    path.quadraticBezierTo(
      size.width * 0.06,
      size.height * 0.21,
      size.width * 0,
      size.height * 0.26,
    );
    path.close();
    path2.moveTo(size.width, size.height);
    path2.lineTo(size.width, size.height * 0.7);
    path2.quadraticBezierTo(
      size.width,
      size.height * 0.65,
      size.width,
      size.height * 0.7,
    );

    path2.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.95,
      size.width * 0.2,
      size.height * 0.97,
    );

    path2.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.98,
      size.width * 0.1,
      size.height,
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(path2, paint2);
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
