import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registering...')),
      );
    }
  }

  InputDecoration _buildInputDecoration(String labelText) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(
              64, 0, 24, 21), // Use Colors.teal instead of Colors.black
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.teal, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          CustomPaint(
            size: Size(double.infinity, 150),
            painter: CurvePainter(),
            child: Container(
              height: 150,
              width: double.infinity,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Create new\nAccount',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 255, 255),
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'home',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 80),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Already Registered:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 154, 255),
                              fontSize: 21),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Name:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 154, 255),
                              fontSize: 21),
                        ),
                      ), // Adjust height to make room for the curve
                      TextFormField(
                        controller: _nameController,
                        decoration: _buildInputDecoration('Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 154, 255),
                              fontSize: 21),
                        ),
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: _buildInputDecoration('Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Password:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 154, 255),
                              fontSize: 21),
                        ),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: _buildInputDecoration('Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 6),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Confirm Password:",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 30, 154, 255),
                              fontSize: 21),
                        ),
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        decoration: _buildInputDecoration('Confirm Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Handle Google sign-up
                        },
                        icon: Image.asset(
                          'images/google.png',
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        label: Text('Continue with Google'),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
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
          size.width / 2, size.height + 50, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);

    final borderPath = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height + 50, size.width, size.height);

    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
