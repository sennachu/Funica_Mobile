import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funica_mobile/core/utils.dart';
import 'package:funica_mobile/screens/user_login_screen/register.dart';
import 'package:funica_mobile/screens/static/home.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        routes: {
          '/home': (context) => HomeScreen(),
        });
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscured = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Contact Us!"),
          content: Text("You can contact us to reset your password."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Pop-up'ı kapat
              },
              child: Text("Okay"),
            ),
          ],
        );
      },
    );
  }

  void _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('username') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _login() async {
    // Add your authentication logic here
    String email = _emailController.text;
    String password = _passwordController.text;

    // Save credentials if 'Remember me' is checked
    if (_rememberMe) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', email);
      await prefs.setString('password', password);
      await prefs.setBool('rememberMe', _rememberMe);
    }

    // Navigate to home screen or perform other actions after login
    GoRouter.of(context).go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go("/letin");
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Login to your account',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _emailController,
                style: GoogleFonts.poppins(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  border: InputBorder.none,
                  // Remove the bottom border
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _passwordController,
                style: GoogleFonts.poppins(),
                obscureText: _isObscured,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: InputBorder.none, // Remove the bottom border
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _toggleVisibility,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                  activeColor: Colors.black,
                ),
                Text('Remember me', style: GoogleFonts.poppins()),
              ],
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () async {
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  final url = Uri.parse('https://reqres.in/api/login');
                  final headers = {'Content-Type': 'application/json'};
                  final body = jsonEncode({
                    'email': _emailController.text,
                    'password': _passwordController.text
                  });

                  final response =
                      await http.post(url, headers: headers, body: body);

                  if (response.statusCode == 200) {
                    print('Data Sending Success.');
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (Route<dynamic> route) => false);
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString("usernameLogin", _emailController.text);
                    prefs.setString("passwordLogin", _passwordController.text);
                  } else {
                    print('Hata: ${response.body}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('No such user exists!'),
                      ),
                    );
                  }
                  // Save credentials if 'Remember me' is checked
                  if (_rememberMe) {
                    SecureStorage()
                        .writeSecureData("username", _emailController.text);
                    SecureStorage()
                        .writeSecureData("password", _passwordController.text);
                  }
                }
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        color: Colors.white,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                _showPopup(context); // Pop-up gösterme fonksiyonunu çağır
              },
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Forget the password?',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Row'u ortala
              children: [
                Expanded(
                  child: Divider(color: Colors.grey[200]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('or continue with', style: GoogleFonts.poppins()),
                ),
                Expanded(child: Divider(color: Colors.grey[200])),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Add your sign in with password logic here
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    // Add your sign in with password logic here
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.g_translate,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    // Add your sign in with password logic here
                  },
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(Icons.apple),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: GoogleFonts.comfortaa(color: Colors.grey[400]),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    'Sign up',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
