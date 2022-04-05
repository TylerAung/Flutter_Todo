import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Registration'),
        centerTitle: true,
        toolbarHeight: 40.0,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff151f2c),
          // color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
        ),
      ),
    );
  }
}
