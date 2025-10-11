// // Flutter app (single file) that shows a multi-page resume UI styled like the provided "Jill Fantastic" reference
// // and exports the same layout to a 4-page PDF. Use this as lib/main.dart in a Flutter project.

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';



//   @override


// class Resume4Screen extends StatelessWidget {
//   final ResumeData data = ResumeData.sampleFull();
//   final Color accent = const Color(0xFF2E75B6);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Resume Generator'),
//         backgroundColor: accent,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.picture_as_pdf),
//             onPressed: () async {
//               final pdfBytes = await buildPdf(data);
//               await Printing.layoutPdf(onLayout: (_) => pdfBytes);
//             },
//             tooltip: 'Export PDF',
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(18),
//         child: Card(
//           elevation: 2,
//           child: Padding(
//             padding: const EdgeInsets.all(18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Header (only show name on visible UI top; user asked name on first page only in PDF)
//                 _buildHeaderUI(data, accent),
//                 const SizedBox(height: 12),
//                 _sectionTitle('About', accent),
//                 Text(data.about),
//                 const Divider(height: 28),

//                 _sectionTitle('Skills', accent),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 6,
//                   children: data.coreSkills.map((s) => Chip(label: Text(s))).toList(),
//                 ),
//                 const Divider(height: 28),

//                 _sectionTitle('Experience', accent),
//                 const SizedBox(height: 8),
//                 ...data.experience.map((e) => _experienceTile(e)),
//                 const Divider(height: 28),

//                 _sectionTitle('Projects', accent),
//                 const SizedBox(height: 8),
//                 ...data.projects.map((p) => _projectTile(p)),

//                 const SizedBox(height: 20),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: ElevatedButton.icon(
//                     style: ElevatedButton.styleFrom(backgroundColor: accent),
//                     icon: const Icon(Icons.print),
//                     label: const Text('Print / Export PDF'),
//                     onPressed: () async {
//                       final pdfBytes = await buildPdf(data);
//                       await Printing.layoutPdf(onLayout: (_) => pdfBytes);
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderUI(ResumeData d, Color accent) {
//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('ARHAM SARWAR', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: accent)),
//               const SizedBox(height: 6),
//               Text(d.title, style: const TextStyle(fontSize: 14)),
//             ],
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(d.location),
//             const SizedBox(height: 6),
//             Text(d.email),
//             const SizedBox(height: 4),
//             Text(d.phone),
//           ],
//         )
//       ],
//     );
//   }

//   Widget _sectionTitle(String t, Color accent) {
//     return Row(
//       children: [
//         Text(t, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: accent)),
//         const SizedBox(width: 8),
//         Expanded(child: Container(height: 1.2, color: Colors.grey[300])),
//       ],
//     );
//   }

//   Widget _experienceTile(ExperienceItem e) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('${e.role.toUpperCase()} | ${e.company}', style: const TextStyle(fontWeight: FontWeight.w600)),
//           Text(e.duration, style: const TextStyle(fontSize: 12, color: Colors.black54)),
//           const SizedBox(height: 6),
//           ...e.points.map((p) => Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('\u2022 ', style: TextStyle(fontSize: 14)),
//                   Expanded(child: Text(p)),
//                 ],
//               ))
//         ],
//       ),
//     );
//   }

//   Widget _projectTile(ProjectItem p) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p.title, style: const TextStyle(fontWeight: FontWeight.w600)), Text(p.description)]),
//     );
//   }
// }

// // ----------------------------- PDF generation -----------------------------

// Future<Uint8List> buildPdf(ResumeData data) async {
//   final doc = pw.Document();
//   final PdfColor accent = PdfColor.fromInt(0xFF2E75B6);
//   final base = pw.TextStyle(fontSize: 11);

//   // Page 1 - Header (with name) + About + Skills
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       // Header with name (only on first page)
//       pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
//         pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//           pw.Text('ARHAM SARWAR', style: pw.TextStyle(fontSize: 28, fontWeight: pw.FontWeight.bold, color: accent)),
//           pw.SizedBox(height: 6),
         
//         ]),
//         pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
//           pw.Text(data.location, style: pw.TextStyle(fontSize: 10)),
//           pw.SizedBox(height: 6),
// pw.Row(
//   children: [
//               pw.Text(data.email, style: pw.TextStyle(fontSize: 10)),
//           pw.SizedBox(height: 4),
//           pw.Text(data.phone, style: pw.TextStyle(fontSize: 10)),
//   ]
// )
//         ])
//       ]),
//       pw.SizedBox(height: 5),
//       pw.Divider(
//         // color: PdfColor.fromHex("#2E75B6")
//          color: accent
//       ),
//       pw.SizedBox(height: 8),

//       // pw.Text('About', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0xFF2E75B6))),
//       pw.SizedBox(height: 6),
//       pw.Text(data.about, style: base),
//       pw.SizedBox(height: 10),
//        pw.Divider(
//         // color: PdfColor.fromHex("#2E75B6")
//          color: accent
//       ),
//  pw.SizedBox(height: 12),
//       pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         pw.Expanded(
//             flex: 3,
//             child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//               pw.Text('Skills', style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold, color: PdfColor.fromInt(0xFF2E75B6))),
//               pw.SizedBox(height: 8),
//               // pw.Wrap(spacing: 6, runSpacing: 6, children: data.coreSkills.map((s) => pw.Container(padding: pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4), decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey300), borderRadius: pw.BorderRadius.circular(3)), child: pw.Text(s, style: base))).toList())
//           pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text("APIs ",style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 106), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(         'Flutter & Dart',
       
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 40),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
//         'GitHub Actions',style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           )
//           ,      pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text( 
//         'Firebase ',style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 85), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
//         'Backend ',
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 60),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
      
//         'CI/CD & DevOps',
// style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           )
//           ,      pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text( 
//         'State Management ',
//         style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 30), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(         
//         'AI integration',
        
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 40),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
        
//         'Databases ',style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           ),
          
          
//              pw.SizedBox(height: 10),
//        pw.Divider(
//         // color: PdfColor.fromHex("#2E75B6")
//          color: accent
//       ),
//  pw.SizedBox(height: 12),
//             ])),
            
       
     
//       ]),
//         pw.SizedBox(height: 10),
     
//     ],
//   )
//   );

//   // Page 2 - Experience (first half)
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       pw.Text('Experience', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.experience.sublist(0, (data.experience.length / 2).ceil()).map((e) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Text('${e.role} | ${e.company}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text(e.duration, style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
//             pw.SizedBox(height: 6),
//             ...e.points.map((p) => pw.Bullet(text: p, style: base)),
//             pw.SizedBox(height: 10),
//           ]))
//     ],
//   ));

//   // Page 3 - Experience (second half) + Projects (start)
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       pw.Text('Experience (contd.)', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.experience.sublist((data.experience.length / 2).ceil()).map((e) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             pw.Text('${e.role} | ${e.company}', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text(e.duration, style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
//             pw.SizedBox(height: 6),
//             ...e.points.map((p) => pw.Bullet(text: p, style: base)),
//             pw.SizedBox(height: 10),
//           ])),
//       pw.SizedBox(height: 12),
//       pw.Text('Projects', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.projects.sublist(0, (data.projects.length / 2).ceil()).map((p) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [pw.Text(p.title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)), pw.Text(p.description, style: base), pw.SizedBox(height: 8)]))
//     ],
//   ));

//   // Page 4 - Projects (rest) + Additional Skills/Tools
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       pw.Text('Projects (contd.)', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.projects.sublist((data.projects.length / 2).ceil()).map((p) => pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [pw.Text(p.title, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)), pw.Text(p.description, style: base), pw.SizedBox(height: 8)])),
//       pw.SizedBox(height: 12),
//       pw.Text('Tools & Technologies', style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       pw.Wrap(spacing: 6, runSpacing: 6, children: data.skills.map((s) => pw.Container(padding: pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4), decoration: pw.BoxDecoration(border: pw.Border.all(color: PdfColors.grey300), borderRadius: pw.BorderRadius.circular(3)), child: pw.Text(s, style: base))).toList())
//     ],
//   ));

//   return doc.save();
// }

// // ----------------------------- Data Models & Sample Content -----------------------------

// class ResumeData {
//   final String name;
//   final String title;
//   final String phone;
//   final String email;
//   final String location;
//   final String about;
//   final List<String> coreSkills;
//   final List<String> skills;
//   final List<ExperienceItem> experience;
//   final List<ProjectItem> projects;

//   ResumeData({required this.name, required this.title, required this.phone, required this.email, required this.location, required this.about, required this.coreSkills, required this.skills, required this.experience, required this.projects});

//   factory ResumeData.sampleFull() {
//     // Using and expanding the Arham Sarwar material you provided to fill 4 pages
//     return ResumeData(
//       name: 'Arham Sarwar',
//       title: 'Senior Flutter Developer | Backend • AI • Deployments',
//       phone: '+92 308 4695012',
//       email: 'arhamsarwar786@gmail.com',
//       location: 'Lahore, Pakistan',
//       about:
//           'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Passionate about building scalable, high-quality applications that drive innovation .I specialize in building robust, scalable, and visually appealing Flutter applications while integrating REST APIs, Firebase, and complex data management layers. My experience also extends to DevOps tools, project management, and cloud deployment, enabling me to handle the entire product lifecycle from planning and design to production and maintenance.',
//       coreSkills: [
//         'Flutter & Dart',
//         'Firebase (Auth, Firestore, Storage)',
//         'Backend (Node.js, Laravel, GraphQL)',
//         'CI/CD & DevOps',
//         'State Management (Provider, Riverpod, BLoC)',
//         'AI & ML integration',
//         'Databases (MySQL, PostgreSQL, MongoDB)'
//       ],
//       skills: [
//         'Push Notifications (FCM, APNs)',
//         'Docker & Kubernetes',
//         'GitHub Actions',
//         'Firebase ML Kit',
//         'OpenAI APIs',
//         'REST & GraphQL APIs'
//       ],
//       experience: [
//         ExperienceItem('Full Stack Developer (Flutter + Backend + Deployments) [Promoted]', 'Securehops', 'Sept 2023 - Jan 2025', [
//           'Developed cross-platform mobile apps using Flutter and Firebase.',
//           'Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications.',
//           'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
//           'Mentored junior developers and performed code reviews.'
//         ]),
//         ExperienceItem('Team Lead (Flutter + Backend) [Promoted]', 'Securehops', 'Jan 2023 - Jan 2025', [
//           'Led a team of Flutter developers to build and ship multiple production apps.',
//           'Planned sprint deliverables and reviewed architecture designs.',
//           'Built developer tooling and release automation.'
//         ]),
//         ExperienceItem('Senior Flutter Developer + Backend [Promoted]', 'Securehops', 'July 2022 - Jan 2025', [
//           'Designed and developed features to improve app performance and user retention.',
//           'Implemented offline-first capabilities with syncing and caching.',
//         ]),
//         ExperienceItem('Flutter Developer', 'TIDUP', 'April 2024 - Sept 2025', [
//           'Designed and developed mobile experiences for delivery business',
//           'Worked closely with product teams to ship user-facing features.'
//         ]),
//         ExperienceItem('Flutter Developer (Freelance)', 'Fiverr / Upwork', 'Apr 2020 - Sept 2022', [
//           'Delivered multiple client projects end-to-end, focusing on performance and maintainability.',
//           'Maintained strong client communication and delivered production ready apps.'
//         ]),
//         ExperienceItem('CTO & Flutter Developer', 'Haray Clark / OnPo', '2018 - 2020', [
//           'Led product development for web and mobile products, implemented payment integrations and data pipelines.'
//         ])
//       ],
//       projects: [
//         ProjectItem('Sendsorta', 'Dedicated parent-carer app providing personalized guidance, 24/7 support, and expert resources.'),
//         ProjectItem('Griot Connects', 'Platform to sell and purchase eBooks with social features.'),
//         ProjectItem('CircleUp', 'Helps entrepreneurs to find opportunities and connect with mentors.'),
//         ProjectItem('BargainEx', 'Marketplace solution for buying & selling across categories.'),
//         ProjectItem('IQRA Quran App', 'Mobile Quran app with recitations, translations and learning tools.'),
//         ProjectItem('WeTeachs', 'Education-focused app with interactive learning features.'),
//         ProjectItem('Nubes App', 'eSIM and global usage app with account management features.'),
//         ProjectItem('OnPo', 'All-in-one platform with chat, storage, jobs, accounts, and payments.'),
//         ProjectItem('Umaging', 'E-commerce app with smooth product browsing and secure transactions.'),
//       ],
//     );
//   }
// }

// class ExperienceItem {
//   final String role;
//   final String company;
//   final String duration;
//   final List<String> points;
//   ExperienceItem(this.role, this.company, this.duration, this.points);
// }

// class ProjectItem {
//   final String title;
//   final String description;
//   ProjectItem(this.title, this.description);
// }








// lib/main.dart

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

void main() {
  runApp(const MaterialApp(home: Resume4Screen()));
}

class Resume4Screen extends StatelessWidget {
  const Resume4Screen({super.key});
  final Color accent = const Color(0xFF2E75B6);

  @override
  Widget build(BuildContext context) {
    final data = ResumeData.sampleFull();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Generator'),
        backgroundColor: accent,
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () async {
              final pdfBytes = await buildPdf(data);
              await Printing.layoutPdf(onLayout: (_) => pdfBytes);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderUI(data, accent),
                const SizedBox(height: 12),
                _sectionTitle('About', accent),
                Text(data.about),
                const Divider(height: 28),
                _sectionTitle('Skills', accent),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: data.coreSkills.map((s) => Chip(label: Text(s))).toList(),
                ),
                const Divider(height: 28),
                _sectionTitle('Experience', accent),
                const SizedBox(height: 8),
                ...data.experience.map((e) => _experienceTile(e)),
                const Divider(height: 28),
                _sectionTitle('Projects', accent),
                const SizedBox(height: 8),
                ...data.projects.map((p) => _projectTile(p)),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(backgroundColor: accent),
                    icon: const Icon(Icons.print),
                    label: const Text('Print / Export PDF'),
                    onPressed: () async {
                      final pdfBytes = await buildPdf(data);
                      await Printing.layoutPdf(onLayout: (_) => pdfBytes);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderUI(ResumeData d, Color accent) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ARHAM SARWAR',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accent)),
              const SizedBox(height: 6),
              Text(d.title, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(d.location),
            const SizedBox(height: 6),
            Text(d.email),
            const SizedBox(height: 4),
            Text(d.phone),
          ],
        )
      ],
    );
  }

  Widget _sectionTitle(String t, Color accent) {
    return Row(
      children: [
        Text(t,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: accent)),
        const SizedBox(width: 8),
        Expanded(child: Container(height: 1.2, color: Colors.grey[300])),
      ],
    );
  }

  Widget _experienceTile(ExperienceItem e) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${e.role.toUpperCase()} | ${e.company}',
              style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(e.duration,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 6),
          ...e.points.map((p) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('\u2022 ', style: TextStyle(fontSize: 14)),
                  Expanded(child: Text(p)),
                ],
              ))
        ],
      ),
    );
  }

  Widget _projectTile(ProjectItem p) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(p.title,
                style: const TextStyle(fontWeight: FontWeight.w600)),
            Text(p.description)
          ]),
    );
  }
}

// ----------------------------- PDF generation -----------------------------

// Future<Uint8List> buildPdf(ResumeData data) async {
//   final doc = pw.Document();
//   final PdfColor accent = PdfColor.fromInt(0xFF2E75B6);
//   final base = pw.TextStyle(fontSize: 11);

//   // ✅ Page 1 - Header + About + Skills + Experience (only here)
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       pw.Row(
//           mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//           children: [
//             pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Text('ARHAM SARWAR',
//                       style: pw.TextStyle(
//                           fontSize: 28,
//                           fontWeight: pw.FontWeight.bold,
//                           color: accent)),
//                   pw.SizedBox(height: 6),
//                 ]),
//             pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.end,
//                 children: [
//                   pw.Text(data.location, style: pw.TextStyle(fontSize: 10)),
//                   pw.SizedBox(height: 6),
//                   pw.Row(children: [
//                     pw.Text(data.email, style: pw.TextStyle(fontSize: 10)),
//                     pw.SizedBox(width: 4),
//                     pw.Text(data.phone, style: pw.TextStyle(fontSize: 10)),
//                   ]),
//                 ])
//           ]),
//       pw.SizedBox(height: 5),
//       pw.Divider(color: accent),
//       pw.SizedBox(height: 8),
//       pw.Text(data.about, style: base),
//       pw.SizedBox(height: 10),
//       pw.Divider(color: accent),
//       pw.SizedBox(height: 12),
//       pw.Text('Skills',
//           style: pw.TextStyle(
//               fontSize: 14, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 10),
//    pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text("APIs ",style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 106), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(         'Flutter & Dart',
       
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 40),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
//         'GitHub Actions',style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           )
//           ,      pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text( 
//         'Firebase ',style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 85), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
//         'Backend ',
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 60),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
      
//         'CI/CD & DevOps',
// style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           )
//           ,      pw.Row(
//             children: [
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text( 
//         'State Management ',
//         style: pw.TextStyle(
//                 fontSize: 12
//                )), 
               
//               pw.SizedBox(width: 30), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(         
//         'AI integration',
        
//        style: pw.TextStyle(
//                 fontSize: 12
//                )) ,
//                pw.SizedBox(width: 40),
//              pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2),
//                pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ), 
//               pw.SizedBox(width: 2), 
//               pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: accent
//               ),
//                pw.SizedBox(width: 2),
//                 pw.Container(
//                 height: 8,
//                 width: 8,
//                 color: PdfColors.grey
//               ),
//                pw.SizedBox(width: 12),
//                pw.Text(       
        
//         'Databases ',style: pw.TextStyle(
//                 fontSize: 13
//                ))
//             ]
//           ),
          
          
             
 



//     pw.SizedBox(height: 10),
//       pw.Divider(color: accent),
//       pw.SizedBox(height: 12),
//       pw.Text('Experience',
//           style: pw.TextStyle(
//               fontSize: 16, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.experience.map((e) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text('${e.role} | ${e.company}',
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text(e.duration,
//                 style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700)),
//             pw.SizedBox(height: 6),
//             ...e.points.map((p) => pw.Bullet(text: p, style: base)),
//             pw.SizedBox(height: 10),
            


            
//           ])),
//     ],
//   ));

//   // ✅ Page 2 - Projects
//   doc.addPage(pw.MultiPage(
//     pageFormat: PdfPageFormat.a4,
//     margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
//     build: (pw.Context ctx) => [
//       pw.Text('Projects',
//           style: pw.TextStyle(
//               fontSize: 14, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       ...data.projects.map((p) => pw.Column(
//           crossAxisAlignment: pw.CrossAxisAlignment.start,
//           children: [
//             pw.Text(p.title,
//                 style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//             pw.Text(p.description, style: base),
//             pw.SizedBox(height: 8)
//           ])),
//       pw.SizedBox(height: 12),
//       pw.Divider(color: accent),
//       pw.SizedBox(height: 12),
//       pw.Text('Tools & Technologies',
//           style: pw.TextStyle(
//               fontSize: 14, fontWeight: pw.FontWeight.bold, color: accent)),
//       pw.SizedBox(height: 8),
//       pw.Wrap(
//           spacing: 6,
//           runSpacing: 6,
//           children: data.skills
//               .map((s) => pw.Container(
//                   padding: const pw.EdgeInsets.symmetric(
//                       horizontal: 6, vertical: 4),
//                   decoration: pw.BoxDecoration(
//                       border: pw.Border.all(color: PdfColors.grey300),
//                       borderRadius: pw.BorderRadius.circular(3)),
//                   child: pw.Text(s, style: base)))
//               .toList()),
//     ],
//   ));

//   return doc.save();
// }








Future<Uint8List> buildPdf(ResumeData data) async {
  final doc = pw.Document();
  final PdfColor accent = PdfColor.fromInt(0xFF2E75B6);
  final base = pw.TextStyle(fontSize: 11);

  // Single MultiPage that contains header, about, skills, experience AND projects
  doc.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.a4,
    margin: const pw.EdgeInsets.symmetric(horizontal: 32, vertical: 28),
    build: (pw.Context ctx) => [
      // Header
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('ARHAM SARWAR',
                  style: pw.TextStyle(
                      fontSize: 28,
                      fontWeight: pw.FontWeight.bold,
                      color: accent)),
              pw.SizedBox(height: 6),
            ],
          ),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text(data.location, style: pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 6),
              pw.Row(children: [
                pw.Text(data.email, style: pw.TextStyle(fontSize: 10)),
                pw.SizedBox(width: 4),
                pw.Text(data.phone, style: pw.TextStyle(fontSize: 10)),
              ]),
            ],
          )
        ],
      ),

      pw.SizedBox(height: 5),
      pw.Divider(color: accent),
      pw.SizedBox(height: 8),

      // About
      pw.Text(data.about, style: base),
      pw.SizedBox(height: 10),
      pw.Divider(color: accent),
      pw.SizedBox(height: 12),

      // Skills heading
      pw.Text('Skills',
          style: pw.TextStyle(
              fontSize: 14, fontWeight: pw.FontWeight.bold, color: accent)),
      pw.SizedBox(height: 10),


       pw.Row(
            children: [
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text("APIs ",style: pw.TextStyle(
                fontSize: 12
               )), 
               
              pw.SizedBox(width: 106), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(         'Flutter & Dart',
       
       style: pw.TextStyle(
                fontSize: 12
               )) ,
               pw.SizedBox(width: 40),
             pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(       
        'GitHub Actions',style: pw.TextStyle(
                fontSize: 13
               ))
            ]
          )
          ,      pw.Row(
            children: [
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text( 
        'Firebase ',style: pw.TextStyle(
                fontSize: 12
               )), 
               
              pw.SizedBox(width: 85), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(       
        'Backend ',
       style: pw.TextStyle(
                fontSize: 12
               )) ,
               pw.SizedBox(width: 60),
             pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(       
      
        'CI/CD & DevOps',
style: pw.TextStyle(
                fontSize: 13
               ))
            ]
          )
          ,      pw.Row(
            children: [
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text( 
        'State Management ',
        style: pw.TextStyle(
                fontSize: 12
               )), 
               
              pw.SizedBox(width: 30), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(         
        'AI integration',
        
       style: pw.TextStyle(
                fontSize: 12
               )) ,
               pw.SizedBox(width: 40),
             pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2),
               pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: accent
              ), 
              pw.SizedBox(width: 2), 
              pw.Container(
                height: 8,
                width: 8,
                color: accent
              ),
               pw.SizedBox(width: 2),
                pw.Container(
                height: 8,
                width: 8,
                color: PdfColors.grey
              ),
               pw.SizedBox(width: 12),
               pw.Text(       
        
        'Databases ',style: pw.TextStyle(
                fontSize: 13
               ))
            ]
          ),
          


      // (keep your existing skill rows — shortened here for brevity)
      // --- your many pw.Row(...) containers for visual skill bars / dots ---
      // You can copy the exact skill rows you already had.

      pw.SizedBox(height: 10),
      pw.Divider(color: accent),
      pw.SizedBox(height: 12),

      // Experience heading
      pw.Text('Experience',
          style: pw.TextStyle(
              fontSize: 16, fontWeight: pw.FontWeight.bold, color: accent)),
      pw.SizedBox(height: 8),

      // Experience items (flows naturally across pages)
      ...data.experience.map((e) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('${e.role} | ${e.company}',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                   pw.SizedBox(height: 5),
              pw.Text(e.duration,
                  style: pw.TextStyle(fontSize: 10, color: PdfColors.grey800)),
              pw.SizedBox(height: 6),
              ...e.points.map((p) => pw.Bullet(text: p, style: base)),
              pw.SizedBox(height: 10),
            ],
          )),

      // ===== Insert Projects right AFTER Experience (no new doc.addPage) =====
      pw.SizedBox(height: 12),
      pw.Divider(color: accent),
      pw.SizedBox(height: 12),
      pw.Text('Projects',
          style: pw.TextStyle(
              fontSize: 14, fontWeight: pw.FontWeight.bold, color: accent)),
      pw.SizedBox(height: 8),

      ...data.projects.map((p) => pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(p.title,
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(p.description, style: base),
              pw.SizedBox(height: 8)
            ],
          )),

      // Tools & Technologies (still in same MultiPage)
      pw.SizedBox(height: 12),
      pw.Divider(color: accent),
   
    ],
  ));

  return doc.save();
}

// ----------------------------- Data Models -----------------------------

class ResumeData {
  final String name;
  final String title;
  final String phone;
  final String email;
  final String location;
  final String about;
  final List<String> coreSkills;
  final List<String> skills;
  final List<ExperienceItem> experience;
  final List<ProjectItem> projects;

  ResumeData({
    required this.name,
    required this.title,
    required this.phone,
    required this.email,
    required this.location,
    required this.about,
    required this.coreSkills,
    required this.skills,
    required this.experience,
    required this.projects,
  });

  factory ResumeData.sampleFull() {
    return ResumeData(
      name: 'Arham Sarwar',
      title: 'Senior Flutter Developer | Backend • AI • Deployments',
      phone: '+92 308 4695012',
      email: 'arhamsarwar786@gmail.com',
      location: 'Lahore, Pakistan',
      about:
          'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Passionate about building scalable, high-quality applications that drive innovation. I specialize in building robust, scalable, and visually appealing Flutter applications while integrating REST APIs, Firebase, and complex data management layers. My experience also extends to DevOps tools, project management, and cloud deployment, enabling me to handle the entire product lifecycle from planning and design to production and maintenance.',
      coreSkills: [
        'Flutter & Dart',
        'Firebase (Auth, Firestore, Storage)',
        'Backend (Node.js, Laravel, GraphQL)',
        'CI/CD & DevOps',
        'State Management (Provider, Riverpod, BLoC)',
        'AI & ML integration',
        'Databases (MySQL, PostgreSQL, MongoDB)'
      ],
      skills: [
        'Push Notifications (FCM, APNs)',
        'Docker & Kubernetes',
        'GitHub Actions',
        'Firebase ML Kit',
        'OpenAI APIs',
        'REST & GraphQL APIs'
      ],
      experience: [
        ExperienceItem('Full Stack Developer (Flutter + Backend + Deployments) [Promoted]', 'Securehops',
            'Sept 2023 - Jan 2025', [
          'Developed cross-platform mobile apps using Flutter and Firebase.',
          'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
          'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
          'Mentored junior developers and performed code reviews.'
        ]),
        ExperienceItem('Team Lead (Flutter + Backend) [Promoted]', 'Securehops',
            'Jan 2023 - Jan 2025', [
          'Led a team of Flutter developers to build and ship multiple production apps.',
          'Planned sprint deliverables and reviewed architecture designs.',
          'Built developer tooling and release automation.'
        ]),
        ExperienceItem('Senior Flutter Developer + Backend [Promoted]', 'Securehops',
            'July 2022 - Jan 2025', [
          'Designed and developed features to improve app performance and user retention.',
          'Implemented offline-first capabilities with syncing and caching.'
        ]),
        ExperienceItem('Flutter Developer', 'TIDUP', 'April 2024 - Sept 2025', [
          'Designed and developed mobile experiences for delivery business.',
          'Worked closely with product teams to ship user-facing features.'
        ]),
        ExperienceItem('Flutter Developer (Freelance)', 'Fiverr / Upwork',
            'Apr 2020 - Sept 2022', [
          'Delivered multiple client projects end-to-end, focusing on performance and maintainability.',
          'Maintained strong client communication and delivered production ready apps.'
        ]),
        ExperienceItem('CTO & Flutter Developer', 'Haray Clark / OnPo',
            '2018 - 2020', [
          'Led product development for web and mobile products, implemented payment integrations and data pipelines.'
        ]),

        ExperienceItem('Flutter Developer', 'Salamigram', 'Mar 2019 - Jan 2025', [
  'As a Flutter Developer, contributing to the success of Salamly: Muslim Daily App a comprehensive app for Muslims with 50k+ downloads.',
  'Developed features for daily prayer, Quran, and Islamic tools to enhance user engagement.',
  'Played a key role in achieving over 50,000 downloads through optimized performance and user-focused updates.'
]),

ExperienceItem('Flutter Developer', 'Fiverr | Upwork', 'April 2020 - Sept 2022', [
  'Worked as a Freelance Flutter Developer on Fiverr and Upwork, delivering high-quality Flutter and backend solutions.',
  'Completed 5+ diverse projects with a focus on mobile apps, APIs, and scalable backend systems.',
  'Maintained a strong reputation through timely delivery, attention to detail, and excellent client communication.',
  'Helped clients achieve their goals with tailored, innovative solutions.'
]),

ExperienceItem('Flutter Developer', 'Securehops', 'Sept 2024 - Dec 2024', [
  'Delivered high-quality solutions with strong technical expertise, ensuring tasks of any size were completed efficiently.',
  'Applied leadership skills to manage projects holistically and drive team success.',
  'Recognized proactively by suggesting innovative ideas beyond assigned tickets.',
  'Contributed to being a reliable asset to teams and projects in Flutter/FlutterFlow development.'
]),

ExperienceItem('Flutter Developer', 'WeTeachs', 'Dec 2024 - Present', [
  'Developed and launched an app with 5K+ downloads and a 12+ content rating.',
  'Built a platform enabling users to sign up and earn by sharing their knowledge and skills.',
  'Developed learning features such as live quizzes for quick grasping of information.',
  'Integrated solutions to help users solve problems efficiently and gain the right direction.'
]),

ExperienceItem('CTO & Flutter Developer', 'Harry Clark', '2018 - Present', [
  'Currently working as a CTO & Senior Flutter Developer for an Islamic App, Wiroobook, with over 10,000 downloads.',
  'Implemented core app features using Flutter and APIs, improving login flow and boosting user retention by 40%.',
  'Created and delivered a spiritually enriching experience with design and innovative features.',
  'Achieved 10k+ downloads through robust performance, user engagement, and continuous updates.'
]),

ExperienceItem('CTO & FlutterFlow Developer', 'Griot Connects', '2018 - Present', [
  'Developed an eBook mobile app for users to buy and sell eBooks online.',
  'Implemented core architecture, payment integration, and digital library management.',
  'Enabled easy upload, search, and purchase of eBooks with a smooth user experience.',
  'Built a Flutter/FlutterFlow-based solution to support growing user and content needs.'
]),

ExperienceItem('CTO & Flutter Developer', 'IQRA Quran App', '2018 - Present', [
  'Led the development of the IQRA Quran App, providing offline access to the Holy Quran.',
  'Designed core technical strategy and architecture to ensure scalability, security, and smooth user experience.',
  'Focused on API integration and performance optimization for seamless Quran Surah and Juz experience.',
  'Created a Flutter/FlutterFlow-based solution bringing the app high performance and accessibility standards.'
]),

ExperienceItem('CTO & Flutter Developer', 'OnPo', '2018 - Present', [
  'Developed a Flutter mobile app for students to find jobs.',
  'Built Flutter web portals for employers to post jobs and admins to manage features.',
  'Managed the end-to-end deployment and production rollout of the platform.'
]),

      ],
      projects: [
        ProjectItem('BargainX', 'Bargain Exchange is your ultimate platform for buying and selling, offering a diverse range of categories from electronics to fashion and collectibles.'),
ProjectItem('Salamy', 'Discover the ultimate Islamic app for Quran reading, Islamic quotes, and social networking.'),
ProjectItem('ohReady', 'Now buy cars and order food from your mobile phone in your town. On-hand delivery and food for your app shop.'),
ProjectItem('InstaCalm Anxiety', 'InstaCalm Anxiety Treatment app, developed by a US anxiety therapist, offers effective Cognitive Behavioral Hypnotherapy Sessions for instant relief.'),
ProjectItem('Funky', 'Funky is a fun entertainment and social media application offering modes for creators, influencers, and audiences.'),
ProjectItem('Roshir Career', 'Roshir is a specialized career app on LinkedIn, tailored for recruiters and companies to build up a QR generator for streamlined professional networking.'),
ProjectItem('ohReady Admin', 'Companion food delivery app for ohReady, allowing admin control for food shops and car services.'),
ProjectItem('Fittecn', 'Fittecn is a fitness app for Arabic and Spanish speakers, a fitness-centered social network with training videos, exercise tracking, and nutrition guidance.'),
ProjectItem('Ping', 'Ping, a professional social app, facilitates local connections with features similar to LinkedIn.'),
ProjectItem('AirHomeRestaurant', 'AirHomeRestaurant is a specialized application catering to a specific community of home-based chefs and diners, acting as a platform for home-cooked meals and food sharing.'),
ProjectItem('IQRA Quran App', 'IQRA is a Quran app offering features like Quran content, prayer times, translations, and personalized AI-powered recitation progress tracking.'),
ProjectItem('Reverse Disease', 'Reverse Disease is a health tracking app that monitors fatigue, sleep, weight, and fitness progress, providing a comprehensive tool for users aiming to improve their health.'),
ProjectItem('Amici', 'Amici App is designed to streamline the process of booking a chef for entire events or parties.'),
ProjectItem('United Proposal', 'United Proposal is a matrimonial matching platform facilitating the search for relationships across faiths and cultures. The platform includes an advanced matching algorithm, AI-assisted profile scoring, and an encrypted chat system for user communication.'),
ProjectItem('PricePro', 'Application to manage menus of different branches of restaurants. Copy and sync prices for branches and add different rates.'),
ProjectItem('MyCash', 'MyCash app is a freelancer hire application designed to provide easy and secure payment processing between freelancers and employers.'),
ProjectItem('Flavourz Restaurant', 'Flavourz is a dedicated food application tailored for a specific restaurant, providing an advanced specialized platform for customers to explore its menu.'),
ProjectItem('Tritt', 'Tritt is a Flutter app resembling TrueCaller, with features such as SMS blocking, spam detection, and advanced call log and chat functionalities.'),
ProjectItem('LockSmith Guru', 'Locksmith Guru is a specialized app designed for resolving various types of lock issues. Provides contact info, services, and location tracking.'),
ProjectItem('EkCabFare', 'EkCabFare displays and compares fares between Uber, Careem, and Ola, offering users an accurate fare comparison to help save money on rides.'),
ProjectItem('SendSorta', 'SENDSORTA is a dedicated parent-care app that provides personalized guidance, 24/7 support, and expert-led resources for raising children with special needs. It empowers families with tools to manage education, care, and development holistically.'),
ProjectItem('Griot Connects', 'Griot Connects is an online platform to sell and purchase eBooks with ease, enabling readers and authors to share their digital stories, reviews, and experiences within a community-driven app.'),
ProjectItem('CircleUp', 'This platform provides students with employment opportunities while enabling employers to post jobs. Built with Flutter, it features an intuitive job-matching algorithm and personalized panel for employers and alumni networks.'),
ProjectItem('OnFekwa', 'An innovative social media app designed to help users discover the best locations in their area, focusing on social events, food, and entertainment.'),
ProjectItem('Hikary', 'Hikary is a community-driven app for travel enthusiasts, allowing users to connect, share routes, and explore destinations with offline GPS support.'),
ProjectItem('Yoblelama', 'Yoblelama is an online hiring app that connects customers with delivery or transportation services for smoother logistics. Especially trusted by food businesses.'),
ProjectItem('Muttaqi Quran App', 'Muttaqi Quran App is a digital Quran application serving a large and growing Muslim user base. It offers reading, listening, and translation features along with Tafseer support.'),
ProjectItem('Bissi Player', 'Bissi Player is an AI-based streaming app that allows users to watch their favorite movies and shows with recommendations powered by machine learning.'),
ProjectItem('Kamacee', 'Kamacee is a social platform and online marketplace app, inspired by platforms like Instagram and Facebook, integrating shopping, content creation, and messaging in one space.'),
ProjectItem('WirdBook', 'WirdBook is a spiritual guide of daily litanies rooted in Prophetic tradition, designed for Muslims to build consistency in worship and remembrance.'),
ProjectItem('WeTeachs', 'WeTeachs is an e-learning app for young individuals any skill you have learned could be taught and shared by hiring or mentoring others through the platform.'),
ProjectItem('Nubes App', 'A seamless platform to purchase clothes online with recommendations, global shipping options, and curated fashion collections.'),
ProjectItem('OnPlo', 'OnPlo is a hiring and freelancing app designed to keep user data and activities secure through blockchain-based solutions.'),
ProjectItem('Umaging', 'An advanced multi-featured eCommerce app built to provide users with a premium browsing and shopping experience with smooth transactions and secure payments.'),
ProjectItem('Visual Fraction Calculator', 'Visual Fraction Calculator is a mobile app designed to make fraction computation easy and visual for students and teachers alike.'),
ProjectItem('Rafael', 'Rafael is an event planning platform for small organizations to streamline event scheduling and budget management.'),
ProjectItem('PizzaPlay', 'PizzaPlay is an Italian-style pizza app delivery with fun logo games and rewards for customers.'),
ProjectItem('FAMS', 'FAMS is an AI-based app that helps drivers to monitor routes and manage fleet vehicles using AI features for route optimization.'),


    
    
      ],
    );
  }
}

class ExperienceItem {
  final String role;
  final String company;
  final String duration;
  final List<String> points;
  ExperienceItem(this.role, this.company, this.duration, this.points);
}

class ProjectItem {
  final String title;
  final String description;
  ProjectItem(this.title, this.description);
}
