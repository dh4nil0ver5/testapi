import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Register extends StatefulWidget {
  const Register({super.key, required this.title});
  final String title;
  @override
  State<Register> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool _isProcessing = false;

  Future<http.Response> registerAPi(
      String url, Map<String, dynamic> body) async {
    return await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
  }

  void _registerUser() async {
    setState(() {
      _isProcessing = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;
    String username = _usernameController.text;
    final response = await registerAPi('http://94.74.86.174:8080/api', {
      'email': email,
      'password': password,
      'username': username,
    });

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
      setState(() {
        _isProcessing = false;
      });
    } else {
      throw Exception('Failed to create post.');
    }
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
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border color
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  border: InputBorder.none, // Remove underline border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0), // Padding inside the field
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border color
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                  border: InputBorder.none, // Remove underline border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0), // Padding inside the field
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Border color
                borderRadius: BorderRadius.circular(10.0), // Border radius
              ),
              child: TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                  border: InputBorder.none, // Remove underline border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0), // Padding inside the field
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              child: _isProcessing
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text('register'),
              onTap: _registerUser,
            ),
          ],
        ),
      ),
    );
  }
}
