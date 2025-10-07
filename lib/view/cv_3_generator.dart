// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class Resume3Screen extends StatefulWidget {
//   const Resume3Screen({super.key});

//   @override
//   State<Resume3Screen> createState() => _Resume3ScreenState();
// }

// class _Resume3ScreenState extends State<Resume3Screen> {
//   Future<void> _printResume() async {
//     final pdf = pw.Document();
//     final image = await imageFromAssetBundle('flower/frey.jpeg');

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(0),
//         build: (context) {
//           return pw.Row(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               // LEFT SECTION
//               pw.Container(
//                 width: 180,
//                 color: PdfColor.fromHex('#e9d7d5'),
//                 padding: const pw.EdgeInsets.all(20),
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.center,
//                   children: [
//                     pw.Container(
//                       width: 100,
//                       height: 100,
//                       decoration: pw.BoxDecoration(
//                         shape: pw.BoxShape.circle,
//                         image: pw.DecorationImage(image: image, fit: pw.BoxFit.cover),
//                       ),
//                     ),
//                     pw.SizedBox(height: 20),
//                     pw.Align(
//                         alignment: pw.Alignment.centerLeft,
//                         child: pw.Text("PROFILE",
//                             style: pw.TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: pw.FontWeight.bold))),
//                     pw.SizedBox(height: 6),
//                     pw.Text(
//                         "Business Administration student. I consider myself a responsible and orderly person. I am looking forward to my first work experience.",
//                         style: const pw.TextStyle(fontSize: 10),
//                         textAlign: pw.TextAlign.justify),
//                     pw.SizedBox(height: 20),
//                     pw.Align(
//                         alignment: pw.Alignment.centerLeft,
//                         child: pw.Text("CONTACT ME",
//                             style: pw.TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: pw.FontWeight.bold))),
//                     pw.SizedBox(height: 6),
//                     pw.Text(
//                       "PHONE: +01-654-1999\nEMAIL: donna@gmail.com\nADDRESS: Street no. 54,\nAvenue St. Any City, ST 12345",
//                       style: const pw.TextStyle(fontSize: 10),
//                     ),
//                   ],
//                 ),
//               ),

//               // RIGHT SECTION
//               pw.Expanded(
//                 child: pw.Container(
//                   color: PdfColors.white,
//                   child: pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       // Header with background color
//                       pw.Container(
//                         width: double.infinity,
//                         color: PdfColor.fromHex('#D9CFCE'),
//                         padding: const pw.EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 25),
//                         child: pw.Column(
//                             crossAxisAlignment: pw.CrossAxisAlignment.start,
//                             children: [
//                               pw.Text("DONNA STROUPE",
//                                   style: pw.TextStyle(
//                                       fontSize: 26,
//                                       fontWeight: pw.FontWeight.bold,
//                                       letterSpacing: 1)),
//                               pw.SizedBox(height: 3),
//                               pw.Text("Student",
//                                   style: const pw.TextStyle(
//                                       fontSize: 12, color: PdfColors.grey700)),
//                             ]),
//                       ),

//                       // Content below header
//                       pw.Container(
//                         padding: const pw.EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 30),
//                         child: pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             _pdfSection("EDUCATION", [
//                               _pdfBold("BORCELLE UNIVERSITY"),
//                               _pdfSmall(
//                                   "Business Administration career, in progress."),
//                               _pdfBold("BORCELLE COLLEGE"),
//                               _pdfSmall("2020–2022"),
//                             ]),
//                             _pdfSection("LANGUAGE", [
//                               _pdfSmall("Native English."),
//                               _pdfSmall("Advanced Spanish."),
//                             ]),
//                             _pdfSection("COMPUTER SKILLS", [
//                               _pdfSmall("Text processor."),
//                               _pdfSmall("Spreadsheet."),
//                               _pdfSmall("Slide presentation."),
//                             ]),
//                             _pdfSection("VOLUNTEER EXPERIENCE", [
//                               _pdfBold("BORCELLE COMPANY"),
//                               _pdfSmall(
//                                   "Participation in collections to distribute in low-income schools."),
//                             ]),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) async => pdf.save());
//   }

//   // PDF helpers
//   pw.Widget _pdfSection(String title, List<pw.Widget> children) => pw.Padding(
//         padding: const pw.EdgeInsets.only(bottom: 18),
//         child: pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               pw.Text(title,
//                   style: pw.TextStyle(
//                       fontSize: 14, fontWeight: pw.FontWeight.bold)),
//               pw.SizedBox(height: 6),
//               ...children,
//             ]),
//       );

//   pw.Widget _pdfBold(String text) => pw.Text(text,
//       style: pw.TextStyle(
//           fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.black));

//   pw.Widget _pdfSmall(String text) =>
//       pw.Text(text, style: const pw.TextStyle(fontSize: 10));

//   // --- UI ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       appBar: AppBar(
//         title: const Text("Resume Template"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: _printResume,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Container(
//           width: 600,
//           height: 800,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 5,
//                     offset: const Offset(0, 2))
//               ]),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // LEFT PANEL
//               Container(
//                 width: 200,
//                 color: const Color(0xFFE9D7D5),
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     const CircleAvatar(
//                         radius: 50,
//                         backgroundImage: AssetImage('profile.jpg')),
//                     const SizedBox(height: 20),
//                     const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("PROFILE",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12))),
//                     const SizedBox(height: 6),
//                     const Text(
//                       "Business Administration student. I consider myself a responsible and orderly person. I am looking forward to my first work experience.",
//                       style: TextStyle(fontSize: 10),
//                       textAlign: TextAlign.justify,
//                     ),
//                     const SizedBox(height: 20),
//                     const Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("CONTACT ME",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 12))),
//                     const SizedBox(height: 6),
//                     const Text(
//                       "PHONE: +01-654-1999\nEMAIL: donna@gmail.com\nADDRESS: Street no. 54,\nAvenue St. Any City, ST 12345",
//                       style: TextStyle(fontSize: 10),
//                     ),
//                   ],
//                 ),
//               ),

//               // RIGHT PANEL
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Header with background color
//                     Container(
//                       width: double.infinity,
//                       color: const Color(0xffD4C9C9),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 25),
//                       child: const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("DONNA STROUPE",
//                                 style: TextStyle(
//                                     fontSize: 26,
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 1)),
//                             SizedBox(height: 3),
//                             Text("Student",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.grey)),
//                           ]),
//                     ),

//                     // Main content
//                     Expanded(
//                       child: Container(
//                         color: Colors.white,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 40, vertical: 30),
//                         child: const SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               _Section("EDUCATION", [
//                                 _Bold("BORCELLE UNIVERSITY"),
//                                 _Small(
//                                     "Business Administration career, in progress."),
//                                 _Bold("BORCELLE COLLEGE"),
//                                 _Small("2020–2022"),
//                               ]),
//                               _Section("LANGUAGE", [
//                                 _Small("Native English."),
//                                 _Small("Advanced Spanish."),
//                               ]),
//                               _Section("COMPUTER SKILLS", [
//                                 _Small("Text processor."),
//                                 _Small("Spreadsheet."),
//                                 _Small("Slide presentation."),
//                               ]),
//                               _Section("VOLUNTEER EXPERIENCE", [
//                                 _Bold("BORCELLE COMPANY"),
//                                 _Small(
//                                     "Participation in collections to distribute in low-income schools."),
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Small reusable UI text widgets
// class _Section extends StatelessWidget {
//   final String title;
//   final List<Widget> children;
//   const _Section(this.title, this.children);

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.only(bottom: 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title,
//                 style:
//                     const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//             const SizedBox(height: 6),
//             ...children,
//           ],
//         ),
//       );
// }

// class _Bold extends StatelessWidget {
//   final String text;
//   const _Bold(this.text);
//   @override
//   Widget build(BuildContext context) =>
//       Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12));
// }

// class _Small extends StatelessWidget {
//   final String text;
//   const _Small(this.text);
//   @override
//   Widget build(BuildContext context) =>
//       Text(text, style: const TextStyle(fontSize: 10));
// }











// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// const Color kLeftColor = Color(0xffB5A2A4);
// const double leftColumnWidth = 200;

// class Resume3Screen extends StatelessWidget {
//   const Resume3Screen({super.key});

//   Future<Uint8List> _generatePdf(PdfPageFormat format) async {
//     final doc = pw.Document();

//     // Personal Information
//     const aboutText =
//         'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.';

//     final experiences = [
//       {
//         'role':
//             'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//         'company': 'SecureHops | www.securehops.com',
//         'period': 'Sept 2023 - Jan 2025',
//         'details':
//             'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications. Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
//       },
//       {
//         'role': 'Team Lead (Flutter + Backend)',
//         'company': 'SecureHops',
//         'period': 'Jan 2023 - Jan 2025',
//         'details':
//             'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
//       },
//       {
//         'role': 'Flutter Developer',
//         'company': 'TYDUP LTD',
//         'period': 'April 2024 - Sept 2025',
//         'details':
//             'Designed and developed a mobile app to connect customers with on-demand cleaning services. Implemented server-driven UI and profile modules.'
//       },
//       {
//         'role': 'Flutter Developer (Freelance / Contracts)',
//         'company': 'Fiverr / Upwork / Various',
//         'period': '2019 - 2024',
//         'details':
//             'Worked on dozens of projects including consumer apps, e-commerce, and utility apps. Delivered high-quality code, well-documented APIs, and user-centric design.'
//       },
//     ];

//     final education = [
//       {
//         'title': 'Bachelors in Information Technology',
//         'institution': 'University of Punjab Lahore',
//         'years': '2019 - 2023'
//       },
//       {
//         'title': 'F.Sc Pre-Engineering',
//         'institution': 'Islamia College, Lahore',
//         'years': '2016 - 2019'
//       },
//       {
//         'title': 'Matric',
//         'institution': 'Islamia High School, Lahore',
//         'years': '2014 - 2016'
//       },
//     ];

//     final coreSkills = [
//       'Flutter & Dart - Cross-Platform Development, iOS & Android',
//       'Firebase Suite - Auth, Firestore, Storage, Cloud Functions',
//       'Backend Development - Node.js, Laravel, REST, GraphQL, Express.js',
//       'State Management - Provider, Riverpod, BLoC, GetX, Cubit',
//       'DevOps & Deployment - CI/CD, Docker, Kubernetes, GitHub Actions',
//       'AI & ML Integration - TensorFlow Lite, Firebase ML Kit, OpenAI APIs',
//       'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
//       'Version Control - Git, GitHub, GitLab, Bitbucket',
//       'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',
//     ];

//     final projects = [
//       {'title': 'Sendsorta', 'desc': 'Personalized guidance app with 24/7 support and case resources.'},
//       {'title': 'Griot Connects', 'desc': 'Social marketplace for sellers and buyers with secure checkout.'},
//       {'title': 'CircleUp', 'desc': 'Platform to create events and connect local businesses.'},
//       {'title': 'InstaCalm Anxiety', 'desc': 'Anxiety therapy helper with relaxation sessions and content.'},
//       {'title': 'BargainEx', 'desc': 'E-commerce platform for buying and selling categories.'},
//       {'title': 'Salamy', 'desc': 'Islamic daily prayer and Quran app.'},
//       {'title': 'Ping', 'desc': 'Proximity-based social app connecting nearby contacts.'},
//       {'title': 'Globe', 'desc': 'Interactive website with unique user interaction visuals.'},
//       {'title': 'Certainlini', 'desc': 'Platform for building compliance and certification workflows.'},
//     ];

//     final references = [
//       'Melissa Leeds — melissagoldcoast.com | 732-219-0199',
//       'George Kenny — gkenny@att.com | 888-977-0923'
//     ];

//     // Left Panel
//     pw.Widget buildLeftPanel({bool showInfo = false}) {
//       return pw.Container(
//         width: 140,
//         color: PdfColor.fromHex('#B5A2A4'),
//         padding: const pw.EdgeInsets.all(16),
//         child: showInfo
//             ? pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('ARHAM SARWAR',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                   pw.SizedBox(height: 6),
//                   pw.Text('Senior Flutter Developer (Backend + AI + Deployment)',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.SizedBox(height: 10),
//                   pw.Text('Mobile: +92 308 4695012',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.Text('Email: arham.sarwar786@gmail.com',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.Text('LinkedIn: linkedin.com/in/arham-sarwar',
//                       style: const pw.TextStyle(fontSize: 8)),
//                 ],
//               )
//             : pw.Container(),
//       );
//     }

//     // Page 1: Profile + Experience
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(showInfo: true),
//           pw.Expanded(
//             child: pw.Container(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Container(
//                       width: double.infinity,
//                       color: PdfColors.grey300,
//                       padding: const pw.EdgeInsets.all(10),
//                       child: pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Text('ARHAM SARWAR',
//                               style: pw.TextStyle(
//                                   fontSize: 18, fontWeight: pw.FontWeight.bold)),
//                           pw.Text(
//                             'Senior Flutter Developer (Backend + AI + Deployment)',
//                             style: const pw.TextStyle(fontSize: 10),
//                           ),
//                         ],
//                       ),
//                     ),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Profile',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Experience',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var e in experiences)
//                       pw.Padding(
//                         padding: const pw.EdgeInsets.only(top: 6),
//                         child: pw.Column(
//                             crossAxisAlignment: pw.CrossAxisAlignment.start,
//                             children: [
//                               pw.Text(e['role'] ?? '',
//                                   style: pw.TextStyle(
//                                       fontWeight: pw.FontWeight.bold,
//                                       fontSize: 10)),
//                               pw.Text('${e['company']} • ${e['period']}',
//                                   style: const pw.TextStyle(fontSize: 9)),
//                               pw.Text(e['details'] ?? '',
//                                   style: const pw.TextStyle(fontSize: 9)),
//                             ]),
//                       ),
//                   ]),
//             ),
//           ),
//         ]),
//       ),
//     );

//     // Page 2: Education + Skills
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text('Education',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var e in education)
//                       pw.Text(
//                           '${e['title']} - ${e['institution']} (${e['years']})',
//                           style: const pw.TextStyle(fontSize: 9)),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Core Skills',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var s in coreSkills)
//                       pw.Text('• $s', style: const pw.TextStyle(fontSize: 9)),
//                   ]),
//             ),
//           )
//         ]),
//       ),
//     );

//     // Page 3: Projects
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//               child: pw.Padding(
//             padding: const pw.EdgeInsets.all(20),
//             child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('Projects',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                   for (var p in projects)
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.only(top: 6),
//                       child: pw.Text('${p['title']} — ${p['desc']}',
//                           style: const pw.TextStyle(fontSize: 9)),
//                     ),
//                 ]),
//           ))
//         ]),
//       ),
//     );

//     // Page 4: References
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//               child: pw.Padding(
//             padding: const pw.EdgeInsets.all(20),
//             child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('References',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                   for (var r in references)
//                     pw.Text('• $r', style: const pw.TextStyle(fontSize: 9)),
//                 ]),
//           ))
//         ]),
//       ),
//     );

//     return doc.save();
//   }

//   void _onPrintPressed(BuildContext context) {
//     Printing.layoutPdf(
//         onLayout: (format) async => await _generatePdf(format));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kLeftColor,
//         title: const Text('CV - Arham Sarwar'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print, color: Colors.white),
//             onPressed: () => _onPrintPressed(context),
//           )
//         ],
//       ),
//       body: const Center(
//         child: Text('Press print button to generate 4-page PDF'),
//       ),
//     );
//   }
// }






// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// const Color kLeftColor = Color(0xffB5A2A4);
// const double leftColumnWidth = 200;

// class Resume3Screen extends StatelessWidget {
//   const Resume3Screen({super.key});

//   Future<Uint8List> _generatePdf(PdfPageFormat format) async {
//     final doc = pw.Document();

//     // Load image
//     final imageData = await rootBundle.load('flower/ap.jpg');
//     final profileImage = pw.MemoryImage(imageData.buffer.asUint8List());

//     // Personal Information
//     const aboutText =
//         'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.';

//     final experiences = [
//       {
//         'role':
//             'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//         'company': 'SecureHops | www.securehops.com',
//         'period': 'Sept 2023 - Jan 2025',
//         'details':
//             'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications. Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
//       },
//       {
//         'role': 'Team Lead (Flutter + Backend)',
//         'company': 'SecureHops',
//         'period': 'Jan 2023 - Jan 2025',
//         'details':
//             'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
//       },
//       {
//         'role': 'Flutter Developer',
//         'company': 'TYDUP LTD',
//         'period': 'April 2024 - Sept 2025',
//         'details':
//             'Designed and developed a mobile app to connect customers with on-demand cleaning services. Implemented server-driven UI and profile modules.'
//       },
//       {
//         'role': 'Flutter Developer (Freelance / Contracts)',
//         'company': 'Fiverr / Upwork / Various',
//         'period': '2019 - 2024',
//         'details':
//             'Worked on dozens of projects including consumer apps, e-commerce, and utility apps. Delivered high-quality code, well-documented APIs, and user-centric design.'
//       },
//     ];

//     final education = [
//       {
//         'title': 'Bachelors in Information Technology',
//         'institution': 'University of Punjab Lahore',
//         'years': '2019 - 2023'
//       },
//       {
//         'title': 'F.Sc Pre-Engineering',
//         'institution': 'Islamia College, Lahore',
//         'years': '2016 - 2019'
//       },
//       {
//         'title': 'Matric',
//         'institution': 'Islamia High School, Lahore',
//         'years': '2014 - 2016'
//       },
//     ];

//     final coreSkills = [
//       'Flutter & Dart - Cross-Platform Development, iOS & Android',
//       'Firebase Suite - Auth, Firestore, Storage, Cloud Functions',
//       'Backend Development - Node.js, Laravel, REST, GraphQL, Express.js',
//       'State Management - Provider, Riverpod, BLoC, GetX, Cubit',
//       'DevOps & Deployment - CI/CD, Docker, Kubernetes, GitHub Actions',
//       'AI & ML Integration - TensorFlow Lite, Firebase ML Kit, OpenAI APIs',
//       'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
//       'Version Control - Git, GitHub, GitLab, Bitbucket',
//       'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',
//     ];

//     final projects = [
//       {'title': 'Sendsorta', 'desc': 'Personalized guidance app with 24/7 support and case resources.'},
//       {'title': 'Griot Connects', 'desc': 'Social marketplace for sellers and buyers with secure checkout.'},
//       {'title': 'CircleUp', 'desc': 'Platform to create events and connect local businesses.'},
//       {'title': 'InstaCalm Anxiety', 'desc': 'Anxiety therapy helper with relaxation sessions and content.'},
//       {'title': 'BargainEx', 'desc': 'E-commerce platform for buying and selling categories.'},
//       {'title': 'Salamy', 'desc': 'Islamic daily prayer and Quran app.'},
//       {'title': 'Ping', 'desc': 'Proximity-based social app connecting nearby contacts.'},
//       {'title': 'Globe', 'desc': 'Interactive website with unique user interaction visuals.'},
//       {'title': 'Certainlini', 'desc': 'Platform for building compliance and certification workflows.'},
//     ];

//     final references = [
//       'Melissa Leeds — melissagoldcoast.com | 732-219-0199',
//       'George Kenny — gkenny@att.com | 888-977-0923'
//     ];

//     // Left Panel Builder
//     pw.Widget buildLeftPanel({bool showInfo = false}) {
//       return pw.Container(
//         width: 140,
//         color: PdfColor.fromHex('#B5A2A4'),
//         padding: const pw.EdgeInsets.all(16),
//         child: pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.center,
//           children: [
//             // Circular Image only on first page
//             if (showInfo)
//               pw.Container(
//                 width: 80,
//                 height: 80,
//                 decoration: pw.BoxDecoration(
//                   shape: pw.BoxShape.circle,
//                   image: pw.DecorationImage(
//                     image: profileImage,
//                     fit: pw.BoxFit.cover,
//                   ),
//                 ),
//               ),
//             if (showInfo) pw.SizedBox(height: 12),
//             if (showInfo)
//               pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('ARHAM SARWAR',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                   pw.SizedBox(height: 6),
//                   pw.Text('Senior Flutter Developer (Backend + AI + Deployment)',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.SizedBox(height: 10),
//                   pw.Text('Mobile: +92 308 4695012',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.Text('Email: arham.sarwar786@gmail.com',
//                       style: const pw.TextStyle(fontSize: 8)),
//                   pw.Text('LinkedIn: linkedin.com/in/arham-sarwar',
//                       style: const pw.TextStyle(fontSize: 8)),
//                 ],
//               ),
//           ],
//         ),
//       );
//     }

//     // Page 1
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(showInfo: true),
//           pw.Expanded(
//             child: pw.Container(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Container(
//                       width: double.infinity,
//                       color: PdfColors.grey300,
//                       padding: const pw.EdgeInsets.all(10),
//                       child: pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Text('ARHAM SARWAR',
//                               style: pw.TextStyle(
//                                   fontSize: 18, fontWeight: pw.FontWeight.bold)),
//                           pw.Text(
//                             'Senior Flutter Developer (Backend + AI + Deployment)',
//                             style: const pw.TextStyle(fontSize: 10),
//                           ),
//                         ],
//                       ),
//                     ),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Profile',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Experience',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var e in experiences)
//                       pw.Padding(
//                         padding: const pw.EdgeInsets.only(top: 6),
//                         child: pw.Column(
//                             crossAxisAlignment: pw.CrossAxisAlignment.start,
//                             children: [
//                               pw.Text(e['role'] ?? '',
//                                   style: pw.TextStyle(
//                                       fontWeight: pw.FontWeight.bold,
//                                       fontSize: 10)),
//                               pw.Text('${e['company']} • ${e['period']}',
//                                   style: const pw.TextStyle(fontSize: 9)),
//                               pw.Text(e['details'] ?? '',
//                                   style: const pw.TextStyle(fontSize: 9)),
//                             ]),
//                       ),
//                   ]),
//             ),
//           ),
//         ]),
//       ),
//     );

//     // Page 2
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//             child: pw.Padding(
//               padding: const pw.EdgeInsets.all(20),
//               child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text('Education',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var e in education)
//                       pw.Text(
//                           '${e['title']} - ${e['institution']} (${e['years']})',
//                           style: const pw.TextStyle(fontSize: 9)),
//                     pw.SizedBox(height: 10),
//                     pw.Text('Core Skills',
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                     for (var s in coreSkills)
//                       pw.Text('• $s', style: const pw.TextStyle(fontSize: 9)),
//                   ]),
//             ),
//           )
//         ]),
//       ),
//     );

//     // Page 3
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//               child: pw.Padding(
//             padding: const pw.EdgeInsets.all(20),
//             child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('Projects',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                   for (var p in projects)
//                     pw.Padding(
//                       padding: const pw.EdgeInsets.only(top: 6),
//                       child: pw.Text('${p['title']} — ${p['desc']}',
//                           style: const pw.TextStyle(fontSize: 9)),
//                     ),
//                 ]),
//           ))
//         ]),
//       ),
//     );

//     // Page 4
//     doc.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) => pw.Row(children: [
//           buildLeftPanel(),
//           pw.Expanded(
//               child: pw.Padding(
//             padding: const pw.EdgeInsets.all(20),
//             child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('References',
//                       style: pw.TextStyle(
//                           fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                   for (var r in references)
//                     pw.Text('• $r', style: const pw.TextStyle(fontSize: 9)),
//                 ]),
//           ))
//         ]),
//       ),
//     );

//     return doc.save();
//   }

//   void _onPrintPressed(BuildContext context) {
//     Printing.layoutPdf(onLayout: (format) async => await _generatePdf(format));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kLeftColor,
//         title: const Text('CV - Arham Sarwar'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print, color: Colors.white),
//             onPressed: () => _onPrintPressed(context),
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const CircleAvatar(
//               radius: 40,
//               backgroundImage: AssetImage('flower/ap.jpg'),
//             ),
//             const SizedBox(height: 16),
//             const Text('Press print button to generate 4-page PDF'),
//           ],
//         ),
//       ),
//     );
//   }
// }







// lib/main.dart


// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// const Color kLeftColor = Color(0xffB5A2A4);
// const double leftPanelWidth = 200.0;




//   @override
 

// class Resume3Screen extends StatefulWidget {
//   const Resume3Screen({super.key});

//   @override
//   State<Resume3Screen> createState() => _Resume3ScreenState();
// }

// class _Resume3ScreenState extends State<Resume3Screen> {
//   final String aboutText = '''
// Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.
// ''';

//   final List<Map<String, String>> experiences = [
//     {
//       'role': 'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'SecureHops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'details': 'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL). Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
//     },
//     {
//       'role': 'Team Lead (Flutter + Backend)',
//       'company': 'SecureHops',
//       'period': 'Jan 2023 - Jan 2025',
//       'details': 'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
//     },
//     {
//       'role': 'Senior Flutter & Backend Developer',
//       'company': 'SecureHops',
//       'period': 'July 2022 - Jan 2025',
//       'details': 'Built and maintained scalable mobile apps, integrated backend services, and improved app delivery pipelines.'
//     },
//   ];

//   final List<Map<String, String>> education = [
//     {'title': 'Bachelors in Information Technology', 'institution': 'University of Punjab Lahore', 'years': '2019 - 2023'},
//     {'title': 'F.Sc Pre-Engineering', 'institution': 'Islamia College, Lahore', 'years': '2016 - 2019'},
//     {'title': 'Matric', 'institution': 'Islamia High School, Lahore', 'years': '2014 - 2016'},
//   ];

//   final List<String> coreSkills = [
//     'Flutter & Dart - Cross-Platform Development',
//     'Firebase Suite - Auth, Firestore, Storage',
//     'Backend Development - Node.js, Laravel, GraphQL',
//     'State Management - Provider, Riverpod, BLoC, GetX',
//     'DevOps & Deployment - CI/CD, Docker, Kubernetes',
//   ];

//   final List<Map<String, String>> projects = [
//     {'title': 'Sendsorta', 'desc': 'Personalized guidance app with 24/7 support and case resources.'},
//     {'title': 'Griot Connects', 'desc': 'Social marketplace for sellers and buyers with secure checkout.'},
//   ];

//   final List<String> references = [
//     'Melissa Leeds — melissagoldcoast.com | 732-219-0199',
//     'George Kenny — gkenny@att.com | 888-977-0923'
//   ];

//   // ---------------------- PDF generator ----------------------
//   Future<Uint8List> _generatePdf(PdfPageFormat format) async {
//     final doc = pw.Document();
//     final bytes = (await rootBundle.load('flower/ap.jpg')).buffer.asUint8List();
//     final pw.MemoryImage profileImage = pw.MemoryImage(bytes);

//     // Left panel widget
//     pw.Widget leftPanel({required bool showImage, required bool showInfo}) {
//       return pw.Container(
//         width: 150,
//         color: PdfColor.fromInt(0xffB5A2A4),
//         padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 12),
//         child: pw.Column(
//           mainAxisAlignment: pw.MainAxisAlignment.start,
//           children: [
//             if (showImage)
//               pw.Container(
//                 width: 86,
//                 height: 86,
//                 decoration: pw.BoxDecoration(
//                   shape: pw.BoxShape.circle,
//                   image: pw.DecorationImage(image: profileImage, fit: pw.BoxFit.cover),
//                 ),
//               ),
//             if (showImage) pw.SizedBox(height: 12),
//             if (showInfo) ...[
//               pw.Text('ARHAM SARWAR', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
//               pw.SizedBox(height: 6),
//               pw.Text('Senior Flutter Developer', style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),
//               pw.SizedBox(height: 8),
//               pw.Text('Mobile: +92 308 4695012', style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),
//               pw.Text('Email: arham.sarwar786@gmail.com', style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),
//             ],
//           ],
//         ),
//       );
//     }

//     // --- PAGE 1: With image + info
//     doc.addPage(pw.Page(pageFormat: format, margin: const pw.EdgeInsets.all(20), build: (context) {
//       return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         leftPanel(showImage: true, showInfo: true),
//         pw.SizedBox(width: 12),
//         pw.Expanded(
//           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Container(
//               height: 200,
//               width: double.infinity,
//             color: PdfColor.fromHex('#D9CFCE'),
//               padding: const pw.EdgeInsets.all(10),
//               child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                 pw.Text('ARHAM SARWAR', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
//                 pw.Text('Senior Flutter Developer (Backend + AI + Deployment)', style: const pw.TextStyle(fontSize: 10)),
//               ]),
//             ),
//             pw.SizedBox(height: 10),
//             pw.Text('Profile', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             pw.SizedBox(height: 6),
//             pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
//             pw.SizedBox(height: 12),
//             pw.Text('Experience', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             for (var e in experiences)
//               pw.Padding(
//                 padding: const pw.EdgeInsets.only(top: 8),
//                 child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                   pw.Text(e['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
//                   pw.Text('${e['company']} • ${e['period']}', style: const pw.TextStyle(fontSize: 9)),
//                   pw.Text(e['details'] ?? '', style: const pw.TextStyle(fontSize: 9)),
//                 ]),
//               ),
//           ]),
//         ),
//       ]);
//     }));

//     // --- PAGE 2: Empty left panel (no image/info)
//     doc.addPage(pw.Page(pageFormat: format, margin: const pw.EdgeInsets.all(20), build: (context) {
//       return pw.Row(children: [
//         leftPanel(showImage: false, showInfo: false),
//         pw.SizedBox(width: 12),
//         pw.Expanded(
//           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Text('Education', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             for (var ed in education)
//               pw.Padding(
//                 padding: const pw.EdgeInsets.only(top: 6),
//                 child: pw.Text('${ed['title']} — ${ed['institution']} (${ed['years']})', style: const pw.TextStyle(fontSize: 9)),
//               ),
//             pw.SizedBox(height: 10),
//             pw.Text('Core Skills', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             for (var s in coreSkills)
//               pw.Padding(
//                 padding: const pw.EdgeInsets.only(top: 4),
//                 child: pw.Text('• $s', style: const pw.TextStyle(fontSize: 9)),
//               ),
//           ]),
//         ),
//       ]);
//     }));

//     // --- PAGE 3: Empty left panel
//     doc.addPage(pw.Page(pageFormat: format, margin: const pw.EdgeInsets.all(20), build: (context) {
//       return pw.Row(children: [
//         leftPanel(showImage: false, showInfo: false),
//         pw.SizedBox(width: 12),
//         pw.Expanded(
//           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Text('Projects', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             for (var p in projects)
//               pw.Padding(
//                 padding: const pw.EdgeInsets.only(top: 6),
//                 child: pw.Text('${p['title']} — ${p['desc']}', style: const pw.TextStyle(fontSize: 9)),
//               ),
//           ]),
//         ),
//       ]);
//     }));

//     // --- PAGE 4: Empty left panel
//     doc.addPage(pw.Page(pageFormat: format, margin: const pw.EdgeInsets.all(20), build: (context) {
//       return pw.Row(children: [
//         leftPanel(showImage: false, showInfo: false),
//         pw.SizedBox(width: 12),
//         pw.Expanded(
//           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Text('References', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
//             for (var r in references)
//               pw.Padding(
//                 padding: const pw.EdgeInsets.only(top: 4),
//                 child: pw.Text('• $r', style: const pw.TextStyle(fontSize: 9))),
//           ]),
//         ),
//       ]);
//     }));

//     return doc.save();
//   }

//   Future<void> _onPrintPressed() async {
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => _generatePdf(format));
//   }

//   // ---------------------- UI ----------------------
//   Widget _leftPanelUI() {
//     return Container(
//       width: leftPanelWidth,
//       color: kLeftColor,
//       padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
//       child: Column(
//         children: [
//           const CircleAvatar(
//             radius: 46,
//             backgroundImage: AssetImage('flower/ap.jpg'),
//           ),
//           const SizedBox(height: 12),
//           const Text('ARHAM SARWAR', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 6),
//           const Text('Senior Flutter Developer', style: TextStyle(color: Colors.white70), textAlign: TextAlign.center),
//           const SizedBox(height: 12),
//           const Divider(color: Colors.white24),
//           const SizedBox(height: 8),
//           const Text('Mobile: +92 308 4695012', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 4),
//           const Text('Email: arham.sarwar786@gmail.com', style: TextStyle(color: Colors.white70)),
//           const Spacer(),
//           const Text('Available for freelance & full-time', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }

//   Widget _rightContentUI() {
//     return Expanded(
//       child: Container(
//         color: Colors.white,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Container(
//               width: double.infinity,
//               color: const Color(0xffEDEAEA),
//               padding: const EdgeInsets.all(12),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
//                 Text('ARHAM SARWAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 6),
//                 Text('Senior Flutter Developer (Backend + AI + Deployment)'),
//               ]),
//             ),
//             const SizedBox(height: 16),
//             const Text('PROFILE', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             Text(aboutText),
//             const SizedBox(height: 14),
//             const Text('EMPLOYMENT HISTORY', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             for (var e in experiences)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Text(e['role'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Text('${e['company']} • ${e['period']}', style: const TextStyle(color: Colors.black54)),
//                   Text(e['details'] ?? ''),
//                 ]),
//               ),
//           ]),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CV - Arham Sarwar'),
//         backgroundColor: kLeftColor,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: TextButton(
//               style: TextButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
//               onPressed: _onPrintPressed,
//               child: const Text('PRINT'),
//             ),
//           ),
//         ],
//       ),
//       body: Row(children: [
//         _leftPanelUI(),
//         _rightContentUI(),
//       ]),
//     );
//   }
// }





import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const Color kLeftColor = Color(0xffB5A2A4);
const double leftPanelWidth = 200.0;

class Resume3Screen extends StatefulWidget {
  const Resume3Screen({super.key});

  @override
  State<Resume3Screen> createState() => _Resume3ScreenState();
}

class _Resume3ScreenState extends State<Resume3Screen> {
  final String aboutText = '''
Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.
''';

  final List<Map<String, String>> experiences = [
    {
      'role': 'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
      'company': 'SecureHops | www.securehops.com',
      'period': 'Sept 2023 - Jan 2025',
      'details':
          'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL). Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
    },
    {
      'role': 'Team Lead (Flutter + Backend)',
      'company': 'SecureHops',
      'period': 'Jan 2023 - Jan 2025',
      'details':
          'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
    },
    {
      'role': 'Senior Flutter & Backend Developer',
      'company': 'SecureHops',
      'period': 'July 2022 - Jan 2025',
      'details':
          'Built and maintained scalable mobile apps, integrated backend services, and improved app delivery pipelines.'
    },
     {
      'role': 'Flutter Developer _ Salamgram',
     
      'period': 'Mar 2019 _ Jan 2025',
      'details': 'As a Flutter Developer, contributing to the success of Salamly: Muslim Daily App, a comprehensive app for Muslims with 50K+ downloads Developed features for daily prayer days, Quran, and Islamic tools to enhance user engagement.\nPlayed a key role in achieving over 50,000 downloads through optimized performance and user-focused updates.'
    },
     
   
         
  ];
  final List<Map<String, String>> experiences2 = [
    {
      'role': 'CTO & Flutter Developer _ Harry Chat',
    
      'period': 'Dec 2024 _ Present',
      'details': 'Currently working as a CTO & Senior Flutter Developer for an Islamic App, Wordbook, with over 10,000 downloads.'

'Designed and developed core features using Flutter and APIs, improving 70% workflows and boosting user retention.'

'Helped deliver a spiritually enriching experience with engaging and innovative features.'

'Achieved 10K+ downloads through robust performance, user engagement, and continuous updates.'
    },
    {
      'role': 'CTO & FlutterFlow Developer _ Griot Contents',
     
      'period': 'Jan 2024 _ Present',
      'details': 'Developed an eBook app for users to buy and sell eBooks online.'

'Implemented secure authentication, payment integration, and digital library management.'

'Enabled easy upload, search, and purchase of eBooks with a smooth user experience.'

'Built complete FlutterFlow-based solution to support growing user and content needs.'
    },
    {
      'role': 'CTO & Flutter Developer _ IQRA Quran App',
     
      'period': 'Jan 2024 _ Present',
      'details': 'Led the development of the IQRA Quran App, providing offline access to the Holy Quran.'

'Designed the technical strategy and architecture to ensure scalability, security, and smooth user experience.'

'Focused on enriching spiritual engagement with interactive features of Surahs and Juz.'

'Built and deploy'
    },
        {
      'role': 'CTO & Flutter Developer _ CRO App',
     
      'period': 'Jan 2024 _Present',
      'details': 'Developed a Flutter mobile app for students to find jobs.'

'Built Flutter web panels for employers to post jobs and admins to manage features.'

'Managed the end-to-end deployment of the platform.'
    },
        {
      'role': 'Flutter Developer _ Fiverr | Upwork',
     
      'period': 'April 2020 _ Sept 2022',
      'details': 'Worked as a Freelance Flutter Developer on Fiverr, Upwork delivering high-quality Flutter and backend solutions.'

'Completed 5 strong projects with a focus on mobile apps, APIs, and scalable backend systems.'
'Maintained a strong reputation through timely delivery, attention to detail, and excellent client communication.'
'Helped clients achieve their goals with tailored, innovative solutions.'
    },    
      {
      'role': 'Flutter Developer _ Self',
     
      'period': 'Sept 2024 _ Dec 2024',
      'details': 'Delivered high-quality solutions with strong technical expertise, ensuring tasks of any size were completed efficiently.'

'Applied leadership skills to manage projects holistically and drive team success.'

'Recognized proactively by suggesting innovative ideas beyond assigned tasks.'

'Contributed as a reliable asset to teams and projects in Flutter/FlutterFlow development.'

    },   
     {
      'role': 'Flutter Developer _ WeQed',
     
      'period': 'Dec 2024 _ Present',
      'details': 'Developed and launched an app with 5K+ downloads and a 12+ content rating.'

'Built a performing learning app to sign up and earn by sharing their knowledge and skills.'

'Developed features such as user sign-in, rewards system, and teacher/student dashboards.'

'Designed solutions to help users solve problems efficiently and gain the right direction.'

    },    
           
   
   
    
    
  ];

  final List<Map<String, String>> education = [
    {
      'title': 'Bachelors in Information Technology',
      'institution': 'University of Punjab Lahore',
      'years': '2019 - 2023'
    },
    {
      'title': 'F.Sc Pre-Engineering',
      'institution': 'Islamia College, Lahore',
      'years': '2016 - 2019'
    },
    {
      'title': 'Matric',
      'institution': 'Islamia High School, Lahore',
      'years': '2014 - 2016'
    },
  ];

  final List<String> coreSkills = [
    'Flutter & Dart - Cross-Platform Development',
    'Firebase Suite - Auth, Firestore, Storage',
    'Backend Development - Node.js, Laravel, GraphQL',
    'State Management - Provider, Riverpod, BLoC, GetX',
    'DevOps & Deployment - CI/CD, Docker, Kubernetes',
  ];

  final List<Map<String, String>> projects = [
    {'title': 'Sendsorta', 'tag': 'Mobile Application', 'desc': 'Personalized guidance app with 24/7 support and case resources.'},
    {'title': 'Griot Connects', 'tag': 'Mobile Application', 'desc': 'Social marketplace for sellers and buyers with secure checkout.'},
    {'title': 'CircleUp', 'tag': 'Mobile Application', 'desc': 'Platform to create events and connect local businesses.'},
    {'title': 'InstaCalm Anxiety', 'tag': 'Mobile Application', 'desc': 'Anxiety therapy helper with relaxation sessions and content.'},
    {'title': 'BargainEx', 'tag': 'Mobile Application', 'desc': 'E-commerce platform for buying and selling categories.'},
    {'title': 'Salamy', 'tag': 'Mobile Application', 'desc': 'Islamic daily prayer and Quran app.'},
    {'title': 'Ping', 'tag': 'Mobile Application', 'desc': 'Proximity-based social app connecting nearby contacts.'},
    {'title': 'Globe', 'tag': 'Website + Backend', 'desc': 'Interactive website with unique user interaction visuals.'},
    {'title': 'Certainlini', 'tag': 'Website + Backend', 'desc': 'Platform for building compliance and certification workflows.'},
   {'title': 'Fittechn', 'tag': 'Complete Flutter App', 'desc': 'Fittechn provides Arabic and Spanish speakers a fitness-oriented application focusing on daily workouts, calorie tracking, and nutrition. Developed entirely with a focus on Spanish-language users.'},
   {'title': 'AirMoneRestaurant', 'tag': 'Complete Flutter Application', 'desc': 'AirMoneRestaurant app is a specialized application catering to a specific restaurants ordering and delivery system, along with an authentic point-based membership reward system.'},
   {'title': 'IQRA Quran App', 'tag': 'Complete Flutter Application', 'desc': 'IQRA is a Quran app offering features like Quranic content, prayer times, daily Duas, and an offline reading mode. Designed for Muslims seeking Quranic guidance and Islamic practices.'},
   {'title': 'Reverse Disease', 'tag': 'FlutterFlow Application', 'desc': 'Reverse Disease is a health tracking app that monitors fatigue, sugar, weight, and nutrition, providing a comprehensive tool for users aiming to improve their health and lifestyle.'},
   {'title': 'Amici', 'tag': 'Complete Flutter App', 'desc': 'Amici App is designed to streamline the process of booking a chef for entire events and gatherings.'},
     {'title': 'United Proposal', 'tag': 'FlutterFlow Application', 'desc': 'United Proposal is a matrimonial matching platform facilitating the search for suitable life partners through detailed algorithms and AI-based compatibility results. The app includes an integrated chat system, premium subscription model, and an admin dashboard for content control. '},
     {'title': 'PricePro', 'tag': 'Complete Flutter App', 'desc': 'Application for managing menus of different branches of restaurants. Copy and sync features for branches and add different taxes. '},
     {'title': 'MyCash', 'tag': 'Complete Flutter App', 'desc': 'MyCash App is a home-run application designed to provide easy and transparent record-keeping for small business owners and individuals. '},
     {'title': 'Flavourz Restaurant', 'tag': 'Complete Flutter App', 'desc': 'Flavourz is a dedicated food application tailored for a specific restaurant, implementing ordering and specialized platform for customers to place orders. '},
     {'title': 'Tritt', 'tag': 'Complete Flutter App', 'desc': ' Tritt is a FlutterApp now resembling TrueCaller, with features such as SMS blocking, number searching, as well as AI deep-clean and full functionalities.'},
     {'title': 'LockSmith Guru', 'tag': 'Complete Flutter App', 'desc': 'Locksmith Guru is a specialized app designed for resolving various types of lockouts and guiding customers to the nearest locksmith. '},
     {'title': 'EkCabFare', 'tag': 'Complete Flutter App', 'desc': 'EkCabFare displays and compares fares between Uber, Careem, and Ola cabs, allowing users to select the best option based on mileage, time, and convenience. '},
  
  ];
  final List<Map<String, String>> projects2 = [
   
   
    {'title': 'Muttaqi Quran App', 'tag': 'Complete Flutter App', 'desc': 'Muttaqi Quran App is a digital Quran application serving a larger and growing Muslim community. The app provides Quran reading, tafseer, and prayer notifications with Arabic audio playback for improved accessibility.'},
    {'title': 'Bissi Player', 'tag': 'Complete Flutter App', 'desc': 'Bissi Player is an AI-driven streaming app that allows users to watch movies and music videos through Flutter-based smooth integration. It features smart search, trending recommendations, and card-based interface for easy access.'},
    {'title': 'Kamacee', 'tag': 'Complete Flutter App', 'desc': 'Kamacee is a local African online marketplace app, inspired by platforms like Amazon and Jumia. It provides multi-vendor shopping, delivery status tracking, and rating systems for both sellers and buyers, ensuring safe and reliable transactions.'},
   {'title': 'WirdBook', 'tag': 'Complete Flutter App', 'desc': 'The WirdBook is a spiritual guide for all-day litanies rooted in Prophetic traditions. Designed by Sufi tech engineers, it serves as an all-in-one platform for learning, practicing, and managing daily Wirds, ensuring users remain consistent with their prayers and remembrance.'},
   {'title': 'WeTeachs', 'tag': 'Complete Flutter Application', 'desc': 'Learn and earn by sharing your knowledge_any skill you learned could help others! The WeTeachs app allows users to teach, learn, and earn in one platform, providing practical guidance for tutors to grow their digital reach.'},
   {'title': 'Nubes App', 'tag': 'Complete Flutter Application', 'desc': 'A seamless platform to purchase clothes, online accessories, and personal items designed for both small-scale eCommerce and global marketplaces.'},
   {'title': 'OnPilo', 'tag': 'Complete Flutter App', 'desc': 'OnPilo is a digital learning platform designed to keep user data and activities secure through AI-based tracking and gamified learning systems. It includes a course management dashboard, building a sustainable student-centered model.'},
   {'title': 'Umazing', 'tag': 'Complete Flutter App', 'desc': 'Umazing is a multi-functional eCommerce app built to provide users with a platform to buy and sell all categories of goods, products, and services online. The app includes AI recommendation systems, chat features, and advanced search options.'},
     {'title': 'Visual Fraction Calculator', 'tag': 'Complete Flutter App', 'desc': 'Visual Fraction Calculator is a mobile app designed to make fraction calculation interactive and easy. It includes drag-and-drop visual representation of fractions and converts between forms, serving as a digital educational tool for students. '},
    
  ];

  final List<String> references = [
    'Melissa Leeds _ melissagoldcoast.com | 732-219-0199',
    'George Kenny _ gkenny@att.com | 888-977-0923'
  ];

  // ---------------------- PDF generator ----------------------
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final doc = pw.Document();
    final bytes = (await rootBundle.load('flower/ap.jpg')).buffer.asUint8List();
    final pw.MemoryImage profileImage = pw.MemoryImage(bytes);

    // Left panel widget
    pw.Widget leftPanel({required bool showImage, required bool showInfo}) {
      return pw.Container(
        width: 190,
        color: PdfColor.fromInt(0xffB5A2A4),
        padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 25,),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [


            pw.SizedBox(
              height: 25
            ),
            if (showImage)
              pw.Container(
                width: 150,
                height: 170,
                decoration: pw.BoxDecoration(
                  shape: pw.BoxShape.circle,
                  image: pw.DecorationImage(
                      image: profileImage, fit: pw.BoxFit.cover),
                ),
              ),
            if (showImage) pw.SizedBox(height: 30),
            if (showInfo) ...[
             pw.Text('PROFILE',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
           
           pw.SizedBox(height: 15),
            pw.Text('Senior Flutter Developer  in mobile app development',
                  style: pw.TextStyle(fontSize: 11, color: PdfColors.white)),
                    pw.SizedBox(height: 8),
                 
                    pw.Text('Skilled in Flutter, Firebase, with expertise in backend systems solutions.',
                  style: pw.TextStyle(fontSize: 11, color: PdfColors.white)),

pw.SizedBox(height: 42),
                    pw.Text('CONTACT ME',
                  style: pw.TextStyle(fontSize: 14, color: PdfColors.white,fontWeight: pw.FontWeight.bold)),
           
pw.SizedBox(height: 8),
              pw.Text('PHONE: +92 308 4695012',
                  style: pw.TextStyle(fontSize: 9, color: PdfColors.white)),
                  
pw.SizedBox(height: 8),
              pw.Text('EMAIL: arham.sarwar786@gmail.com',
                  style: pw.TextStyle(fontSize: 9, color: PdfColors.white)),
                   pw.SizedBox(height: 8),
                    pw.Text('Linkedin:arham-sarwar-a1b56b176 ', style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
             
            ],
          ],
        ),
      );
    }

    // --- PAGE 1: Attach header container to left panel ---
    doc.addPage(pw.Page(
      pageFormat: format,
      margin: const pw.EdgeInsets.all(20),
      build: (context) {
        return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          leftPanel(showImage: true, showInfo: true),
          pw.Expanded(
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // attached top container
                pw.Container(
                  height: 200,
                  width: double.infinity,
                  color: PdfColor.fromHex('#D9CFCE'),
                  padding: const pw.EdgeInsets.all(20),
                  child: pw.Column(
                    
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 50),
                        pw.Text('ARHAM ',
                            style: pw.TextStyle(
                                fontSize: 37, fontWeight: pw.FontWeight.bold)),
                                  pw.Text('SARWAR',
                            style: pw.TextStyle(
                                fontSize: 37, fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 5),
                        pw.Text(
                            'Senior Flutter Developer ',
                            style:  pw.TextStyle(fontSize: 12,fontWeight: pw.FontWeight.bold)),
                      ]),
                ),
                pw.SizedBox(height: 14),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(left: 20),
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                         pw.SizedBox(height: 20),
                            pw.Text('EDUCATION',
                        style: pw.TextStyle(
                            fontSize: 17, fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 10),
                    for (var ed in education)
                      pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(ed['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 13)),
                              pw.SizedBox(height:  3),
                    pw.Text(' ${ed['institution']}', style:  pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                             pw.SizedBox(height:  3),
                    pw.Text(ed['years'] ?? '', style: const pw.TextStyle(fontSize: 10)),
                  ]),
                ),
                        pw.SizedBox(height: 20),
                        pw.Text('Experience',
                            style: pw.TextStyle(
                                fontSize: 17, fontWeight: pw.FontWeight.bold)),
                        for (var e in experiences)
                          pw.Padding(
                            padding: const pw.EdgeInsets.only(top: 8),
                            child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(e['role'] ?? '',
                                      style: pw.TextStyle(
                                          fontWeight: pw.FontWeight.bold,
                                          fontSize: 11)),
                                  pw.Text(
                                      '  ${e['period']}',
                                      style: const pw.TextStyle(fontSize: 10)),
                                  pw.Text(e['details'] ?? '',
                                      style: const pw.TextStyle(fontSize: 10)),
                                ]),
                          ),
                      ]),
                ),
              ],
            ),
          ),
        ]);
      },
    ));

    // --- Remaining pages unchanged ---
    pw.Widget blankLeftPanel = leftPanel(showImage: false, showInfo: false);

    doc.addPage(pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.Row(children: [
            blankLeftPanel,
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

                    for (var e in experiences2)
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(e['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
                              pw.SizedBox(height:  3),
                    pw.Text(' ${e['period']}', style: const pw.TextStyle(fontSize: 10)),
                             pw.SizedBox(height:  3),
                    pw.Text(e['details'] ?? '', style: const pw.TextStyle(fontSize: 10)),
                  ]),
                ),
                
                    pw.SizedBox(height: 20),
                    pw.Text(' Skills',
                        style: pw.TextStyle(
                            fontSize: 17, fontWeight: pw.FontWeight.bold)),
                                 pw.SizedBox(height: 10),
                    for (var s in coreSkills)
                      pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 4),
                          child: pw.Text(' $s',
                              style: const pw.TextStyle(fontSize: 9))),
                  ]),
            ),
          ]);
        }));

    doc.addPage(pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.Row(children: [
            blankLeftPanel,
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('Projects',
                        style: pw.TextStyle(
                            fontSize: 14, fontWeight: pw.FontWeight.bold)),
                    for (var p in projects)
                       pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(p['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
             pw.SizedBox(height:  3),

                    pw.Text(' ${p['tag']}', style:  pw.TextStyle(fontSize: 8,fontWeight: pw.FontWeight.bold)),
                     pw.SizedBox(height:  3),
                    pw.Text(p['desc'] ?? '', style: const pw.TextStyle(fontSize: 10)),
                  ]),
                ),
                  ]),
            ),
          ]);
        }));

    doc.addPage(pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(20),
        build: (context) {
          return pw.Row(children: [
            blankLeftPanel,
            pw.SizedBox(width: 12),
            pw.Expanded(
              child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [


                     for (var P in projects2)
              
                      pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(P['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
             pw.SizedBox(height:  3),

                    pw.Text(' ${P['tag']}', style:  pw.TextStyle(fontSize: 8,fontWeight: pw.FontWeight.bold)),
                     pw.SizedBox(height:  3),
                    pw.Text(P['desc'] ?? '', style: const pw.TextStyle(fontSize: 10)),
                  ]),
                ),
                pw.SizedBox(height: 20),
                    pw.Text('References',
                        style: pw.TextStyle(
                            fontSize: 17, fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(height: 5),
                    for (var r in references)
                      pw.Padding(
                          padding: const pw.EdgeInsets.only(top: 4),
                          child: pw.Text(' $r',
                              style: const pw.TextStyle(fontSize: 10))),
                  ]),
            ),
          ]);
        }));

    return doc.save();
  }

  Future<void> _onPrintPressed() async {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => _generatePdf(format));
  }

  // ---------------------- UI ----------------------
  Widget _leftPanelUI() {
    return Container(
      width: leftPanelWidth,
      color: kLeftColor,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 46,
            backgroundImage: AssetImage('flower/ap.jpg'),
          ),
          const SizedBox(height: 12),
          const Text('ARHAM SARWAR',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Senior Flutter Developer',
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center),
          const SizedBox(height: 12),
          const Divider(color: Colors.white24),
          const SizedBox(height: 8),
          const Text('Mobile: +92 308 4695012',
              style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 4),
          const Text('Email: arham.sarwar786@gmail.com',
              style: TextStyle(color: Colors.white70)),
          const Spacer(),
          const Text('Available for freelance & full-time',
              style: TextStyle(color: Colors.white70, fontSize: 12),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _rightContentUI() {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              color: const Color(0xffEDEAEA),
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('ARHAM SARWAR',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text(
                        'Senior Flutter Developer (Backend + AI + Deployment)'),
                  ]),
            ),
            const SizedBox(height: 16),
            const Text('PROFILE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(aboutText),
            const SizedBox(height: 14),
            const Text('EMPLOYMENT HISTORY',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            for (var e in experiences)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e['role'] ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('${e['company']} • ${e['period']}',
                          style: const TextStyle(color: Colors.black54)),
                      Text(e['details'] ?? ''),
                    ]),
              ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV - Arham Sarwar'),
        backgroundColor: kLeftColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.white, foregroundColor: Colors.black),
              onPressed: _onPrintPressed,
              child: const Text('PRINT'),
            ),
          ),
        ],
      ),
      body: Row(children: [
        _leftPanelUI(),
        _rightContentUI(),
      ]),
    );
  }
}
