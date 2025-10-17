import 'package:cv_generator/view/cv_templetes.dart/cv_2_generator.dart';
import 'package:cv_generator/view/cv_templetes.dart/cv_3_generator.dart';
import 'package:cv_generator/view/cv_templetes.dart/cv_4_generator.dart';
import 'package:cv_generator/view/cv_templetes.dart/cv_5_generator.dart';
import 'package:cv_generator/view/cv_templetes.dart/cv_generator.dart';
import 'package:cv_generator/view/practice_screen.dart';
import 'package:cv_generator/view/rusumes.dart/resume.dart';
import 'package:cv_generator/view/rusumes.dart/resume_2.dart';
import 'package:cv_generator/view/rusumes.dart/resume_3.dart';
import 'package:cv_generator/view/rusumes.dart/resume_4.dart';
import 'package:cv_generator/view/rusumes.dart/resume_5.dart';
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
      home:Resume5Screen()
    );
  }
}
