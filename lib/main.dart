import 'package:cv_generator/view/cv_2_generator.dart';
import 'package:cv_generator/view/cv_3_generator.dart';
import 'package:cv_generator/view/cv_4_generator.dart';
import 'package:cv_generator/view/cv_5_generator.dart';
import 'package:cv_generator/view/cv_generator.dart';
import 'package:cv_generator/view/resume.dart';
import 'package:cv_generator/view/resume_2.dart';
import 'package:cv_generator/view/resume_3.dart';
import 'package:cv_generator/view/resume_4.dart';
import 'package:cv_generator/view/resume_5.dart';
import 'package:flutter/material.dart';

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
      home: Resume2Page()
    );
  }
}
