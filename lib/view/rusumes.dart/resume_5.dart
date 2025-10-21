// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class Resume5Page extends StatefulWidget {

//  const  Resume5Page({super.key});

//   @override
//   State<Resume5Page> createState() => _Resume5PageState();
// }

// class _Resume5PageState extends State<Resume5Page> {
//   final Color blue = const Color(0xFF134080);

//   // ---------------- PDF Generator -----------------
//   Future<Uint8List> _generatePdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(0),
//         build: (context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               // Black Header
//               pw.Container(
//                 height: 90,
//                 color: PdfColor.fromHex("#4A4A4A"),
//                 width: double.infinity,
//                 padding: const pw.EdgeInsets.symmetric(
//                   vertical: 20,
//                   horizontal: 20,
//                 ),
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text(
//                       'ARHAM SARWAR',
//                       style: pw.TextStyle(
//                         color: PdfColors.white,
//                         fontSize: 32,
//                         fontWeight: pw.FontWeight.bold,   font: 
//                       pw.Font.timesBold(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   // Sidebar
//                   pw.Container(
//                     height: 750,
//                     width: 170,
//                     color: PdfColor.fromInt(0xFF134080),
//                     padding: const pw.EdgeInsets.all(12),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.SizedBox(height: 20),
//                         _sideHeading('DETAILS'),
//                         pw.SizedBox(height: 10),
//                         pw.Text(
//                           ' +92 308 4695012\n arham.sarwar786@gmail.com\n linkedin.com/in/arham-sarwar-a1b56b176',
//                           style: pw.TextStyle(
//                             color: PdfColors.white,
//                             fontSize: 9,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.SizedBox(height: 10),
//                         pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                         pw.SizedBox(height: 10),
//                         _sideHeading('CORE QUALIFICATION'),
//                         pw.SizedBox(height: 10),
//                         pw.Text(
//                           'Flutter & Dart\nFirebase Suite\nBackend (Node, Laravel)\nState Management\nCI/CD, DevOps\nAI & ML\nDatabases\nGit & GitHub',
//                           style: pw.TextStyle(
//                             color: PdfColors.white,   font: 
//                       pw.Font.timesBold(),
//                             fontSize: 9,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.SizedBox(height: 10),
//                         pw.Divider(color: PdfColors.grey, thickness: 0.3),

//                         pw.SizedBox(height: 10),
//                         _sideHeading('LANGUAGES'),
//                         pw.SizedBox(height: 10),
//                         pw.Text(
//                           'English\nUrdu',
//                           style: pw.TextStyle(
//                             color: PdfColors.white,   font: 
//                       pw.Font.timesBold(),
//                             fontSize: 9,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.SizedBox(height: 10),
//                         pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                         pw.SizedBox(height: 10),

//                         _sideHeading('INTRESTS'),
//                         pw.SizedBox(height: 10),
//                         pw.Text(
//                           'RecreationalFootballLeague teamcaptain\nTwo-timeleaguechampions\nLocalcommunitytheatre: performedplaysandshows',
//                           style: pw.TextStyle(
//                             color: PdfColors.white,   font: 
//                       pw.Font.timesBold(),
//                             fontSize: 9,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.SizedBox(height: 10),
//                         pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                         pw.SizedBox(height: 10),
//                         _sideHeading('ADDITIONAL INFORMATION'),
//                         pw.SizedBox(height: 10),
//                         pw.Text(
//                           'Taughtlifesavingskillsand CPRclasses\nRed Cross volunteer',
//                           style: pw.TextStyle(
//                             color: PdfColors.white,   font: 
//                       pw.Font.timesBold(),
//                             fontSize: 9,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                         pw.SizedBox(height: 10),
//                         pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                         pw.SizedBox(height: 10),
//                       ],
//                     ),
//                   ),
//                   // Main body
//                   pw.Expanded(
//                     child: pw.Container(
//                       padding: const pw.EdgeInsets.all(16),
//                       child: pw.Column(
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.SizedBox(height: 10),
                         
//                           pw.Text(
//                             'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps with expertise in backend systems and AI solutions.',
//                             style: pw.TextStyle(fontSize: 10,),
//                           ),
//                               pw.SizedBox(height: 10),
//                           pw.Divider(),
//                           pw.SizedBox(height: 10),
//                           _sectionTitle('EXPERIENCE'),
//                           pw.SizedBox(height: 10),

//                           _expItem(
//                             'CTO & Flutter Developer _ Harry Chat\n',
                           
//                             'Leading Islamic app Wordbook with 10K+ downloads.\n Designed and developed core features, improving workflows and retention.',
//                           ),

//                           _expItem(
//                             'CTO & FlutterFlow Developer  \n',
                            
//                             'Developed an eBook app for users to buy and sell eBooks online with secure authentication, payment integration, and digital library management.',
//                           ),

//                           _expItem(
//                             'CTO & Flutter Developer _ IQRA Quran App\n',
                            
//                             'Led the development of the IQRA Quran App with offline access to the Holy Quran.\n Designed technical architecture ensuring scalability and user experience.',
//                           ),

//                           _expItem(
//                             'CTO & Flutter Developer _ CRO App\n',
                            
//                             'Developed a Flutter mobile app for students to find jobs.\n Built Flutter web panels for employers to post jobs and managed end-to-end deployment.',
//                           ),

//                           _expItem(
//                             'Team Lead (Flutter + Backend) _ SecureHops\n',
                            
//                             'Led Flutter team to build production apps, managed releases, reviewed architecture, and mentored developers.',
//                           ),

//                           pw.SizedBox(height: 8),
//                           pw.Divider(),
//                             pw.SizedBox(height: 8),
//                           _sectionTitle('EDUCATION'),
//                           pw.SizedBox(height: 5),
//                           _projItem(
//                             'BS Information Technology',
//                             'University of Punjab Lahore ',
//                           ),
//                           _projItem(
//                             'F.Sc Pre-Engineering',
//                             'Islamia College Lahore ',
//                           ),
//                           _projItem(
//                             'Matriculation',
//                             'Islamia High School Lahore ',
//                           ),
//                           pw.SizedBox(height: 8),
//                           //  pw.Divider(),
//                           //   pw.SizedBox(height: 8),
//                           // _sectionTitle('PROJECTS'),
//                           // pw.SizedBox(height: 5),
//                           // _projItem(
//                           //   'WirdBook',
//                           //   'Spiritual guide app for daily litanies and reminders.',
//                           // ),
//                           // _projItem(
//                           //   'IQRA Quran App',
//                           //   'Offline Quran, daily Duas, and prayer time app.',
//                           // ),
//                           // _projItem(
//                           //   'Griot Connects',
//                           //   'Marketplace app with secure checkout and user roles.',
//                           // ),
//                           // _projItem(
//                           //   'WeTeachs',
//                           //   'Learning platform where users teach and earn.',
//                           // ),
                       
//                           // _projItem(
//                           //   'Reverse Disease',
//                           //   'Health tracking app monitoring fatigue, sugar, weight, and nutrition. Built with FlutterFlow to promote healthy lifestyles.',
//                           // ),

                     
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     return pdf.save();
//   }

//   // Helper methods for PDF
//   pw.Widget _sideHeading(String text) => pw.Padding(
//     padding: const pw.EdgeInsets.only(bottom: 2),
//     child: pw.Text(
//       text,
//       style: pw.TextStyle(
//         color: PdfColors.white,
//         fontSize: 11,   font: 
//                       pw.Font.timesBold(),
//         fontWeight: pw.FontWeight.bold,
//       ),
//     ),
//   );

//   pw.Widget _sectionTitle(String text) => pw.Padding(
//     padding: const pw.EdgeInsets.only(bottom: 2),
//     child: pw.Text(
//       text,
//       style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold,   font: 
//                       pw.Font.timesBold(),),
//     ),
//   );

//   pw.Widget _expItem(String title, String desc) => pw.Padding(
//     padding: const pw.EdgeInsets.only(bottom: 3),
//     child: pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Text(
//           title,
//           style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10,   font: 
//                       pw.Font.timesBold(),),
//         ),
//         pw.SizedBox(height: 2),

//         pw.SizedBox(height: 2),

//        pw.Bullet(text: desc,style: const pw.TextStyle(fontSize: 10)),
     
//       ],
//     ),
//   );

//   pw.Widget _projItem(String title, String desc) => pw.Padding(
//     padding: const pw.EdgeInsets.only(bottom: 3),
//     child: pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Text(
//           title,
//           style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9,   font: 
//                       pw.Font.timesBold(),),
//         ),
//         pw.Text(desc, style: const pw.TextStyle(fontSize: 8)),
//       ],
//     ),
//   );

//   // ---------------- Flutter UI -----------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: blue,
//         title: const Text('Arham Sarwar - Resume'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.picture_as_pdf_outlined),
//             tooltip: 'Generate PDF',
//             onPressed: () async {
//               final pdfData = await _generatePdf();
//               await Printing.layoutPdf(onLayout: (_) => pdfData);
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           // Black header bar
//           Container(
//             color: Color(0xff4A4A4A),
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'ARHAM SARWAR',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),

//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Sidebar
//                 Container(
//                   width: 160,
//                   color: blue,
//                   padding: const EdgeInsets.all(12),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 20),
//                         Text(
//                           'DETAILS',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),

//                         SizedBox(height: 10),
//                         Text(
//                           ' +92 308 4695012\n arham.sarwar786@gmail.com\n linkedin.com/in/arham-sarwar-a1b56b176',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Divider(color: Colors.grey, thickness: 0.3),
//                         SizedBox(height: 10),
                        
//                                                 Text(
//                           'CORE QUALIFICATION',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Flutter & Dart\nFirebase Suite\nBackend (Node, Laravel)\nState Management\nCI/CD, DevOps\nAI & ML\nDatabases\nGit & GitHub',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Divider(color: Colors.grey, thickness: 0.3),

//                         SizedBox(height: 10),
//                                                Text(
//                           'LANGUAGES',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'English\nUrdu',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Divider(color: Colors.grey, thickness: 0.3),
//                         SizedBox(height: 10),

//                                                 Text(
//                           'INTRESTS',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'RecreationalFootballLeague teamcaptain\nTwo-timeleaguechampions\nLocalcommunitytheatre: performedplaysandshows',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Divider(color: Colors.grey, thickness: 0.3),
//                         SizedBox(height: 10),
//                                                 Text(
//                           'ADDITIONAL INFORMATION',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 11,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           'Taughtlifesavingskillsand CPRclasses\nRed Cross volunteer',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Divider(color: Colors.grey, thickness: 0.3),
//                         SizedBox(height: 10),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // Main Content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           'PROFILE',
//                           style: TextStyle(
//                             color: Color(0xFF134080),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps with expertise in backend systems and AI solutions.',
//                           style: TextStyle(fontSize: 11),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'EXPERIENCE',
//                           style: TextStyle(
//                             color: Color(0xFF134080),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         _ExperienceTile(
//                           title: 'CTO & Flutter Developer _ Harry Chat',
//                           date: 'Dec 2024 _ Present',
//                           desc:
//                               'Leading Islamic app “Wordbook” with 10K+ downloads. Designed and developed core features improving retention.',
//                         ),
//                         _ExperienceTile(
//                           title: 'CTO & FlutterFlow Developer _ Griot Contents',
//                           date: 'Jan 2024 _ Present',
//                           desc:
//                               'Developed eBook app for buying/selling eBooks with secure authentication and payments.',
//                         ),
//                         _ExperienceTile(
//                           title: 'Team Lead (Flutter + Backend) _ SecureHops',
//                           date: 'Jan 2023 _ Jan 2025',
//                           desc:
//                               'Led Flutter team, managed releases, and improved performance.',
//                         ),
//                         _ExperienceTile(
//                           title: 'Flutter Developer _ Salamgram',
//                           date: 'Mar 2019 _ Jan 2025',
//                           desc:
//                               'Built features for Muslim Daily App with 50K+ downloads.',
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'EDUCATION',
//                           style: TextStyle(
//                             color: Color(0xFF134080),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         _ProjectTile(
//                           title: 'BS Information Technology',
//                           desc: 'University of Punjab Lahore (2019_2023)',
//                         ),
//                         _ProjectTile(
//                           title: 'F.Sc Pre-Engineering',
//                           desc: 'Islamia College Lahore (2016_2019)',
//                         ),
//                         _ProjectTile(
//                           title: 'Matriculation',
//                           desc: 'Islamia High School Lahore (2014_2016)',
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'PROJECTS',
//                           style: TextStyle(
//                             color: Color(0xFF134080),
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         _ProjectTile(
//                           title: 'WirdBook',
//                           desc:
//                               'Spiritual guide app for daily litanies and reminders.',
//                         ),
//                         _ProjectTile(
//                           title: 'IQRA Quran App',
//                           desc:
//                               'Quranic app offering offline reading and prayer times.',
//                         ),
//                         _ProjectTile(
//                           title: 'Griot Connects',
//                           desc:
//                               'Marketplace app with secure checkout and user roles.',
//                         ),
//                         _ProjectTile(
//                           title: 'WeTeachs',
//                           desc: 'Learning platform where users teach and earn.',
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ------------------- UI Helper Widgets ---------------------
// class _ExperienceTile extends StatelessWidget {
//   final String title, date, desc;
//   const _ExperienceTile({
//     required this.title,
//     required this.date,
//     required this.desc,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//           Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
//           Text(desc, style: const TextStyle(fontSize: 11)),
//         ],
//       ),
//     );
//   }
// }

// class _ProjectTile extends StatelessWidget {
//   final String title, desc;
//   const _ProjectTile({required this.title, required this.desc});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//           ),
//           Text(desc, style: const TextStyle(fontSize: 11)),
//         ],
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';

// class Resume5Screen extends StatefulWidget {
//   const Resume5Screen({super.key});

//   @override
//   State<Resume5Screen> createState() => _Resume5ScreenState();
// }

// class _Resume5ScreenState extends State<Resume5Screen> {
//   final String nameLine1 = 'Arham Sarwar';

//   final String title = 'Flutter Developer | Backend Engineer';

//   final String about =
//       'Experienced Flutter and Backend developer with expertise in designing, developing, and maintaining scalable applications. Focused on delivering high-quality mobile and web solutions with clean architecture and efficient APIs.';

//   final List<String> coreSkills = [
//     'Flutter Development',
//     'Backend (Node.js, Firebase)',
//     'RESTful APIs',
//     'UI/UX Design',
//     'Version Control (Git)',
//     'App Deployment',
//   ];
//   final List<String> languages = ['English', 'Urdu'];

//   final List<String> AI = [
//     '.Taughtlifesavingskillsand CPRclasses',
//     'Red Cross volunteer',
//   ];
//    final List<String> intrests = [
//     'RecreationalFootballLeague teamcaptain'

//     '\nTwo-timeleaguechampions'
//     '\nLocalcommunitytheatre: performedplaysandshows'
//   ];
//   final education = [
//   {
//     'degree': 'Bachelor of Science in Computer Science (BSCS)',
//     'institution': 'University of Central Punjab (UCP)',
//     'period': '2019 - 2023',
//     'details': [
//       'Graduated with strong academic standing and practical expertise in Flutter and backend development.',
//       'Completed final year project focused on cross-platform app development using Flutter and Firebase.',
//       'Actively participated in coding competitions, software exhibitions, and tech events.'
//     ]
//   },
//   {
//     'degree': 'Intermediate in Pre-Engineering',
//     'institution': 'Punjab Group of Colleges, Lahore',
//     'period': '2017 - 2019',
//     'details': [
//       'Focused on mathematics and computer science foundations.',
//       'Built a strong analytical and problem-solving base that contributed to software development skills.'
//     ]
//   },
//   {
//     'degree': 'Matriculation (Science)',
//     'institution': 'Divisional Public School (DPS), Lahore',
//     'period': '2015 - 2017',
//     'details': [
//       'Completed secondary education with distinction.',
//       'Demonstrated early interest in technology and programming.'
//     ]
//   }
// ];

//   final List<Map<String, dynamic>> experience = [
//     {
//       'role':
//           'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'Securehops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'bullets': [
//         'Developed cross-platform mobile apps using Flutter and Firebase.',
//         'Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications.',
//         'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
//         'Mentored junior developers and delivered high-quality solutions.',
//       ],
//     },
//     {
//       'role': 'Team Lead (Flutter + Backend) [Promoted]',
//       'company': 'Securehops | www.securehops.com',
//       'period': 'Jan 2023 - Jan 2025',
//       'bullets': [
//         'Developed cross-platform mobile apps using Flutter and Firebase.',
//         'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
//         'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
//         'Led team of developers and guided architecture decisions.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter Developer + Backend (Promoted)',
//       'company': 'Securehops | www.securehops.com',
//       'period': 'July 2022 - Jan 2025',
//       'bullets': [
//         'Developed mobile apps using Flutter and Firebase.',
//         'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
//         'Implemented CI/CD pipelines and deployments (AWS/GCP).',
//         'Delivered scalable solutions and mentored junior developers.',
//       ],
//     },
//     {
//       'role': 'Flutter Developer Salamyarniq',

//       'period': 'Mar 2019 - Jan 2025',
//       'bullets': [
//         'Contributed to the success of Salamly: Muslim Daily App with 50k+ downloads.',
//         'Developed features for daily Qur’an, prayer times, and Islamic tools.',
//         'Enhanced app performance by optimizing backend communication.',
//       ],
//     },
//     {
//       'role': 'Flutter Developer Fiverr | Upwork',

//       'period': 'April 2020 - Sept 2022',
//       'bullets': [
//         'Worked as a Freelance Flutter Developer delivering high-quality Flutter and backend solutions.',
//         'Completed strong projects with smooth delivery and stable client satisfaction.',
//         'Maintained a strong reputation with clean communication and technical delivery.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter Developer Digital Khata',
//       'period': 'Mar 2022 - Dec 2022',
//       'bullets': [
//         'Developed a responsive digital marketplace for online stores.',
//         'Integrated Firebase backend and real-time database.',
//         'Improved app performance by 40% using state management and caching.',
//       ],
//     },
//     {
//       'role': 'CTO & Flutter Developer Student Jobs',
//       'period': 'Present',
//       'bullets': [
//         'Developed a Flutter mobile app for students to find jobs.',
//         'Built Flutter web and admin panels for employers to post jobs and manage features.',
//         'Managed end-to-end deployment and platform scalability.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter Developer DoPyMe',
//       'period': 'Present',
//       'bullets': [
//         'Developed the Amazing eCommerce app with seamless product browsing and purchasing features.',
//         'Built a scalable Flutter solution ensuring smooth UI/UX and secure transactions.',
//         'Contributed to the end-to-end development and deployment of the app.',
//       ],
//     },
//   ];
//   final List<Map<String, dynamic>> experience2 = [
//     {
//       'role': 'Flutter Developer WeeDoot',

//       'period': 'Sept 2024 - Dec 2024',
//       'bullets': [
//         'Delivered high-quality Flutter solutions with strong technical expertise.',
//         'Applied leadership skills to manage project teams effectively.',
//         'Recognized for innovative ideas and advanced development approaches.',
//       ],
//     },
//     {
//       'role': 'Flutter Developer Umaging',
//       'period': 'Aug 2021 - Feb 2022',
//       'bullets': [
//         'Built a smooth and visually appealing e-commerce mobile app.',
//         'Integrated secure payment gateways and real-time inventory updates.',
//         'Implemented RESTful APIs and product filtering features.',
//         'Collaborated with QA team for performance testing and bug fixes.',
//       ],
//     },
//     {
//       'role': 'Flutter Developer WeeDoot',

//       'period': 'Dec 2024 - Present',
//       'bullets': [
//         'Built and launched an app with 5k+ downloads and a 12+ content rating.',
//         'Developed learning modules and improved user engagement.',
//         'Built features for helping users polish skills and gain knowledge.',
//       ],
//     },
//     {
//       'role': 'CTO & Flutter Developer Harry Clark',

//       'period': 'Dec 2024 - Present',
//       'bullets': [
//         'Working as CTO & Senior Flutter Developer for Islamic App: Wordibook.',
//         'Led development for 10,000+ downloads ensuring scalability and retention.',
//         'Architected cloud-based infrastructure and improved overall performance.',
//       ],
//     },
//     {
//       'role': 'CTO & FlutterFlow Developer Grob Contents',

//       'period': 'Present',
//       'bullets': [
//         'Developed mobile app for users to buy and sell eBooks online.',
//         'Implemented secure authentication, payment integration, and digital library management.',
//         'Built scalable backend services to support growing content needs.',
//       ],
//     },
//     {
//       'role': 'CTO & Flutter Developer IQRA Quran App',

//       'period': 'Present',
//       'bullets': [
//         'Led development of the IQRA Quran App with offline Quran access.',
//         'Designed and deployed secure backend systems with modern UI/UX.',
//         'Delivered a complete Islamic experience for reading, learning, and listening to Qur’an.',
//       ],
//     },
//     {
//       'role': 'CTO & Flutter Developer Jobie App',

//       'period': 'Present',
//       'bullets': [
//         'Developed a Flutter mobile app for students to find jobs.',
//         'Built Flutter web portal for employers and admins.',
//         'Managed end-to-end deployment and release processes.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter & Backend Developer OnPiO',

//       'period': 'Present',
//       'bullets': [
//         'Built a secure all-in-one platform with chat, storage, jobs, and payments.',
//         'Developed Flutter mobile app and NestJS backend.',
//         'Ensured seamless authentication and cloud scalability.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter Developer OnDev',

//       'period': 'Present',
//       'bullets': [
//         'Developed an amazing eCommerce app with seamless product browsing.',
//         'Built a scalable Flutter solution ensuring smooth UI/UX.',
//         'Delivered end-to-end solution for deployment of the app.',
//       ],
//     },
//     {
//       'role': 'Senior Flutter Developer NubesSIM',

//       'period': 'Present',
//       'bullets': [
//         'Developed the Nubes app for online eSIM purchase and activation.',
//         'Implemented secure transactions and account management features.',
//         'Delivered a reliable Flutter solution enabling worldwide connectivity.',
//       ],
//     },
//   ];

//   final List<Map<String, String>> projects = [
//     {
//       'title': 'Sendorsta',
//       'subtitle':
//           'A dedicated parent-care app providing guidance, education, and empowerment for families with special needs children.',
//     },
//     {
//       'title': 'Griot Connects',
//       'subtitle':
//           'An online platform to sell and purchase eBooks with ease, featuring in-app chat, analytics, and secure payments.',
//     },
//     {
//       'title': 'CircleUp',
//       'subtitle':
//           'Empowers students with employment opportunities and skill programs via real-time analytics and automated matching.',
//     },
//     {
//       'title': 'OnFekwa',
//       'subtitle':
//           'A mobile app designed to help users discover the best restaurants nearby with live menus, booking, and location services.',
//     },
//     {
//       'title': 'Hikary',
//       'subtitle':
//           'A social networking app allowing users to share updates, interact with friends, and discover trending topics.',
//     },
//     {
//       'title': 'YobleLamea',
//       'subtitle':
//           'A driving-hub app connecting customers with drivers for rides, deliveries, and corporate transport.',
//     },
//     {
//       'title': 'Muttaqi Quran App',
//       'subtitle':
//           'An Islamic app featuring Quran recitation, tafseer, and prayer timings with a spiritual and modern experience.',
//     },
//     {
//       'title': 'Bissi Player',
//       'subtitle':
//           'A media streaming app enabling users to watch Islamic content with AI-based recommendations.',
//     },
//     {
//       'title': 'Kamaee',
//       'subtitle':
//           'A job-platform marketplace connecting businesses and professionals through AI-driven hiring tools.',
//     },
//     {
//       'title': 'WirdBook',
//       'subtitle':
//           'A spiritual guide app for daily Islamic readings, duas, and progress tracking.',
//     },
//     {
//       'title': 'WeTeachs',
//       'subtitle':
//           'An e-learning app enabling schools and parents to manage lessons and student progress effectively.',
//     },
//     {
//       'title': 'Nubes App',
//       'subtitle':
//           'An eSIM management app offering secure purchases, activation, and global usage tracking.',
//     },
//     {
//       'title': 'OnPilo',
//       'subtitle':
//           'A seamless e-commerce app providing subscription and product purchase services worldwide.',
//     },
//     {
//       'title': 'Umazing',
//       'subtitle':
//           'A full-fledged e-commerce app providing users with a clean UI, secure payments, and smooth checkout experience.',
//     },
//     {
//       'title': 'Visual Fraction Calculator',
//       'subtitle':
//           'An educational math app designed to help students learn and visualize fractions easily.',
//     },
//     {
//       'title': 'Rafael',
//       'subtitle':
//           'A management app for small organizations to streamline tasks and improve productivity.',
//     },
//     {
//       'title': 'PizzaPlay',
//       'subtitle':
//           'A restaurant ordering app allowing users to order and track pizzas from local vendors in real-time.',
//     },
//     {
//       'title': 'FAMS',
//       'subtitle':
//           'A field activity management system for monitoring teams and tracking daily field operations.',
//     },
//     {
//       'title': 'BargainX',
//       'subtitle':
//           'A buying-and-selling platform for a diverse range of categories, offering secure payments and easy listings.',
//     },
//     {
//       'title': 'Salamy',
//       'subtitle':
//           'An Islamic app for Quran reading, salat timings, and community engagement.',
//     },
//     {
//       'title': 'ohReady',
//       'subtitle':
//           'A food delivery app offering nearby restaurants, menu browsing, and real-time order tracking.',
//     },
//     {
//       'title': 'InstaCalm Anxiety',
//       'subtitle':
//           'An anxiety treatment app created by a US-based therapist, providing CBT sessions and mindfulness tools.',
//     },
//     {
//       'title': 'Funky',
//       'subtitle':
//           'A music and social app enabling creators to upload, share, and monetize their original tracks.',
//     },
//     {
//       'title': 'Roshi Career',
//       'subtitle':
//           'A recruitment app allowing users to build CVs and find job opportunities easily.',
//     },
//     {
//       'title': 'ohReady Admin',
//       'subtitle':
//           'The admin panel of the ohReady food delivery app for managing orders and drivers.',
//     },
//     {
//       'title': 'Fittech',
//       'subtitle':
//           'A fitness app for athletes and trainers to monitor workouts, track performance, and share progress.',
//     },
//     {
//       'title': 'Ping',
//       'subtitle':
//           'A social app facilitating local friendships and networking using real-time geolocation.',
//     },
//     {
//       'title': 'AirTomeRestaurant',
//       'subtitle':
//           'A restaurant application enabling table reservations and digital menu browsing.',
//     },
//     {
//       'title': 'IQRA Quran App',
//       'subtitle':
//           'A digital Quran app offering tafseer, prayer timings, Islamic content, and offline access.',
//     },
//     {
//       'title': 'Reverse Disease',
//       'subtitle':
//           'A health-tracking app focusing on improving diet, sleep, and fitness for long-term wellness.',
//     },
//     {
//       'title': 'Amici',
//       'subtitle':
//           'An event-booking app simplifying reservations and guest management.',
//     },
//     {
//       'title': 'United Proposal',
//       'subtitle':
//           'A matchmaking app designed for proposals and long-term relationships with secure chat features.',
//     },
//     {
//       'title': 'PricePro',
//       'subtitle':
//           'A product comparison app showing price variations across multiple stores.',
//     },
//     {
//       'title': 'MyCash',
//       'subtitle':
//           'A personal finance app designed to track income, expenses, and budgeting efficiently.',
//     },
//     {
//       'title': 'Flavourz Restaurant',
//       'subtitle':
//           'An online restaurant ordering app with real-time tracking and reviews.',
//     },
//     {
//       'title': 'Tritt',
//       'subtitle':
//           'A social chat app similar to TrueCaller, integrating messaging and contact management.',
//     },
//     {
//       'title': 'LockSmith Guru',
//       'subtitle':
//           'An app for locksmiths to manage jobs, clients, and payments in one place.',
//     },
//     {
//       'title': 'EkCabFare',
//       'subtitle':
//           'A taxi-booking app connecting users with nearby drivers and providing instant fare estimates.',
//     },
//     {
//       'title': 'Certainli.se',
//       'subtitle':
//           'A web platform specializing in modern electronic components and product lifecycle management.',
//     },
//     {
//       'title': 'FemClinic',
//       'subtitle':
//           'A healthcare platform providing hormone and reproductive health consultations for women.',
//     },
//     {
//       'title': 'Globe',
//       'subtitle':
//           'A global MCO website offering user interaction results in data visualization and impact analysis.',
//     },
//     {
//       'title': 'Globe Deployment',
//       'subtitle':
//           'A deployment version of the Globe website for managing user analytics and scalability.',
//     },
//     {
//       'title': 'Hp Appen',
//       'subtitle':
//           'An MCO web platform designed for efficient management and professional collaboration.',
//     },
//     {
//       'title': 'Hp Appen Production',
//       'subtitle':
//           'A production version of the Hp Appen platform focused on live deployment and optimization.',
//     },
//   ];

//   final List<Map<String, String>> projects2 = [
//     {
//       'title': 'Salamy',
//       'subtitle':
//           'An Islamic app for Quran reading, salat timings, and community engagement.',
//     },
//     {
//       'title': 'ohReady',
//       'subtitle':
//           'A food delivery app offering nearby restaurants, menu browsing, and real-time order tracking.',
//     },
//     {
//       'title': 'InstaCalm Anxiety',
//       'subtitle':
//           'An anxiety treatment app created by a US-based therapist, providing CBT sessions and mindfulness tools.',
//     },
//     {
//       'title': 'Funky',
//       'subtitle':
//           'A music and social app enabling creators to upload, share, and monetize their original tracks.',
//     },
//     {
//       'title': 'Roshi Career',
//       'subtitle':
//           'A recruitment app allowing users to build CVs and find job opportunities easily.',
//     },
//     {
//       'title': 'ohReady Admin',
//       'subtitle':
//           'The admin panel of the ohReady food delivery app for managing orders and drivers.',
//     },
//     {
//       'title': 'Fittech',
//       'subtitle':
//           'A fitness app for athletes and trainers to monitor workouts, track performance, and share progress.',
//     },
//     {
//       'title': 'Ping',
//       'subtitle':
//           'A social app facilitating local friendships and networking using real-time geolocation.',
//     },
//     {
//       'title': 'AirTomeRestaurant',
//       'subtitle':
//           'A restaurant application enabling table reservations and digital menu browsing.',
//     },
//     {
//       'title': 'IQRA Quran App',
//       'subtitle':
//           'A digital Quran app offering tafseer, prayer timings, Islamic content, and offline access.',
//     },
//     {
//       'title': 'Reverse Disease',
//       'subtitle':
//           'A health-tracking app focusing on improving diet, sleep, and fitness for long-term wellness.',
//     },
//     {
//       'title': 'Amici',
//       'subtitle':
//           'An event-booking app simplifying reservations and guest management.',
//     },
//     {
//       'title': 'United Proposal',
//       'subtitle':
//           'A matchmaking app designed for proposals and long-term relationships with secure chat features.',
//     },
//     {
//       'title': 'PricePro',
//       'subtitle':
//           'A product comparison app showing price variations across multiple stores.',
//     },
//     {
//       'title': 'MyCash',
//       'subtitle':
//           'A personal finance app designed to track income, expenses, and budgeting efficiently.',
//     },
//     {
//       'title': 'Flavourz Restaurant',
//       'subtitle':
//           'An online restaurant ordering app with real-time tracking and reviews.',
//     },
//     {
//       'title': 'Tritt',
//       'subtitle':
//           'A social chat app similar to TrueCaller, integrating messaging and contact management.',
//     },
//     {
//       'title': 'LockSmith Guru',
//       'subtitle':
//           'An app for locksmiths to manage jobs, clients, and payments in one place.',
//     },
//     {
//       'title': 'EkCabFare',
//       'subtitle':
//           'A taxi-booking app connecting users with nearby drivers and providing instant fare estimates.',
//     },
//     {
//       'title': 'Certainli.se',
//       'subtitle':
//           'A web platform specializing in modern electronic components and product lifecycle management.',
//     },
//     {
//       'title': 'FemClinic',
//       'subtitle':
//           'A healthcare platform providing hormone and reproductive health consultations for women.',
//     },
//     {
//       'title': 'Globe',
//       'subtitle':
//           'A global MCO website offering user interaction results in data visualization and impact analysis.',
//     },
//     {
//       'title': 'Globe Deployment',
//       'subtitle':
//           'A deployment version of the Globe website for managing user analytics and scalability.',
//     },
//     {
//       'title': 'Hp Appen',
//       'subtitle':
//           'An MCO web platform designed for efficient management and professional collaboration.',
//     },
//     {
//       'title': 'Hp Appen Production',
//       'subtitle':
//           'A production version of the Hp Appen platform focused on live deployment and optimization.',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: Column(
//         children: [
//           // 🔹 Top Black Header
//           Container(
//             height: 100,
//             width: double.infinity,
//             color: Color(0xff4A4A4A),
//             padding: const EdgeInsets.symmetric(vertical: 24),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   nameLine1,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Expanded(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // 🔵 Sidebar (Blue)
//                 Container(
//                   width: 200,
//                   color: const Color(0xff134080),
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'CONTACT',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       const Text(
//                         '+92 308 4695012\narhamsarwar786@gmail.com',
//                         style: TextStyle(color: Colors.white70, fontSize: 12),
//                       ),
//                       const Divider(color: Colors.white70),
//                       const Text(
//                         'CORE SKILLS',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       ...coreSkills.map(
//                         (s) => Padding(
//                           padding: const EdgeInsets.only(bottom: 4),
//                           child: Text(
//                             '• $s',
//                             style: const TextStyle(
//                               color: Colors.white70,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // ⚪ Right side content
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'ABOUT',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(about),
//                           const SizedBox(height: 14),
//                           const Text(
//                             'EXPERIENCE',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           ...experience.map(
//                             (exp) => Padding(
//                               padding: const EdgeInsets.only(
//                                 bottom: 10,
//                                 top: 4,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     exp['role']!,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   Text(
//                                     '${exp['company']} (${exp['period']})',
//                                     style: const TextStyle(fontSize: 12),
//                                   ),
//                                   const SizedBox(height: 4),
//                                   ...((exp['bullets'] as List<String>).map(
//                                     (b) => Text(
//                                       '• $b',
//                                       style: const TextStyle(fontSize: 12),
//                                     ),
//                                   )),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           const Text(
//                             'PROJECTS',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           ...projects.map(
//                             (p) => Padding(
//                               padding: const EdgeInsets.only(bottom: 6, top: 2),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     p['title']!,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                   Text(
//                                     p['subtitle']!,
//                                     style: const TextStyle(fontSize: 12),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // 🔘 Generate PDF Button
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: ElevatedButton(
//               onPressed: _createPdfAndPrint,
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//               child: const Text(
//                 'Generate PDF',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ PDF GENERATION

//   Future<void> _createPdfAndPrint() async {
//     final pdf = pw.Document();

//     final pw.Font ttf = await PdfGoogleFonts.openSansRegular();
//     final pw.Font ttfBold = await PdfGoogleFonts.openSansBold();

//     // 🔹 Sidebar Builder
//     pw.Widget buildSidebar({bool includeInfo = false}) {
//       return pw.Container(
//         width: 170,
//         color: PdfColor.fromHex('#134080'),
//         padding: const pw.EdgeInsets.all(12),
//         child: includeInfo
//             ? pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.SizedBox(height: 20),
//                   pw.Text(
//                     'CONTACT',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 11,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 10),
//                   pw.Text(
//                     ' Lahore,Pakistan\n+92 308 4695012\narhamsarwar786@gmail.com',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 9,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 15),
//                   pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                   pw.SizedBox(height: 15),
//                   pw.Text(
//                     'CORE QUALIFICATION',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 11,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 4),
//                   ...coreSkills.map(
//                     (s) => pw.Padding(
//                       padding: const pw.EdgeInsets.only(bottom: 2),
//                       child: pw.Text(
//                         '• $s',
//                         style: pw.TextStyle(
//                           font: ttfBold,
//                           fontSize: 9,
//                           color: PdfColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   pw.SizedBox(height: 10),

//                   pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                   pw.SizedBox(height: 15),
//                   pw.Text(
//                     'LANGUAGES',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 11,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 5),

//                   ...languages.map(
//                     (s) => pw.Padding(
//                       padding: const pw.EdgeInsets.only(bottom: 2),
//                       child: pw.Text(
//                         '• $s',
//                         style: pw.TextStyle(
//                           font: ttfBold,
//                           fontSize: 9,
//                           color: PdfColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   pw.SizedBox(height: 10),

//                   pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                   pw.SizedBox(height: 15),
//                   pw.Text(
//                     'ADDITIONAL INFORMATION',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 11,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 5),

//                   ...AI.map(
//                     (s) => pw.Padding(
//                       padding: const pw.EdgeInsets.only(bottom: 2),
//                       child: pw.Text(
//                         '• $s',
//                         style: pw.TextStyle(
//                           font: ttfBold,
//                           fontSize: 9,
//                           color: PdfColors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                     pw.SizedBox(height: 10),
//                                     pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                   pw.SizedBox(height: 15),
//                   pw.Text(
//                     'INTRESTS',
//                     style: pw.TextStyle(
//                       font: ttfBold,
//                       fontSize: 11,
//                       color: PdfColors.white,
//                     ),
//                   ),
//                   pw.SizedBox(height: 4),
//                   ...intrests.map(
//                     (s) => pw.Padding(
//                       padding: const pw.EdgeInsets.only(bottom: 2),
//                       child: pw.Text(
//                         '• $s',
//                         style: pw.TextStyle(
//                           font: ttfBold,
//                           fontSize: 9,
//                           color: PdfColors.white,
//                         ),
//                       ),
//                     ),),
//                       pw.SizedBox(height: 10),
//                      pw.Divider(color: PdfColors.grey, thickness: 0.3),
//                 ],
//               )
//             : pw.Container(), // Empty but keeps same structure
//       );
//     }

//     // 🔹 Header Builder (only for Page 1)
//     pw.Widget buildHeader() {
//       return pw.Container(
//         height: 100,
//         width: double.infinity,
//         color: PdfColor.fromHex("#4A4A4A"),
//         padding: const pw.EdgeInsets.symmetric(vertical: 20,horizontal: 23),
//         child: pw.Column(
//           mainAxisAlignment: pw.MainAxisAlignment.start,
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.SizedBox(width: 20),
//             pw.Text(
//               nameLine1,
//               style: pw.TextStyle(
//                 font: ttfBold,
//                 fontSize: 37,
//                 color: PdfColors.white,
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     // 🔹 Page Layout Builder
//     pw.Widget buildPage({
//       required pw.Widget content,
//       bool showHeader = true,
//       bool includeInfo = true,
//     }) {
//       return pw.Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: pw.Column(
//           children: [
//             if (showHeader) buildHeader(),
//             pw.Expanded(
//               child: pw.Row(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   buildSidebar(includeInfo: includeInfo),
//                   pw.SizedBox(width: 12),
//                   pw.Expanded(child: content),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     // 🔸 PAGE 1 (Header + Full Sidebar)
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: pw.EdgeInsets.zero, // ensure full width usage
//         build: (context) => buildPage(
//           showHeader: true,
//           includeInfo: true,
//           content: pw.Padding(
//             padding: const pw.EdgeInsets.all(12),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [

//                 pw.SizedBox(height: 6),
//                 pw.Text(about, style: pw.TextStyle(font: ttf, fontSize: 10)),
//                 pw.SizedBox(height: 10),
//                 pw.Text(
//                   'EXPERIENCE',
//                   style: pw.TextStyle(font: ttfBold, fontSize: 15),
//                 ),
//                 pw.SizedBox(height: 6),
//                 ...experience.map(
//                   (exp) => pw.Padding(
//                     padding: const pw.EdgeInsets.only(bottom: 6),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           exp['role']!,
//                           style: pw.TextStyle(font: ttfBold, fontSize: 11),
//                         ),
//                         pw.Text(
//                           ' (${exp['period']})',
//                           style: pw.TextStyle(fontSize: 9, font: ttfBold),
//                         ),
//                         ...((exp['bullets'] as List<String>).map(
//                           (b) => pw.Text(
//                             '• $b',
//                             style: pw.TextStyle(font: ttf, fontSize: 9),
//                           ),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//     // 🔸 PAGE 2 (NO header, EMPTY Sidebar — but same layout)
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: pw.EdgeInsets.zero,
//         build: (context) => buildPage(
//           showHeader: false, // No black header
//           includeInfo: false, // Sidebar same but empty
//           content: pw.Padding(
//             padding: const pw.EdgeInsets.all(12),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 ...experience2.map(
//                   (exp2) => pw.Padding(
//                     padding: const pw.EdgeInsets.only(bottom: 6),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           exp2['role']!,
//                           style: pw.TextStyle(font: ttfBold, fontSize: 11),
//                         ),
//                         pw.Text(
//                           ' (${exp2['period']})',
//                           style: pw.TextStyle(font: ttfBold, fontSize: 9),
//                         ),
//                         ...((exp2['bullets'] as List<String>).map(
//                           (b) => pw.Text(
//                             '• $b',
//                             style: pw.TextStyle(font: ttf, fontSize: 9),
//                           ),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );

//     // page 3
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: pw.EdgeInsets.zero,
//         build: (context) => buildPage(
//           showHeader: false, // No black header
//           includeInfo: false, // Sidebar same but empty
//           content: pw.Padding(
//             padding: const pw.EdgeInsets.all(12),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 // 🔸 PROJECTS Section
//                 pw.Text(
//                   'PROJECTS',
//                   style: pw.TextStyle(font: ttfBold, fontSize: 15),
//                 ),
//                 pw.SizedBox(height: 6),
//                 ...projects.map(
//                   (p) => pw.Padding(
//                     padding: const pw.EdgeInsets.only(bottom: 4),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           p['title']!,
//                           style: pw.TextStyle(font: ttfBold, fontSize: 11),
//                         ),
//                         pw.Text(
//                           p['subtitle']!,
//                           style: pw.TextStyle(font: ttf, fontSize: 9),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     // page 4
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: pw.EdgeInsets.zero,
//         build: (context) => buildPage(
//           showHeader: false, // No black header
//           includeInfo: false, // Sidebar same but empty
//           content: pw.Padding(
//             padding: const pw.EdgeInsets.all(12),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 // 🔸 PROJECTS Section
//                 ...projects2.map(
//                   (p) => pw.Padding(
//                     padding: const pw.EdgeInsets.only(bottom: 4),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           p['title']!,
//                           style: pw.TextStyle(font: ttfBold, fontSize: 11),
//                         ),
//                         pw.Text(
//                           p['subtitle']!,
//                           style: pw.TextStyle(font: ttf, fontSize: 9),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     // page 5
//        pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: pw.EdgeInsets.zero,
//         build: (context) => buildPage(
//           showHeader: false, // No black header
//           includeInfo: false, // Sidebar same but empty
//           content: pw.Padding(
//             padding: const pw.EdgeInsets.all(12),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                                 pw.Text(
//                   'EDUCATION',
//                   style: pw.TextStyle(font: ttfBold, fontSize: 15),
//                 ),
//                 pw.SizedBox(height: 6),
//                 ...education.map(
//                   (edu) => pw.Padding(
//                     padding: const pw.EdgeInsets.only(bottom: 6),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         pw.Text(
//                           ' (${edu['degree']})',
//                           style: pw.TextStyle(fontSize: 9, font: ttfBold),
//                         ),
//                                                 pw.Text(
//                           ' (${edu['institution']})',
//                           style: pw.TextStyle(fontSize: 9, font: ttfBold),
//                         ),                       pw.Text(
//                           ' (${edu['period']})',
//                           style: pw.TextStyle(fontSize: 9, font: ttf),
//                         ),
//                         ...((edu['details'] as List<String>).map(
//                           (b) => pw.Text(
//                             '• $b',
//                             style: pw.TextStyle(font: ttf, fontSize: 9),
//                           ),
//                         )),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],

//                 // 🔸 PROJECTS Section

//             ),
//           ),
//         ),
//       ),
//     );

//     await Printing.layoutPdf(onLayout: (format) => pdf.save());
//   }
// }

import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class Resume5Page extends StatefulWidget {
  const Resume5Page({super.key});

  @override
  State<Resume5Page> createState() => _Resume5PageState();
}

class _Resume5PageState extends State<Resume5Page> {
  final String nameLine1 = 'Arham Sarwar';

  final String title = 'Flutter Developer | Backend Engineer';

  final String about =
      'Experienced Flutter and Backend developer with expertise in designing, developing, and maintaining scalable applications. Focused on delivering high-quality mobile and web solutions with clean architecture and efficient APIs.';

  final List<String> coreSkills = [
    'Flutter Development',
    'Backend (Node.js, Firebase)',
    'RESTful APIs',
    'UI/UX Design',
    'Version Control (Git)',
    'App Deployment',
  ];
  final List<String> languages = ['English', 'Urdu'];

  final List<String> AI = ['Taught life saving skills ', 'Red Cross volunteer'];

  final List<String> intrests = [
    ' Football team captain ',
    // 'Two-time league champions'
  ];

  final education = [
    {
      'degree': 'Bachelor of Science in Computer Science (BSCS)',
      'institution': 'University of Central Punjab (UCP)',
      'period': '2019 - 2023',
      'details': [
        'Graduated with strong academic standing and practical expertise in Flutter .',
       
      ],
    },
    {
      'degree': 'Intermediate in Pre-Engineering',
      'institution': 'Punjab Group of Colleges, Lahore',
      'period': '2017 - 2019',
      'details': [
        'Focused on mathematics and computer science foundations.',
        
      ],
    },
    {
      'degree': 'Matriculation (Science)',
      'institution': 'Divisional Public School (DPS), Lahore',
      'period': '2015 - 2017',
      'details': [
        'Completed secondary education with distinction.',
        
      ],
    },
  ];

  final List<Map<String, dynamic>> experience = [
    {
      'role':
          'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
      'company': 'Securehops | www.securehops.com',
      'period': 'Sept 2023 - Jan 2025',
      'bullets': [
        'Developed cross-platform mobile apps using Flutter and Firebase.',
        'Integrated and developed backend APIs  for scalable applications.',
        'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
        'Mentored junior developers and delivered high-quality solutions.',
      ],
    },
    {
      'role': 'Team Lead (Flutter + Backend) [Promoted]',
      'company': 'Securehops | www.securehops.com',
      'period': 'Jan 2023 - Jan 2025',
      'bullets': [
        'Developed cross-platform mobile apps using Flutter and Firebase.',
        'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
        'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
        'Led team of developers and guided architecture decisions.',
      ],
    },
    {
      'role': 'Senior Flutter Developer + Backend (Promoted)',
      'company': 'Securehops | www.securehops.com',
      'period': 'July 2022 - Jan 2025',
      'bullets': [
        'Developed mobile apps using Flutter and Firebase.',
        'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
        'Implemented CI/CD pipelines and deployments (AWS/GCP).',
        'Delivered scalable solutions and mentored junior developers.',
      ],
    },
    // {
    //   'role': 'Flutter Developer Salamyarniq',

    //   'period': 'Mar 2019 - Jan 2025',
    //   'bullets': [
    //     'Contributed to the success of Salamly: Muslim Daily App with 50k+ downloads.',
    //     'Developed features for daily Qur’an, prayer times, and Islamic tools.',
    //     'Enhanced app performance by optimizing backend communication.',
    //   ],
    // },
    {
      'role': 'Flutter Developer Fiverr | Upwork',

      'period': 'April 2020 - Sept 2022',
      'bullets': [
        'Worked as a Freelance Flutter Developer delivering Flutter and backend solutions.',
        'Completed strong projects with smooth delivery and stable client satisfaction.',
        'Maintained a strong reputation with clean communication and technical delivery.',
      ],
    },
    // {
    //   'role': 'Senior Flutter Developer Digital Khata',
    //   'period': 'Mar 2022 - Dec 2022',
    //   'bullets': [
    //     'Developed a responsive digital marketplace for online stores.',
    //     'Integrated Firebase backend and real-time database.',
    //     'Improved app performance by 40% using state management and caching.',
    //   ],
    // },
    // {
    //   'role': 'CTO & Flutter Developer Student Jobs',
    //   'period': 'Present',
    //   'bullets': [
    //     'Developed a Flutter mobile app for students to find jobs.',
    //     'Built Flutter web and admin panels for employers to post jobs and manage features.',
    //     'Managed end-to-end deployment and platform scalability.',
    //   ],
    // },
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // 🔹 Top Black Header
          Container(
            height: 100,
            width: double.infinity,
            color: Color(0xff4A4A4A),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameLine1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔵 Sidebar (Blue)
                Container(
                  width: 200,
                  color: const Color(0xff134080),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CONTACT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '+92 308 4695012\narhamsarwar786@gmail.com',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const Divider(color: Colors.white70),
                      const Text(
                        'CORE SKILLS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...coreSkills.map(
                        (s) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            '• $s',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ⚪ Right side content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ABOUT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(about),
                          const SizedBox(height: 14),
                          const Text(
                            'EXPERIENCE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                          ...experience.map(
                            (exp) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                top: 4,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exp['role']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '${exp['company']} (${exp['period']})',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(height: 4),
                                  ...((exp['bullets'] as List<String>).map(
                                    (b) => Text(
                                      '• $b',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'PROJECTS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 6),
                        
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔘 Generate PDF Button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: _createPdfAndPrint,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: const Text(
                'Generate PDF',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  


  Future<void> _createPdfAndPrint() async {
    final pdf = pw.Document();

    final pw.Font ttf = await PdfGoogleFonts.openSansRegular();
    final pw.Font ttfBold = await PdfGoogleFonts.openSansBold();

    // 🔹 Sidebar Builder (Blue Area)
    pw.Widget buildSidebar({bool includeInfo = false}) {
      return pw.Container(
        width: 200,
        color: PdfColor.fromHex('#134080'),
        padding: const pw.EdgeInsets.all(20),
        child: includeInfo
            ? pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 20),
                  pw.Text(
                    'CONTACT',
                    style: pw.TextStyle(
                      font: pw.Font.timesBoldItalic(),
                      fontSize: 11,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    'Lahore, Pakistan\n+92 308 4695012\narhamsarwar786@gmail.com',
                    style: pw.TextStyle(
                      font: pw.Font.timesBoldItalic(),
                      fontSize: 9,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 15),
                  pw.Divider(color: PdfColors.grey, thickness: 0.3),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    'CORE QUALIFICATION',
                    style: pw.TextStyle(
                      font: pw.Font.timesBoldItalic(),
                      fontSize: 11,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  ...coreSkills.map(
                    (s) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 2),
                      child: pw.Row(
                        children: [
                          pw.Text(
                            '• ',
                            style: pw.TextStyle(
                              font: ttfBold,
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                          pw.Text(
                            '$s',
                            style: pw.TextStyle(
                              font: pw.Font.timesBoldItalic(),
                              fontSize: 8,
                              color: PdfColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(color: PdfColors.grey, thickness: 0.3),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    'LANGUAGES',
                    style: pw.TextStyle(
                      font: pw.Font.timesBoldItalic(),
                      fontSize: 11,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  ...languages.map(
                    (s) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 2),
                      child: pw.Row(
                        children: [
                          pw.Text(
                            '• ',
                            style: pw.TextStyle(
                              font: ttfBold,
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                          pw.Text(
                            '$s',
                            style: pw.TextStyle(
                              font: pw.Font.timesBoldItalic(),
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(color: PdfColors.grey, thickness: 0.3),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    'ADDITIONAL INFORMATION',
                    style: pw.TextStyle(
                      font: pw.Font.timesBoldItalic(),
                      fontSize: 11,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  ...AI.map(
                    (s) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 2),
                      child: pw.Row(
                        children: [
                          pw.Text(
                            '• ',
                            style: pw.TextStyle(
                              font: ttfBold,
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                          pw.Text(
                            '$s',
                            style: pw.TextStyle(
                              font: pw.Font.timesBoldItalic(),
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(color: PdfColors.grey, thickness: 0.3),
                  pw.SizedBox(height: 15),
                  pw.Text(
                    'INTERESTS',
                    style: pw.TextStyle(
                      font: ttfBold,
                      fontSize: 11,
                      color: PdfColors.white,
                    ),
                  ),
                  pw.SizedBox(height: 4),
                  ...intrests.map(
                    (s) => pw.Padding(
                      padding: const pw.EdgeInsets.only(bottom: 2),
                      child: pw.Row(
                        children: [
                          pw.Text(
                            '• ',
                            style: pw.TextStyle(
                              font: ttfBold,
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                          pw.Text(
                            '$s',
                            style: pw.TextStyle(
                              font: pw.Font.timesBoldItalic(),
                              fontSize: 9,
                              color: PdfColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(height: 10),
                  pw.Divider(color: PdfColors.grey, thickness: 0.3),
                ],
              )
            : pw.Container(),
      );
    }

    // 🔹 Header Builder (only for first page)
    pw.Widget buildHeader() {
      return pw.Container(
        height: 100,
        width: double.infinity,
        color: PdfColor.fromHex("#4A4A4A"),
        padding: const pw.EdgeInsets.symmetric(vertical: 20, horizontal: 23),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(width: 20),
            pw.Text(
              nameLine1,
              style: pw.TextStyle(
                font: pw.Font.timesBoldItalic(),
                fontSize: 37,
                color: PdfColors.white,
              ),
            ),
          ],
        ),
      );
    }

    // 🔹 Page Layout Builder (Sidebar only on first page)
    pw.Widget buildPage({
      required pw.Widget content,
      bool showHeader = true,
      bool includeInfo = true,
    }) {
      return pw.Container(
        width: double.infinity,
        height: double.infinity,
        child: pw.Column(
          children: [
            if (showHeader) buildHeader(),
            pw.Expanded(
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  if (includeInfo) buildSidebar(includeInfo: includeInfo),
                  if (includeInfo) pw.SizedBox(width: 12),
                  // Content expands fully on pages without sidebar
                  pw.Expanded(
                    child: pw.Padding(
                      padding: pw.EdgeInsets.only(
                        right: 12,
                        left: includeInfo ? 0 : 24,
                      ),
                      child: content,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
pdf.addPage(
  pw.Page(
    pageFormat: PdfPageFormat.a4,
    margin: pw.EdgeInsets.zero,
    build: (context) => buildPage(
      showHeader: true,
      includeInfo: true,
      content: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.SizedBox(height: 15),
          pw.Text(about, style: pw.TextStyle(font: ttf, fontSize: 10)),
          pw.SizedBox(height: 10),
          pw.Divider(thickness: 2, color: PdfColors.grey500),
          pw.SizedBox(height: 10),

          // 🟩 EXPERIENCE SECTION
          pw.Text('EXPERIENCE',
              style: pw.TextStyle(font: pw.Font.timesBoldItalic(), fontSize: 16)),
          pw.SizedBox(height: 6),
          ...experience.map(
            (exp) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 6),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(exp['role']!, style: pw.TextStyle(fontSize: 11, font: pw.Font.helveticaBoldOblique())),
                  pw.Text('${exp['period']}', style: pw.TextStyle(fontSize: 9)),
                  pw.SizedBox(height: 3),
                  ...((exp['bullets'] as List<String>).map(
                    (b) => pw.Row(
                      children: [
                        pw.Text('• ', style: pw.TextStyle(font: ttf, fontSize: 9)),
                        pw.Text(b, style: pw.TextStyle(font: ttf, fontSize: 9)),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),

          // 🟩 EDUCATION SECTION — ab experience ke baahar likha hai
          pw.SizedBox(height: 10),
         
          ...education.map(
            (edu) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 6),
              child:
                        pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.SizedBox(height: 10),
              pw.Divider(thickness: 2, color: PdfColors.grey600),
              pw.SizedBox(height: 10),
              pw.Text(
                'EDUCATION',
                style: pw.TextStyle(
                  font: pw.Font.timesBoldItalic(),
                  fontSize:16,
                ),
              ),
              pw.SizedBox(height: 15),
              ...education.map(
                (edu) => pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 6),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        '${edu['degree']}',
                        style: pw.TextStyle(fontSize: 10,font: pw.Font.helveticaBoldOblique(),),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Text(
                        '${edu['institution']}',
                        style: pw.TextStyle(
                          fontSize: 10,

                        ),
                      ),
                      pw.Text(
                        '${edu['period']}',
                        style: pw.TextStyle(fontSize: 8, font: ttf),
                      ),
                      ...((edu['details'] as List<String>).map(
                        (b) => pw.Row(
                          children: [
                            pw.Text(
                              '• ',
                              style: pw.TextStyle(font: ttf, fontSize: 9),
                            ),
                            pw.Text(
                              '$b',
                              style: pw.TextStyle(font: ttf, fontSize: 9),
                            ),
                            pw.SizedBox(height: 6)
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        
           ),
          ),
        ],
      ),
    ),
  ),
);

  





 
    await Printing.layoutPdf(onLayout: (format) => pdf.save());
  }
}






