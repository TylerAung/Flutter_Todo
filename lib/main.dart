import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/registration.dart';
import 'screens/test.dart';
// import 'package:world_time/pages/home.dart';
// import 'pages/choose_location.dart';
// import 'pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    // initialRoute: '/home',
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/register': (context) => Registration(),
      '/test': (context) => Test(),
      // '/home': (context) => Home(),
      // '/location' : (context) => ChooseLocation()
    },
    //Route navigation works like arrary, on each new page it adds into current array. Moving to previous is like removing recent entry in array
  ));
}

// CRUD + AUTHENTICATION + WEB API
//https://auth0.com/blog/build-flutter-wishlist-app-with-secure-api-part-1/
//https://auth0.com/blog/build-flutter-wishlist-app-with-secure-api-part-2/
//https://auth0.com/blog/build-flutter-wishlist-app-with-secure-api-part-3