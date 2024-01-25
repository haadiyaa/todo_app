import 'package:flutter/material.dart';

enum AppTheme {
  darkTheme,
  lightTheme,
}

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      dividerColor: Colors.black54,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 35)),
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 56, 56, 56)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 70, 70, 70),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
      ),
    ),

    //
    //

    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: Colors.deepPurple.shade500,
      brightness: Brightness.light,
      dividerColor: const Color(0xff757575),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF9395D3),
        foregroundColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(100, 35)),
          backgroundColor: MaterialStateProperty.all(Color(0xFF9395D3)),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 109, 110, 189),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color.fromARGB(255, 176, 178, 233)),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        backgroundColor: Color(0xFF9395D3),
        elevation: 5,
        shadowColor: Colors.black,
      ),
    ),
  };
}
