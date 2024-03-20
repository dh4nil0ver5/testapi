import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;
  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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

  void _loginUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    final response = await registerAPi('h94.74.86.174:8080/api', {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
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
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
              InkWell(
                onTap: _loginUser,
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
              )

            ],
          ),
        ));
  }
}
