//import 'package:apptoon/widgets/button.dart';
//import 'package:apptoon/widgets/currency_card.dart';
//import 'package:apptoon/screens/home_screen.dart';
import 'package:apptoon/appScreens/home_screen.dart';
import 'package:apptoon/services/api_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}