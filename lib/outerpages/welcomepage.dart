import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          CustomPaint(
            size: Size(double.infinity, 150),
            painter: CurvePainter(),
            child: Container(
              height: 150,
              width: double.infinity,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Text(
                    'DIGITAL\nLIBRARY',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'home',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'images/bottom_image.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Stack(
              children: [
                // Background image for the triangles

                // Triangles
                Transform.rotate(
                  angle: -(3 * 3.14) / 6,
                  child: FractionallySizedBox(
                    child: AspectRatio(
                      aspectRatio: 424.9 / 380.6,
                      child: CustomPaint(
                        painter: TrianglePainter(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Sign up action
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Schyler",
                        )),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Color.fromARGB(255, 0, 136, 255), // Button color
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            color: Color.fromARGB(255, 13, 0, 255), width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Log in action
                    },
                    child: Text('Log In',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Schyler",
                        )),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Color.fromARGB(255, 0, 42, 78), // Button color
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: BorderSide(
                            color: Color.fromARGB(255, 221, 158, 0), width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(255, 0, 28, 79)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Color.fromARGB(255, 0, 255, 255)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height + 100, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);

    final borderPath = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height + 100, size.width, size.height);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class TrianglePainter extends CustomPainter {
  final List<Color> colors = [
    Color.fromARGB(255, 0, 136, 255),
    Color.fromARGB(255, 0, 42, 78),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 5, 138, 255),
    Color.fromARGB(255, 0, 42, 78),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 5, 138, 255),
    Color.fromARGB(255, 0, 42, 78),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 5, 138, 255),
    Color.fromARGB(255, 0, 42, 78),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 5, 138, 255),
    Color.fromARGB(255, 0, 42, 78),
    Color.fromARGB(255, 255, 255, 255),
    Color.fromARGB(255, 5, 138, 255)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    double padding = 0.0;

    // Rotate the canvas by -180 degrees
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(3.14); // -180 degrees in radians
    canvas.translate(-size.width / 2, -size.height / 2);

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(size.width / 2, padding)
        ..lineTo(size.width - padding, size.height - padding)
        ..lineTo(padding, size.height - padding)
        ..close();

      canvas.drawPath(path, paint);

      padding += 10.0; // Smaller increment to increase the size of triangles
    }

    // Restore the canvas to its original state
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
