import 'package:flutter/material.dart';
import 'Login.dart';
import 'Register.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key, required this.title});
  final String title;
  @override
  State<MyHomepage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomepage> {
  void _navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login(title: '',)),
    );
  }

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register(title: '',)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text('Selamat datang', style: TextStyle(fontSize: 24),),
              ), 
              SizedBox(height: 10),
              InkWell(
                onTap: _navigateToLogin,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18.0, // Text size
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: _navigateToRegister,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Text(
                    'register',
                    style: TextStyle(
                      fontSize: 18.0, // Text size
                      color: Colors.white, // Text color
                      fontWeight: FontWeight.bold, // Text weight
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
