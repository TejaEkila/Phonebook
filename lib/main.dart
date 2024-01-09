import 'package:flutter/material.dart';
import 'package:phonebook/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: const Color.fromARGB(255, 241, 241, 240),
      title: 'Flutter Demo',
      
      theme: ThemeData(
        
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: const Color.fromARGB(255, 241, 241, 240)),
      ),
      home: const MyHomePage(
      ),
    );
  }
}
