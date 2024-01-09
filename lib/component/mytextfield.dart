// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final Controller;
  final String hinttext;
  

  const Mytextfield({
    super.key,
    required this.Controller,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Color.fromARGB(255, 41, 40, 40)),
          controller: Controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color.fromARGB(255, 29, 28, 28))),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
            fillColor: Color.fromARGB(26, 144, 62, 62),
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(color: const Color.fromARGB(255, 63, 63, 63)),
          ),
        ),
      ),
    );
  }
}
