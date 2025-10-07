// import 'dart:typed_data';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:pdf/pdf.dart' as pdf;
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

//   @override

// class ResumeScreen extends StatefulWidget {
//   const ResumeScreen({super.key});

//   @override
//   State<ResumeScreen> createState() => _ResumeScreenState();
// }

// class _ResumeScreenState extends State<ResumeScreen> {

//   // Sample dynamic data (you can replace these)
//   final String name = 'TAYLOR\nCOOK';
//   final String role = 'Programmer';

//   final Map<String, String> contact = {
//     'ADDRESS': '500 Anywhere Road\nMiami, FL 33101\nUnited States',
//     'PHONE': '(305) 502-8879',
//     'EMAIL': 'taylor.cook@gmail.com',
//     'NATIONALITY': 'American'
//   };

//   final List<String> skills = [
//     'Performance Optimization',
//     'Troubleshooting and Solutions',
//     'Analytical Thinking Skills',
//     'Software Design and Architecture',
//     'Coding and Scripting',
//   ];

//   final List<String> languages = ['English', 'French'];

//   final String profile =
//       'Innovative Programmer and Internet Entrepreneur striving to make\nideas real with a more unified and connected place. A creative\nthinker, adept in software development and working with versatile\nstructures.';

//   final List<Map<String, String>> employmentHistory = [
//     {
//       'title': 'Programmer, Johannes Initiative',
//       'duration': 'Dec 2015 — Present',
//       'location': 'Palo Alto',
//       'bullets': '- Wrote enterprise software systems to\nhelp educators specialize in designers, working\nexpertly across some community-specific features.\n- Debugged code and enhanced programs.\n- Delegated tasks, to ensure compliance with new\nstandards-Improved.'
//     },
//     {
//       'title': 'Programmer, Kindlinks, Inc.',
//       'duration': 'Feb 2010 — Sep 2015',
//       'location': 'Monte Park, CA',
//       'bullets': '- Worked Kindlinks, Inc. Tied in 2004 I complaint with\nnew standards including infrastructure, offerings\nproviding product strategy and integrity.\n- Collaborated with teams and diverse groups in\nworldwide to create new people of the world.'
//     },
//   ];

//   final List<Map<String, String>> education = [
//     {
//       'degree':
//           'Master of Computer Science, Boston College\nAug 2008 — Jun 2010\nSpecialized in Software Engineering, Algorithms, and\nDistributed Systems',
//       'location': 'Boston'
//     },
//     {
//       'degree':
//           'Completed thesis on Optimizing Distributed Databases for High Availability\nAssisted professors as a teaching assistant for\nundergraduate programming courses',
//       'location': 'Boston'
//     }
//   ];

//   String formattedDate() =>
//       DateFormat('MMMM d, yyyy').format(DateTime.now()); // e.g., August 1, 2025

//   // ----------------------------
//   // UI Build
//   // ----------------------------
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Resume - Print to PDF'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: _printPdf,
//             tooltip: 'Print / Export PDF',
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 900),
//             child: Card(
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // LEFT COLUMN (narrow)
//                     Flexible(
//                       flex: 35,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(
//                                 fontSize: 28, fontWeight: FontWeight.bold),
//                           ),
//                           const SizedBox(height: 6),
//                           Text(role,
//                               style: const TextStyle(
//                                   fontSize: 14, color: Colors.grey)),
//                           const SizedBox(height: 16),
//                           const Divider(),
//                           sectionTitle('DETAILS'),
//                           sizedBox(8),
//                           infoBlock('ADDRESS', contact['ADDRESS']!),
//                           sizedBox(8),
//                           infoRow('PHONE', contact['PHONE']!),
//                           sizedBox(6),
//                           infoRow('EMAIL', contact['EMAIL']!),
//                           sizedBox(6),
//                           infoRow('NATIONALITY', contact['NATIONALITY']!),
//                           const SizedBox(height: 12),
//                           const Divider(),
//                           sectionTitle('SKILLS'),
//                           sizedBox(8),
//                           for (var s in skills)
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 4.0),
//                               child: Text('• $s'),
//                             ),
//                           const SizedBox(height: 12),
//                           const Divider(),
//                           sectionTitle('LANGUAGES'),
//                           sizedBox(8),
//                           for (var l in languages)
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 2.0),
//                               child: Text('• $l'),
//                             ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(width: 24),

//                     // RIGHT COLUMN (wide)
//                     Flexible(
//                       flex: 65,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // top header row with logo & download
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               const SizedBox.shrink(),
//                               Column(
//                                 children: [

//                                   const SizedBox(height: 8),
//                                   ElevatedButton.icon(
//                                     onPressed: _printPdf,
//                                     icon: const Icon(Icons.picture_as_pdf),
//                                     label: const Text('Export PDF'),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           sectionTitle('PROFILE'),
//                           sizedBox(8),
//                           Text(profile, style: const TextStyle(height: 1.3)),
//                           const SizedBox(height: 18),
//                           sectionTitle('EMPLOYMENT HISTORY'),
//                           sizedBox(8),

//                           for (var job in employmentHistory) ...[
//                             jobRow(job['title']!, job['duration']! +
//                                 ' • ' +
//                                 (job['location'] ?? '')),
//                             const SizedBox(height: 6),
//                             Text(job['bullets'] ?? ''),
//                             const SizedBox(height: 12),
//                           ],

//                           const SizedBox(height: 8),
//                           sectionTitle('EDUCATION'),
//                           sizedBox(8),
//                           // Education listed
//                           for (var ed in education) ...[
//                             Container(
//                               padding: const EdgeInsets.symmetric(vertical: 8),
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(ed['degree'] ?? '',
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.w600)),
//                                     const SizedBox(height: 6),
//                                     Text(ed['location'] ?? '',
//                                         style:
//                                             const TextStyle(color: Colors.grey)),
//                                   ]),
//                             )
//                           ],
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget jobRow(String title, String meta) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(top: 6, right: 8),
//           width: 6,
//           height: 6,
//           decoration:
//               BoxDecoration(color: Colors.black, shape: BoxShape.circle),
//         ),
//         Expanded(
//           child:
//               Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(meta, style: const TextStyle(color: Colors.grey)),
//           ]),
//         ),
//       ],
//     );
//   }

//   Widget sectionTitle(String t) {
//     return Text(t,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14));
//   }

//   Widget infoBlock(String title, String value) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 6),
//         Text(value),
//       ],
//     );
//   }

//   Widget infoRow(String title, String value) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$title ',
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
//         Expanded(child: Text(value)),
//       ],
//     );
//   }

//   Widget sizedBox(double h) => SizedBox(height: h);

//   // ----------------------------
//   // PDF Generation
//   // ----------------------------

//   Future<pw.MemoryImage?> _loadLogoForPdf() async {
//     try {

//     } catch (e) {
//       // no logo or failed to load
//       return null;
//     }
//   }

//   Future<void> _printPdf() async {
//     final pdfDoc = pw.Document();

//     final pw.MemoryImage? logo = await _loadLogoForPdf();

//     // Page 1: Full resume
//     pdfDoc.addPage(
//       pw.MultiPage(
//         pageFormat: pdf.PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(24),
//         build: (pw.Context context) {
//           return [
//             pw.Row(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 // LEFT COLUMN
//                 pw.Container(
//                   width: 180,
//                   child: pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text('TAYLOR\nCOOK',
//                           style: pw.TextStyle(
//                               fontSize: 22, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 6),
//                       pw.Text(role,
//                           style: pw.TextStyle(
//                               fontSize: 10, color: pdf.PdfColors.grey)),
//                       pw.SizedBox(height: 10),
//                       pw.Divider(),
//                       pw.SizedBox(height: 6),
//                       pw.Text('DETAILS', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 6),
//                       pw.Text('ADDRESS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text(contact['ADDRESS'] ?? ''),
//                       pw.SizedBox(height: 6),
//                       pw.Text('PHONE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text(contact['PHONE'] ?? ''),
//                       pw.SizedBox(height: 6),
//                       pw.Text('EMAIL', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text(contact['EMAIL'] ?? ''),
//                       pw.SizedBox(height: 6),
//                       pw.Text('NATIONALITY', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.Text(contact['NATIONALITY'] ?? ''),
//                       pw.SizedBox(height: 10),
//                       pw.Divider(),
//                       pw.Text('SKILLS', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                       for (var s in skills) pw.Text('• $s'),
//                       pw.SizedBox(height: 10),
//                       pw.Divider(),
//                       pw.Text('LANGUAGES', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                       for (var l in languages) pw.Text('• $l'),
//                     ],
//                   ),
//                 ),

//                 pw.SizedBox(width: 20),

//                 // RIGHT COLUMN
//                 pw.Expanded(
//                   child: pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       // top right: logo
//                       if (logo != null)
//                         pw.Container(
//                           alignment: pw.Alignment.topRight,
//                           child: pw.Image(logo, width: 120, height: 60, fit: pw.BoxFit.cover),
//                         ),
//                       pw.SizedBox(height: 8),
//                       pw.Text('PROFILE', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 6),
//                       pw.Text(profile),
//                       pw.SizedBox(height: 12),

//                       pw.Text('EMPLOYMENT HISTORY', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 6),
//                       for (var job in employmentHistory) ...[
//                         pw.Row(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             pw.Container(width: 6, height: 6, decoration: pw.BoxDecoration(color: pdf.PdfColors.black, shape: pw.BoxShape.circle)),
//                             pw.SizedBox(width: 8),
//                             pw.Expanded(
//                               child: pw.Column(
//                                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                                 children: [
//                                   pw.Text(job['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                                   pw.Text('${job['duration']} • ${job['location']}', style: pw.TextStyle(color: pdf.PdfColors.grey)),
//                                   pw.SizedBox(height: 4),
//                                   pw.Text(job['bullets'] ?? ''),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         pw.SizedBox(height: 8),
//                       ],

//                       pw.SizedBox(height: 8),
//                       pw.Text('EDUCATION', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 6),
//                       for (var ed in education) ...[
//                         pw.Text(ed['degree'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         pw.Text(ed['location'] ?? '', style: pw.TextStyle(color: pdf.PdfColors.grey)),
//                         pw.SizedBox(height: 8),
//                       ],
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ];
//         },
//       ),
//     );

//     // Page 2: only EDUCATION on RIGHT side
//     pdfDoc.addPage(
//       pw.Page(
//         pageFormat: pdf.PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(24),
//         build: (pw.Context context) {
//           return pw.Row(
//             children: [
//               // Left empty column taking more space so education is on right
//               pw.Expanded(flex: 2, child: pw.Container()),

//               // Right column with Education
//               pw.Expanded(
//                 flex: 3,
//                 child: pw.Container(
//                   padding: const pw.EdgeInsets.all(8),
//                   child: pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text('EDUCATION', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 10),
//                       for (var ed in education) ...[
//                         pw.Text(ed['degree'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         pw.Text(ed['location'] ?? '', style: pw.TextStyle(color: pdf.PdfColors.grey)),
//                         pw.SizedBox(height: 12),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Use the printing package to present print/save UI cross-platform
//     await Printing.layoutPdf(
//       onLayout: (pdf.PdfPageFormat format) async => pdfDoc.save(),
//       name: 'resume.pdf',
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';

//   @override

// class ResumeScreen extends StatefulWidget {
//   const ResumeScreen({super.key});

//   @override
//   State<ResumeScreen> createState() => _ResumeScreenState();
// }

// class _ResumeScreenState extends State<ResumeScreen> {
//   // ---------- Replace or extend the sample data below with your full 6-page content ----------
//   final String fullName = 'ARHAM SARWAR';
//   final String subtitle = 'Senior Flutter Developer (Backend • AI • Deployment)';
//   final String phone = '+92 308 4695012';
//   final String email = 'arhamsarwar786@gmail.com';
//   final String location = 'Lahore, Pakistan';
//   final String linkedin = 'linkedin.com/in/arham-sarwar';
//   final String about =
//       'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.';

//   // Education sample (list of maps)
//   final List<Map<String, String>> education = [
//     {
//       'title': 'Bachelors in Information Technology',
//       'institution': 'University of Punjab, Lahore',
//       'years': '2019 - 2023'
//     },
//     {
//       'title': 'F.Sc Pre-Engineering',
//       'institution': 'Islamia College, Lahore',
//       'years': '2016 - 2019'
//     },
//     {
//       'title': 'Matric',
//       'institution': 'Islamia High School, Lahore',
//       'years': '2014 - 2016'
//     },
//   ];

//   // Experience sample (list)
//   final List<Map<String, String>> experiences = [
//     {
//       'title': 'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'Securehops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'bullet':
//           'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications. Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
//     },
//     {
//       'title': 'Team Lead (Flutter + Backend) [Promoted]',
//       'company': 'Securehops',
//       'period': 'Jan 2023 - Jan 2025',
//       'bullet':
//           'Built and deployed backend systems, mentored junior developers, ensured best practices for architecture and code quality.'
//     },
//     // Add the rest of his experience entries...
//   ];

//   // Skills (left column)
//   final List<String> skills = [
//     'Flutter & Dart',
//     'Firebase Suite (Auth, Firestore, Storage)',
//     'Backend (Node.js, Laravel, REST, GraphQL)',
//     'CI/CD & DevOps (Docker, GitHub Actions)',
//     'Databases (MySQL, PostgreSQL, MongoDB, SQLite)',
//     'AI & ML Integration (TF Lite, OpenAI APIs)',
//     'Version Control (Git, GitHub, Bitbucket)',
//   ];

//   // Projects sample - keep them summarized; you can add more or full descriptions
//   final List<Map<String, String>> projects = [
//     {
//       'name': 'Sendsorta',
//       'type': 'Mobile Application',
//       'desc':
//           'A dedicated parent-carer app that provides personalized guidance and support for raising children.'
//     },
//     {
//       'name': 'Griot Connects',
//       'type': 'Mobile Application',
//       'desc':
//           'A platform to sell and purchase ebooks, enable authors and readers to connect.'
//     },
//     // Add other projects...
//   ];
//   // ------------------------------------------------------------------------------------------------

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CV Preview — Taylor Cook Style'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: () => _printPdf(),
//             tooltip: 'Print / Save PDF',
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             // For preview: create multiple pages by splitting content visually
//             _buildPreviewPage(),
//             const SizedBox(height: 20),
//             // If you want separate preview pages, duplicate with different slices
//             _buildPreviewPage(second: true),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPreviewPage({bool second = false}) {
//     // This preview shows the same two-column layout as the generated PDF
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 900),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey.shade300),
//       ),
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Left column (narrow)
//           SizedBox(
//             width: 240,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(fullName,
//                     style: const TextStyle(
//                         fontSize: 22, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 Text(subtitle, style: TextStyle(color: Colors.grey[700])),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('DETAILS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 _smallInfoRow('Phone', phone),
//                 _smallInfoRow('Email', email),
//                 _smallInfoRow('Location', location),
//                 _smallInfoRow('LinkedIn', linkedin),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('SKILLS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 for (var s in skills) _bulletText(s),
//                 const SizedBox(height: 12),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('LANGUAGES',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 _bulletText('English'),
//                 _bulletText('Urdu'),
//               ],
//             ),
//           ),

//           const SizedBox(width: 24),

//           // Right column (wide)
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Profile / About
//                 const SizedBox(height: 6),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('PROFILE',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 Text(about, style: TextStyle(color: Colors.grey[800])),
//                 const SizedBox(height: 16),

//                 // Employment / Experience
//                 const Text('EMPLOYMENT HISTORY',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 for (var e in experiences) _experiencePreview(e),

//                 const SizedBox(height: 16),
//                 const Text('EDUCATION',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 for (var edu in education) _educationPreview(edu),
//                 const SizedBox(height: 16),

//                 const Text('PROJECTS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 for (var p in projects) _projectPreview(p),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _smallInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(width: 70, child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
//           const SizedBox(width: 8),
//           Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
//         ],
//       ),
//     );
//   }

//   Widget _bulletText(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  ', style: TextStyle(fontSize: 14)),
//           Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
//         ],
//       ),
//     );
//   }

//   Widget _experiencePreview(Map<String, String> e) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(e['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(e['company'] ?? '', style: const TextStyle(fontStyle: FontStyle.italic)),
//               const SizedBox(height: 4),
//               Text(e['bullet'] ?? ''),
//             ]),
//           ),
//           const SizedBox(width: 8),
//           SizedBox(
//             width: 100,
//             child: Text(e['period'] ?? '', textAlign: TextAlign.right, style: const TextStyle(color: Colors.black54)),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _educationPreview(Map<String, String> edu) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(edu['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(edu['institution'] ?? ''),
//             ]),
//           ),
//           const SizedBox(width: 8),
//           SizedBox(width: 100, child: Text(edu['years'] ?? '', textAlign: TextAlign.right)),
//         ],
//       ),
//     );
//   }

//   Widget _projectPreview(Map<String, String> p) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Text(p['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 4),
//         Text(p['desc'] ?? ''),
//       ]),
//     );
//   }

//   // -------------------- PDF generation --------------------
//   Future<void> _printPdf() async {
//     final doc = pw.Document();

//     // Common styles
//     final pw.TextStyle headerStyle = pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold);
//     final pw.TextStyle subHeader = pw.TextStyle(fontSize: 12, color: PdfColors.grey800);
//     final pw.TextStyle sectionTitle = pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);

//     // Create pages until content is exhausted — for simplicity, here we place content across multiple pages automatically
//     doc.addPage(
//       pw.MultiPage(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(32),
//         build: (context) {
//           return [
//             // HEADER (name + contact)
//             pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//               pw.Expanded(
//                   flex: 3,
//                   child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                     pw.Text(fullName, style: headerStyle),
//                     pw.SizedBox(height: 6),
//                     pw.Text(subtitle, style: subHeader),
//                   ])),
//               pw.SizedBox(width: 20),
//               pw.Expanded(
//                 flex: 2,
//                 child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
//                   pw.Text(phone, style: subHeader),
//                   pw.SizedBox(height: 4),
//                   pw.Text(email, style: subHeader),
//                   pw.SizedBox(height: 4),
//                   pw.Text(location, style: subHeader),
//                   pw.SizedBox(height: 4),
//                   pw.Text(linkedin, style: subHeader),
//                 ]),
//               ),
//             ]),
//             pw.SizedBox(height: 12),
//             pw.Divider(),

//             // Main two-column layout: left narrow, right wide
//             pw.Container(
//               child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                 // LEFT column
//                 pw.Container(
//                   width: 180,
//                   child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                     pw.SizedBox(height: 8),
//                     pw.Text('DETAILS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     _pwKeyValue('Phone', phone),
//                     _pwKeyValue('Email', email),
//                     _pwKeyValue('Location', location),
//                     _pwKeyValue('LinkedIn', linkedin),

//                     pw.SizedBox(height: 12),
//                     pw.Divider(),
//                     pw.SizedBox(height: 8),
//                     pw.Text('SKILLS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var s in skills) pw.Bullet(text: s),
//                     pw.SizedBox(height: 12),
//                     pw.Divider(),
//                     pw.SizedBox(height: 8),
//                     pw.Text('LANGUAGES', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     pw.Bullet(text: 'English'),
//                     pw.Bullet(text: 'Urdu'),
//                   ]),
//                 ),

//                 pw.SizedBox(width: 20),

//                 // RIGHT column
//                 pw.Expanded(
//                   child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                     pw.Text('PROFILE', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     pw.Text(about),

//                     pw.SizedBox(height: 16),
//                     pw.Text('EMPLOYMENT HISTORY', style: sectionTitle),
//                     pw.SizedBox(height: 8),

//                     for (var e in experiences) ...[
//                       pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                         pw.Expanded(
//                           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                             pw.Text(e['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                             pw.SizedBox(height: 4),
//                             pw.Text(e['company'] ?? '', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
//                             pw.SizedBox(height: 6),
//                             pw.Text(e['bullet'] ?? ''),
//                           ]),
//                         ),
//                         pw.SizedBox(width: 12),
//                         pw.Container(width: 80, child: pw.Text(e['period'] ?? '', textAlign: pw.TextAlign.right)),
//                       ]),
//                       pw.SizedBox(height: 8),
//                     ],

//                     pw.SizedBox(height: 12),
//                     pw.Text('EDUCATION', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var edu in education) ...[
//                       pw.Row(children: [
//                         pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                           pw.Text(edu['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                           pw.SizedBox(height: 4),
//                           pw.Text(edu['institution'] ?? ''),
//                         ])),
//                         pw.Container(width: 80, child: pw.Text(edu['years'] ?? '', textAlign: pw.TextAlign.right)),
//                       ]),
//                       pw.SizedBox(height: 6),
//                     ],

//                     pw.SizedBox(height: 12),
//                     pw.Text('PROJECTS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var p in projects) ...[
//                       pw.Text(p['name'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 4),
//                       pw.Text(p['desc'] ?? ''),
//                       pw.SizedBox(height: 8),
//                     ],
//                   ]),
//                 ),
//               ]),
//             ),
//           ];
//         },
//       ),
//     );

//     // If your content is long, you can add more pages with new MultiPage sections.
//     // For demo, add a second page if needed:
//     // doc.addPage(...);

//     // Convert to bytes
//     final Uint8List bytes = await doc.save();

//     // Use Printing package to display dialog for save/print
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   // Helper to build key-value in PDF left column
//   pw.Widget _pwKeyValue(String key, String value) {
//     return pw.Padding(
//       padding: const pw.EdgeInsets.only(bottom: 6),
//       child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         pw.Container(width: 60, child: pw.Text(key + ':', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10))),
//         pw.SizedBox(width: 8),
//         pw.Expanded(child: pw.Text(value, style: pw.TextStyle(fontSize: 10))),
//       ]),
//     );
//   }
// }

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';

//   @override

// class ResumeScreen extends StatefulWidget {
//   const ResumeScreen({super.key});

//   @override
//   State<ResumeScreen> createState() => _ResumeScreenState();
// }

// class _ResumeScreenState extends State<ResumeScreen> {
//   // --------------------- PASTE FULL 6-PAGE CONTENT HERE ---------------------
//   // Header / Contact
//   final String fullName = 'ARHAM SARWAR';
//   final String subtitle = 'Senior Flutter Developer (Backend • AI • Deployment)';
//   final String phone = '+92 308 4695012';
//   final String email = 'arhamsarwar786@gmail.com';
//   final String location = 'Lahore, Pakistan';
//   final String linkedin = 'linkedin.com/in/arham-sarwar-a1b5b176';

//   // About
//   final String about =
//       'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.';

//   // Education (from image)
//   final List<Map<String, String>> education = [
//     {
//       'title': 'Bachelors in Information Technology',
//       'institution': 'University of Punjab Lahore',
//       'years': '2019 - 2023'
//     },
//     {
//       'title': 'F.Sc Pre-Engineering',
//       'institution': 'Islamia College, Lahore',
//       'years': '2016 - 2019'
//     },
//     {
//       'title': 'Matric',
//       'institution': 'Islamia High School, Lahore',
//       'years': '2014 - 2016'
//     },
//   ];

//   // Experience - comprehensive (summarized/bulleted based on images)
//   // I included many roles from the 6 pages; edit any text if you want exact phrasing.
//   final List<Map<String, dynamic>> experiences = [
//     {
//       'title':
//           'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'Securehops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'bullets': [
//         'Developed cross-platform mobile apps using Flutter and Firebase.',
//         'Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications.',
//         'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
//         'Promoted for delivering high-quality solutions and mentoring junior developers.'
//       ],
//     },
//     {
//       'title': 'Team Lead (Flutter + Backend) [Promoted]',
//       'company': 'Securehops',
//       'period': 'Jan 2023 - Jan 2025',
//       'bullets': [
//         'Led cross-platform mobile teams using Flutter and Firebase.',
//         'Architected and implemented backend services and deployments (GraphQL, REST).',
//         'Mentored junior developers and reviewed code to ensure maintainability.'
//       ],
//     },
//     {
//       'title': 'Senior Flutter & Backend Developer [Promoted]',
//       'company': 'Securehops',
//       'period': 'July 2022 - Jan 2025',
//       'bullets': [
//         'Developed robust backend integrations and mobile features.',
//         'Improved app performance and reliability; implemented best practices.'
//       ],
//     },
//     {
//       'title': 'Flutter Developer',
//       'company': 'TYDLUP (April 2024 - Sept 2025)',
//       'period': 'April 2024 - Sept 2025',
//       'bullets': [
//         'Designed and developed a mobile app to connect customers with on-demand cleaning services.',
//         'Implemented user-friendly booking, scheduling and service management features.'
//       ],
//     },
//     {
//       'title': 'Flutter Developer',
//       'company': 'Calamgram.inc',
//       'period': 'Mar 2019 - Jan 2025',
//       'bullets': [
//         'Contributed to the success of Salammy (Muslim Daily App) with 50k+ downloads.',
//         'Developed features for daily prayers, Quran and Islamic tools to enhance user engagement.',
//       ],
//     },
//     {
//       'title': 'Flutter Developer (Freelance)',
//       'company': 'Fiverr / Upwork',
//       'period': 'Apr 2020 - Sept 2022',
//       'bullets': [
//         'Worked as a freelance Flutter developer delivering high quality Flutter and backend solutions.',
//         'Completed diverse projects focusing on mobile apps, APIs and scalable backend systems.'
//       ],
//     },
//     {
//       'title': 'Flutter Developer',
//       'company': 'WeTeach',
//       'period': 'Dec 2024 - Present',
//       'bullets': [
//         'Developed and launched an app with 5k+ downloads and a 4.2+ rating.',
//         'Built features to register users, sign up and learn, and integrated expert guidance.'
//       ],
//     },
//     {
//       'title': 'CTO & Flutter Developer',
//       'company': 'Harry Clark (Independent / Startup roles)',
//       'period': 'Various',
//       'bullets': [
//         'Built a mobile app for users to buy and sell eBooks and digital content.',
//         'Implemented secure authentication, payments, and content management.',
//       ],
//     },
//     {
//       'title': 'CTO & Flutter Developer',
//       'company': 'IQRA QURAN APP',
//       'period': 'Various',
//       'bullets': [
//         'Led development that provided offline access to the Holy Quran and improved UX and performance.',
//         'Focused on accessibility and scalable architecture.'
//       ],
//     },
//     {
//       'title': 'CTO & Flutter Developer',
//       'company': 'JoinCircleUp / OnPlo (sample roles)',
//       'period': 'Various',
//       'bullets': [
//         'Delivered Flutter mobile apps, integrated with NodeJS/REST backends and deployed secure solutions.',
//       ],
//     },
//     {
//       'title': 'Senior Flutter & Backend Developer',
//       'company': 'OnPlo',
//       'period': 'Various',
//       'bullets': [
//         'Built a secure all-in-one platform with chat, storage, jobs, accounts and payments.',
//         'Delivered a unified digital solution under one roof.'
//       ],
//     },
//     {
//       'title': 'Senior Flutter Developer',
//       'company': 'OnPlo (other project)',
//       'period': 'Various',
//       'bullets': [
//         'Worked on scalable Flutter solutions ensuring smooth UI/UX and secure transactions.'
//       ],
//     },
//     {
//       'title': 'Senior Flutter Developer',
//       'company': 'NubesSIM',
//       'period': 'Various',
//       'bullets': [
//         'Developed apps for eSIM purchase and global usage; implemented secure account management.'
//       ],
//     },
//   ];

//   // Core skills & skills sections (combining both blocks from images)
//   final List<String> coreSkills = [
//     'Flutter & Dart - Cross-Platform Development, iOS & Android',
//     'Firebase Suite - Auth, Firestore, Storage, Cloud Functions, Messaging',
//     'Backend Development - Node.js, Laravel, REST, GraphQL, Express.js',
//     'State Management - Provider, Riverpod, BLoC, GetX, Cubit',
//     'DevOps & Deployment - CI/CD, Docker, Kubernetes, GitHub Actions, Bitbucket Pipelines',
//     'AI & ML Integration - TensorFlow Lite, Firebase ML Kit, OpenAI APIs',
//     'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
//     'Version Control - Git, GitHub, GitLab, Bitbucket',
//     'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',
//   ];

//   final List<String> skillsShort = [
//     'Push Notifications (FCM, APNs)',
//     'Firebase Suite (Auth, Firestore, Storage, Cloud Functions)',
//     'Backend (Node.js, Laravel, REST, GraphQL)',
//     'CI/CD & Deployment (Docker, GitHub Actions)',
//     'Databases & ORM (MySQL, PostgreSQL, MongoDB, SQLite)',
//   ];

//   // Projects — many items; summarized descriptions included
//   final List<Map<String, String>> projects = [
//     {
//       'name': 'Sendsorta',
//       'type': 'Mobile Application',
//       'desc': 'Dedicated parent/carer app providing personalized guidance and support.'
//     },
//     {
//       'name': 'Griot Connects',
//       'type': 'Mobile Application',
//       'desc': 'Platform to sell and purchase ebooks and connect authors with readers.'
//     },
//     {
//       'name': 'CircleUp',
//       'type': 'Mobile Application',
//       'desc': 'Platform enabling community features and curated content.'
//     },
//     {
//       'name': 'OnFewka',
//       'type': 'Mobile Application',
//       'desc': 'Freelance service marketplace mobile app with secure transactions.'
//     },
//     {
//       'name': 'Hikary',
//       'type': 'Mobile Application',
//       'desc': 'Smart vehicle maintenance app to track car health and services.'
//     },
//     {
//       'name': 'Yobblemena',
//       'type': 'Mobile Application',
//       'desc': 'Driving app connecting drivers for local services and logistic tasks.'
//     },
//     {
//       'name': 'Mutaqi Quran App',
//       'type': 'Mobile Application',
//       'desc': 'Quran learning application with offline capabilities and recitation tools.'
//     },
//     {
//       'name': 'Bissi Player',
//       'type': 'Mobile Application',
//       'desc': 'Media player app for content streaming and playlist management.'
//     },
//     {
//       'name': 'Kamaec',
//       'type': 'Mobile Application',
//       'desc': 'Ecommerce-like marketplace app supporting local sellers and buyers.'
//     },
//     // second page projects (website & backend)
//     {
//       'name': 'Certainli.so',
//       'type': 'Website + Backend',
//       'desc':
//           'Ecommerce/Regulatory platform delivering compliance and product catalog solutions with fast searching capability.'
//     },
//     {
//       'name': 'FemClinic',
//       'type': 'Website + Backend',
//       'desc': 'Healthcare platform integrating modern E-doctor platform functionalities.'
//     },
//     {
//       'name': 'Globe',
//       'type': 'Web App',
//       'desc':
//           'Web app with unique interaction results and visual representations for global metrics.'
//     },
//     {
//       'name': 'Globe Deployment',
//       'type': 'Deployment',
//       'desc': 'Deployment architecture for globe web app (visualization + UX).'
//     },
//     {
//       'name': 'HP Appen',
//       'type': 'Web App',
//       'desc': 'MCQ/education platform with modern UX.'
//     },
//   ];

//   // --------------------- END OF CONTENT ---------------------

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CV Preview — Taylor Cook Style'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: () => _printPdf(),
//             tooltip: 'Print / Save PDF',
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//         child: Center(
//           child: Column(
//             children: [
//               _buildPreviewPage(pageIndex: 1),
//               const SizedBox(height: 18),
//               _buildPreviewPage(pageIndex: 2),
//               const SizedBox(height: 18),
//               _buildPreviewPage(pageIndex: 3),
//               const SizedBox(height: 18),
//               _buildPreviewPage(pageIndex: 4),
//               const SizedBox(height: 18),
//               _buildPreviewPage(pageIndex: 5),
//               const SizedBox(height: 18),
//               _buildPreviewPage(pageIndex: 6),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Builds a preview container that visually approximates a single A4 page split into two columns.
//   Widget _buildPreviewPage({required int pageIndex}) {
//     // For preview purposes we reuse the same layout and let content flow visually.
//     return Container(
//       width: 900,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300),
//           color: Colors.black,
//           boxShadow: [
//             BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)
//           ]),
//       padding: const EdgeInsets.all(20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Left column (narrow)
//           SizedBox(
//             width: 240,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(fullName,
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 Text(subtitle, style: TextStyle(color: Colors.grey[700])),
//                 const SizedBox(height: 16),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('DETAILS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 _smallInfoRow('Phone', phone),
//                 _smallInfoRow('Email', email),
//                 _smallInfoRow('Location', location),
//                 _smallInfoRow('LinkedIn', linkedin),
//                 const SizedBox(height: 12),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('CORE SKILLS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 for (var s in coreSkills) Padding(
//                   padding: const EdgeInsets.only(bottom: 6),
//                   child: Text('• $s', style: const TextStyle(fontSize: 12)),
//                 ),
//                 const SizedBox(height: 12),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('SKILLS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 for (var s in skillsShort) _bulletText(s),
//                 const SizedBox(height: 12),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('LANGUAGES',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 const SizedBox(height: 8),
//                 _bulletText('English'),
//                 _bulletText('Urdu'),
//               ],
//             ),
//           ),
//           const SizedBox(width: 24),

//           // Right column (wide)
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // PROFILE / ABOUT
//                 const SizedBox(height: 6),
//                 const Divider(),
//                 const SizedBox(height: 8),
//                 const Text('PROFILE',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 Text(about, style: TextStyle(color: Colors.grey[800])),
//                 const SizedBox(height: 12),

//                 // EMPLOYMENT HISTORY (split content across preview pages visually)
//                 const Text('EMPLOYMENT HISTORY',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 // Show slice of experiences depending on pageIndex for preview readability
//                 for (var e in _experiencesForPreview(pageIndex))
//                   _experiencePreview(e),

//                 const SizedBox(height: 12),
//                 const Text('EDUCATION',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 for (var edu in education) _educationPreview(edu),

//                 const SizedBox(height: 12),
//                 const Text('PROJECTS',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 for (var p in projects.take(6)) _projectPreview(p),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Small helper: select a subset of experiences for each preview page for visual spread.
//   List<Map<String, dynamic>> _experiencesForPreview(int pageIndex) {
//     // split experiences into parts for 6 preview pages — this is only for the UI preview, the PDF will paginate automatically.
//     final int perPage = (experiences.length / 4).ceil(); // roughly distribute
//     final int start = (pageIndex - 1) * perPage;
//     if (start >= experiences.length) return experiences.take(2).toList();
//     final end = (start + perPage) > experiences.length ? experiences.length : start + perPage;
//     return experiences.sublist(start, end);
//   }

//   Widget _smallInfoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//               width: 70,
//               child: Text(label,
//                   style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
//           const SizedBox(width: 8),
//           Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
//         ],
//       ),
//     );
//   }

//   Widget _bulletText(String text) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('•  ', style: TextStyle(fontSize: 14)),
//           Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
//         ],
//       ),
//     );
//   }

//   Widget _experiencePreview(Map<String, dynamic> e) {
//     final List<String> bullets = List<String>.from(e['bullets'] ?? []);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(e['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Text(e['company'] ?? '', style: const TextStyle(fontStyle: FontStyle.italic)),
//               const SizedBox(height: 6),
//               for (var b in bullets) Padding(
//                 padding: const EdgeInsets.only(bottom: 4),
//                 child: Text('• $b', style: const TextStyle(fontSize: 13)),
//               )
//             ]),
//           ),
//           const SizedBox(width: 8),
//           SizedBox(
//               width: 100,
//               child: Text(e['period'] ?? '', textAlign: TextAlign.right, style: const TextStyle(color: Colors.black54))),
//         ],
//       ),
//     );
//   }

//   Widget _educationPreview(Map<String, String> edu) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Expanded(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(edu['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(edu['institution'] ?? ''),
//           ])),
//           const SizedBox(width: 8),
//           SizedBox(width: 100, child: Text(edu['years'] ?? '', textAlign: TextAlign.right)),
//         ],
//       ),
//     );
//   }

//   Widget _projectPreview(Map<String, String> p) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Text(p['name'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 4),
//         Text(p['desc'] ?? ''),
//       ]),
//     );
//   }

//   // -------------------- PDF generation --------------------
//   Future<void> _printPdf() async {
//     final doc = pw.Document();

//     // styles
//     final pw.TextStyle headerStyle = pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold);
//     final pw.TextStyle subtitleStyle = pw.TextStyle(fontSize: 11, color: PdfColors.grey800);
//     final pw.TextStyle sectionTitle = pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold);

//     // Because content is long, we use MultiPage which paginates automatically.
//     doc.addPage(
//       pw.MultiPage(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(28),
//         build: (context) {
//           return [
//             // Header: name + contact
//             pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//               pw.Expanded(
//                 flex: 3,
//                 child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                   pw.Text(fullName, style: headerStyle),
//                   pw.SizedBox(height: 6),
//                   pw.Text(subtitle, style: subtitleStyle),
//                 ]),
//               ),
//               pw.SizedBox(width: 12),
//               pw.Expanded(
//                 flex: 2,
//                 child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
//                   pw.Text(phone, style: subtitleStyle),
//                   pw.SizedBox(height: 4),
//                   pw.Text(email, style: subtitleStyle),
//                   pw.SizedBox(height: 4),
//                   pw.Text(location, style: subtitleStyle),
//                   pw.SizedBox(height: 4),
//                   pw.Text(linkedin, style: subtitleStyle),
//                 ]),
//               ),
//             ]),
//             pw.SizedBox(height: 10),
//             pw.Divider(),

//             // Two-column layout container
//             pw.Container(
//               child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                 // LEFT column
//                 pw.Container(
//                   width: 170,
//                   child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                     pw.SizedBox(height: 8),
//                     pw.Text('DETAILS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     _pwKeyValue('Phone', phone),
//                     _pwKeyValue('Email', email),
//                     _pwKeyValue('Location', location),
//                     _pwKeyValue('LinkedIn', linkedin),
//                     pw.SizedBox(height: 12),
//                     pw.Divider(),
//                     pw.SizedBox(height: 8),
//                     pw.Text('CORE SKILLS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var s in coreSkills) pw.Bullet(text: s),
//                     pw.SizedBox(height: 10),
//                     pw.Divider(),
//                     pw.SizedBox(height: 8),
//                     pw.Text('SKILLS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var s in skillsShort) pw.Bullet(text: s),
//                     pw.SizedBox(height: 10),
//                     pw.Divider(),
//                     pw.SizedBox(height: 8),
//                     pw.Text('LANGUAGES', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     pw.Bullet(text: 'English'),
//                     pw.Bullet(text: 'Urdu'),
//                   ]),
//                 ),

//                 pw.SizedBox(width: 18),

//                 // RIGHT column (main content) — this will flow across pages automatically
//                 pw.Expanded(
//                   child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                     pw.Text('PROFILE', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     pw.Text(about),
//                     pw.SizedBox(height: 14),

//                     pw.Text('EMPLOYMENT HISTORY', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var e in experiences) ...[
//                       pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                         pw.Expanded(
//                           child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                             pw.Text(e['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                             pw.SizedBox(height: 4),
//                             pw.Text(e['company'] ?? '', style: pw.TextStyle(fontStyle: pw.FontStyle.italic)),
//                             pw.SizedBox(height: 6),
//                             for (var b in List<String>.from(e['bullets'] ?? [])) pw.Bullet(text: b),
//                           ]),
//                         ),
//                         pw.SizedBox(width: 12),
//                         pw.Container(width: 80, child: pw.Text(e['period'] ?? '', textAlign: pw.TextAlign.right)),
//                       ]),
//                       pw.SizedBox(height: 10),
//                     ],

//                     pw.SizedBox(height: 12),
//                     pw.Text('EDUCATION', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var edu in education) ...[
//                       pw.Row(children: [
//                         pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                           pw.Text(edu['title'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                           pw.SizedBox(height: 4),
//                           pw.Text(edu['institution'] ?? ''),
//                         ])),
//                         pw.Container(width: 80, child: pw.Text(edu['years'] ?? '', textAlign: pw.TextAlign.right)),
//                       ]),
//                       pw.SizedBox(height: 6),
//                     ],

//                     pw.SizedBox(height: 12),
//                     pw.Text('PROJECTS', style: sectionTitle),
//                     pw.SizedBox(height: 8),
//                     for (var p in projects) ...[
//                       pw.Text(p['name'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                       pw.SizedBox(height: 4),
//                       pw.Text(p['desc'] ?? ''),
//                       pw.SizedBox(height: 8),
//                     ],
//                   ]),
//                 ),
//               ]),
//             ),
//           ];
//         },
//       ),
//     );

//     // Save & print
//     final Uint8List bytes = await doc.save();
//     await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => bytes);
//   }

//   // Helper to build left column key-values for PDF
//   pw.Widget _pwKeyValue(String key, String value) {
//     return pw.Padding(
//       padding: const pw.EdgeInsets.only(bottom: 6),
//       child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         pw.Container(width: 60, child: pw.Text('$key:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10))),
//         pw.SizedBox(width: 8),
//         pw.Expanded(child: pw.Text(value ?? '', style: pw.TextStyle(fontSize: 10))),
//       ]),
//     );
//   }
// }





import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  // --------------------- CV DATA ---------------------
  final String fullName = 'ARHAM ';
  final String fullName2 = 'SARWAR';
  final String subtitle = 'Senior Flutter Developer ';
  final String phone = '+92 308 4695012';
  final String email = 'arhamsarwar786@gmail.com';
  final String location = 'Lahore, Pakistan';
  final String linkedin = 'linkedin.com/in/arham-sarwar-a1b5b176';

  final String about =
      'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.';

  final List<Map<String, String>> education = [
    {
      'title': 'Bachelors in Information Technology',
      'institution': 'University of Punjab Lahore',
      'years': '2019 - 2023',
    },
    {
      'title': 'F.Sc Pre-Engineering',
      'institution': 'Islamia College, Lahore',
      'years': '2016 - 2019',
    },
    {
      'title': 'Matric',
      'institution': 'Islamia High School, Lahore',
      'years': '2014 - 2016',
    },
  ];

  final List<Map<String, dynamic>> education2 = [
    {
      'title': 'Bachelors in Information Technology',
      'institution': 'University of Punjab Lahore',
      'years': '2019 - 2023',
    },
    {
      'title': 'F.Sc Pre-Engineering',
      'institution': 'Islamia College, Lahore',
      'years': '2016 - 2019',
    },
    {
      'title': 'Matric',
      'institution': 'Islamia High School, Lahore',
      'years': '2014 - 2016',
    },
  ];

  // Experience - comprehensive (summarized/bulleted based on images)
  // I included many roles from the 6 pages; edit any text if you want exact phrasing.
  final List<Map<String, dynamic>> experience1 = [
       {
      'role': 'Full Stack Developer (Flutter + Backend + Deployments)',
      'company': 'SecureHops | www.securehops.com',
      'period': 'Sept 2023 - Jan 2025',
      'details': 'Developed cross-platform mobile apps using Flutter and Firebase. Integrated backend APIs and implemented CI/CD pipelines.'
    },
    {
      'role': 'Team Lead (Flutter + Backend)',
      'company': 'SecureHops',
      'period': 'Jan 2023 - Jan 2025',
      'details': 'Led a team, developed apps, integrated backend systems, mentored juniors.'
    },
    {
      'role': 'Flutter Developer',
      'company': 'TYDUP LTD',
      'period': 'April 2024 - Sept 2025',
      'details': 'Developed mobile apps connecting customers with cleaning services.'
    },
        {
      'role': 'Flutter Developer _ Salamgram',
     
      'period': 'Mar 2019 _ Jan 2025',
      'details': 'As a Flutter Developer, contributing to the success of Salamly: Muslim Daily App, a comprehensive app for Muslims with 50K+ downloads Developed features for daily prayer days, Quran, and Islamic tools to enhance user engagement.\nPlayed a key role in achieving over 50,000 downloads through optimized performance and user-focused updates.'
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
      
    
    
      
   
  ];

 final List<Map<String, dynamic>> experience2 = [
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
      'role': 'Flutter Developer _ WeQed',
     
      'period': 'Dec 2024 _ Present',
      'details': 'Developed and launched an app with 5K+ downloads and a 12+ content rating.'

'Built a performing learning app to sign up and earn by sharing their knowledge and skills.'

'Developed features such as user sign-in, rewards system, and teacher/student dashboards.'

'Designed solutions to help users solve problems efficiently and gain the right direction.'

    },     
   
   
     
   
  ];
  final List<String> coreSkills = [
    'Flutter & Dart',
    'Firebase Suite',
    'Backend (Node.js, Laravel, REST, GraphQL)',
    'State Management (Provider, Riverpod, GetX)',
    'CI/CD, Docker, GitHub Actions',
    'Databases (MySQL, PostgreSQL, MongoDB, SQLite)',
  ];

  final List<String> skillsShort = [
    'Push Notifications (FCM, APNs)',
    'Backend (Node.js, Laravel, REST)',
    'CI/CD & Deployment',
    'Databases & ORM',
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
   
    {'title': 'OnFekwa', 'tag': 'Complete Flutter App', 'desc': 'OnFekwa is a social media app designed to help users discover the best lifestyle trends. It focuses on building fun, supportive communities based on hobbies and interests. The app includes story uploading, follower/following, messaging, and sharing features, bringing local discovery to life.'},
    {'title': 'Hikary', 'tag': 'Complete Flutter App', 'desc': 'Hikary is a news and information app helping users stay informed with current, verified information. It features an AI-based recommendation system, content filtering, and user engagement through interactive discussions.'},
    {'title': 'YobleMane', 'tag': 'Complete Flutter App', 'desc': 'YobleMane is an online dining app that connects customers with diners for customized meal selection and food discovery. Exceptionally functional, it provides easy ordering, menus, and food availability through the app.'},
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

  // --------------------- UI ---------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Preview'),
        actions: [
          IconButton(icon: const Icon(Icons.print), onPressed: _printPdf),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: List.generate(1, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildPreviewPage(pageIndex: index + 1),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewPage({required int pageIndex}) {
    return Container(
      width: 900,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT COLUMN
          SizedBox(
            width: 240,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: TextStyle(color: Colors.grey[700])),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'DETAILS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                _smallInfoRow('Phone', phone),
                _smallInfoRow('Email', email),
                _smallInfoRow('Location', location),
                _smallInfoRow('LinkedIn', linkedin),
                const Divider(),
                const Text(
                  'CORE SKILLS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                for (var s in coreSkills)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text('- $s'),
                  ),
                const Divider(),
                const Text(
                  'LANGUAGES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const Text('English'),
                const Text('Urdu'),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // RIGHT COLUMN
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROFILE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(about),
                const Divider(),
                const Text(
                  'EXPERIENCE',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                for (var e in experience1) _experiencePreview(e),
                const Divider(),
                const Text(
                  'EDUCATION',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                for (var edu in education) _educationPreview(edu),
                const Divider(),
                const Text(
                  'PROJECTS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                for (var p in projects) _projectPreview(p),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 70,
            child: Text(label, style: const TextStyle(fontSize: 12)),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
        ],
      ),
    );
  }

  Widget _experiencePreview(Map<String, dynamic> e) {
    final List<String> bullets = List<String>.from(e['bullets'] ?? []);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            e['role'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            e['period'] ?? '',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          for (var b in bullets)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text('- $b', style: const TextStyle(fontSize: 12)),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              e['details'] ?? '',
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }




  
  Widget _experience2Preview(Map<String, dynamic> ex) {
    final List<String> bullets = List<String>.from(ex['bullets'] ?? []);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ex['role'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            ex['period'] ?? '',
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          for (var b in bullets)
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 4),
              child: Text('- $b', style: const TextStyle(fontSize: 12)),
            ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ex['details'] ?? '',
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _educationPreview(Map<String, String> edu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  edu['title'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(edu['institution'] ?? ''),
              ],
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(edu['years'] ?? '', textAlign: TextAlign.right),
          ),
        ],
      ),
    );
  }

  Widget _projectPreview(Map<String, String> p) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            p['title'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(p['desc'] ?? '', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // --------------------- PDF PRINT ---------------------
  Future<void> _printPdf() async {
    final doc = pw.Document();

    final pw.TextStyle headerStyle = pw.TextStyle(
      fontSize: 33,
      fontWeight: pw.FontWeight.bold,
    );
    final pw.TextStyle titleStyle = pw.TextStyle(
      fontSize: 16,
      fontWeight: pw.FontWeight.bold,
    );
    final pw.TextStyle normal = pw.TextStyle(fontSize: 10);

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(24),
        build: (context) => [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.SizedBox(height: 20),
                  pw.Text(fullName, style: headerStyle),
                  pw.SizedBox(height: 5),
                    pw.Text(fullName2, style: headerStyle),
                  pw.SizedBox(height: 10),
                  pw.Text(subtitle, style: pw.TextStyle(color: PdfColors.grey700)),
                
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Divider(),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // LEFT COLUMN
              pw.Container(
                width: 185,
                     
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Text('DETAILS', style: titleStyle),
                    pw.SizedBox(height: 3),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
                    pw.SizedBox(height: 15),
                    pw.Text(
                      "LOCATION",
                      style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      " Lahore, Pakistan",
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 11),
                    ),
                    pw.SizedBox(height: 10),

                    pw.Text(
                      "PHONE",
                      style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      '+92 308 4695012',
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 11),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      "EMAIL",
                      style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'arhamsarwar786@gmail.com',
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 11),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text(
                      "NATIONALITY",
                      style: pw.TextStyle(
                        color: PdfColors.black,
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      " Pakistani",
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 11),
                    ),
                    pw.SizedBox(height: 20),

                    pw.Text(' CORE SKILLS', style: titleStyle),
                    pw.SizedBox(height: 3),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),

                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Flutter Cross-Platform Development',
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),

                    pw.Text(
                      'Firebase Suite_Cloud Functions',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Backend Development ',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'State Management',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'DevOps & Deployment ',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'AI & ML Integration',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Databases ',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Version Control ',

                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Project Tools ',
                      style: pw.TextStyle(color: PdfColors.black, fontSize: 8),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.SizedBox(height: 20),

                    pw.Text('LANGUAGES', style: titleStyle),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
                    pw.SizedBox(height: 10),
                    pw.Text('English', style: normal),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                    pw.Text('Urdu', style: normal),
                    pw.SizedBox(height: 5),
                    pw.Container(
                      height: 4,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),
              ),

              pw.SizedBox(width: 20),
              // RIGHT COLUMN
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.SizedBox(height: 10),
                    pw.Text('PROFILE', style: titleStyle),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),

                    pw.SizedBox(height: 20),
                    pw.Text(about, style: normal),
                    pw.Divider(),
                    pw.SizedBox(height: 10),
                    pw.Text('EXPERIENCE', style: titleStyle),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
                    for (var e in experience1)
                      pw.Padding(
                        padding: const pw.EdgeInsets.only(top: 6),
                        child: pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              e['role'] ?? '',
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 11,
                              ),
                            ),
                            pw.SizedBox(height: 3),

                            pw.Text(
                              ' ${e['period']}',
                              style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 3),
                            pw.Text(
                              e['details'] ?? '',
                              style: const pw.TextStyle(fontSize: 10),
                            ),


                           

                          ],
                        ),
                      ),






                
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
// page 2

    doc.addPage(
      pw.Page(
       
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 170,
         
               decoration: pw.BoxDecoration(
           border: pw.Border(
      right: pw.BorderSide(
        color: PdfColors.black // border ka color
                  // border ki motai
      ),
      ),)
          ),
        
          pw.SizedBox(width: 10),
       pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              // pw.Text('Profile', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
              // pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
              // pw.SizedBox(height: 8),
              // pw.Text('Employment History', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
              for (var ex in experience2)
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(ex['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                              pw.SizedBox(height:  3),
                    pw.Text(' ${ex['period']}', style: const pw.TextStyle(fontSize: 9)),
                             pw.SizedBox(height:  3),
                    pw.Text(ex['details'] ?? '', style: const pw.TextStyle(fontSize: 9)),
                  ]),
                ),
              pw.SizedBox(height: 20),
           
              pw.Text('Education', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColors.black,)),
               pw.SizedBox(height: 3),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
              pw.SizedBox(height: 10),
            
              for (var ed in education) pw.Text('${ed['title']} - ${ed['institution']} (${ed['years']})', style: const pw.TextStyle(fontSize: 12)),
             
                            pw.SizedBox(height: 20),
              
               pw.Text(' Skills', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 15,color: PdfColors.black)),
                pw.SizedBox(height: 3),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
                                        pw.SizedBox(height: 10),
              for (var s in coreSkills) pw.Text(' $s', style:  pw.TextStyle(fontSize: 12,)),
    


            ]),
          ),
    
        ]),
      ),
    );


    // page 3
    doc.addPage(
      pw.Page(
       
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 170,
                decoration: pw.BoxDecoration(
           border: pw.Border(
      right: pw.BorderSide(
        color: PdfColors.black // border ka color
                  // border ki motai
      ),              
      ),)
          
        
          
          ),
        
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Text('Projects', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColors.black,)),

              pw.SizedBox(height: 3),
                    pw.Container(
                      height: 2.5,
                      width: 40,
                      decoration: pw.BoxDecoration(
                        color: PdfColors.black,
                        borderRadius: pw.BorderRadius.circular(2),
                      ),
                    ),
              // pw.Text('Projects', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColor.fromHex('#084A3F'),)),
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
      
           
              // for (var p in projects)
                // pw.Text('${p['title']}\n  ${p['tag']}\n${p['desc']}', style: const pw.TextStyle(fontSize: 10)),
            
            ]),
          ),
        ]),
      ),
    );
// page 4
    doc.addPage(
      pw.Page(
       
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 170,
      decoration: pw.BoxDecoration(
           border: pw.Border(
      right: pw.BorderSide(
        color: PdfColors.black // border ka color
                  // border ki motai
      ),
      ),)

          
          ),
        
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
             
             
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
                // pw.Text('${P['title']} — ${P['tag']}— ${P['desc']}', style: const pw.TextStyle(fontSize: 9)),
             
            ]),
          ),
        ]),
      ),
    );


  
    final Uint8List bytes = await doc.save();
    await Printing.layoutPdf(onLayout: (format) async => bytes);
  }

  pw.Widget _pwText(String k, String v) {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(bottom: 4),
      child: pw.Text('$k: $v', style: const pw.TextStyle(fontSize: 10)),
    );
  }
}
