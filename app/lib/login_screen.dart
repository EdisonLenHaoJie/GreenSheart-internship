import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _attemptLogin() {
    if (_formKey.currentState!.validate()) {
      // Simulate a login delay
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration(seconds: 2), () {
        // Navigate to HomeScreen after delay
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator() // Feedback to the user
            : Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter your email';
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                            return 'Please enter a valid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter your password';
                          if (value.length < 6)
                            return 'Password must be at least 6 characters';
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _attemptLogin,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}