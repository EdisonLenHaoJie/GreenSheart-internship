import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _attemptLogin() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login Successful')),
    );
      // Navigate to HomeScreen immediately
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color.fromARGB(255, 115, 186, 245),
      ),
      
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/Design3.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email'),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return 'Please enter your email';
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) // searched online how to do this
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
                            style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 136, 194, 235)
                            ),
                            child: Text('Login'),
                            
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
