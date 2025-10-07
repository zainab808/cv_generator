// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class Resume2Screen extends StatefulWidget {
//   const Resume2Screen({Key? key}) : super(key: key);

//   @override
//   State<Resume2Screen> createState() => _Resume2ScreenState();
// }

// class _Resume2ScreenState extends State<Resume2Screen> {
//   // 🔹 PDF Generator
//   Future<void> _generatePdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(20),
//         build: (context) {
//           return pw.Row(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               // Left Sidebar
//               pw.Container(
//                 width: 150,
//                 color: PdfColors.green900,
//                 padding: const pw.EdgeInsets.all(12),
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.center,
//                   children: [
//                     pw.Container(
//                       width: 60,
//                       height: 60,
//                       decoration: pw.BoxDecoration(
//                         shape: pw.BoxShape.circle,
//                         color: PdfColors.white,
//                       ),
//                       alignment: pw.Alignment.center,
//                       child: pw.Text("SW",
//                           style: pw.TextStyle(
//                               fontSize: 20,
//                               fontWeight: pw.FontWeight.bold,
//                               color: PdfColors.green900)),
//                     ),
//                     pw.SizedBox(height: 10),
//                     pw.Text("Sophie Walton",
//                         style: pw.TextStyle(
//                             fontSize: 14,
//                             fontWeight: pw.FontWeight.bold,
//                             color: PdfColors.white)),
//                     pw.SizedBox(height: 4),
//                     pw.Text("CUSTOMER SERVICE\nREPRESENTATIVE",
//                         textAlign: pw.TextAlign.center,
//                         style: pw.TextStyle(
//                             fontSize: 8,
//                             color: PdfColors.white,
//                             lineSpacing: 2)),

//                     pw.SizedBox(height: 20),
//                     pw.Text("Details",
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold,
//                             color: PdfColors.white)),
//                     pw.SizedBox(height: 6),
//                     pw.Text("5200 42nd Ave SW,\nSeattle, WA 98116\n"
//                         "Mobile: +1 712-219-0199\n"
//                         "Email: mswalton@seek.com\n"
//                         "LinkedIn: linkedin.com/in/sophie",
//                         style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),

//                     pw.SizedBox(height: 20),
//                     pw.Text("Skills",
//                         style: pw.TextStyle(
//                             fontWeight: pw.FontWeight.bold,
//                             color: PdfColors.white)),
//                     pw.SizedBox(height: 6),
//                     ...[
//                       "Excellent Communication Skills",
//                       "Relationship Skills",
//                       "Technology Skills",
//                       "Multitasking & Prioritization",
//                       "Time Management",
//                       "Marketing Strategies"
//                     ].map((s) => pw.Padding(
//                           padding: const pw.EdgeInsets.only(bottom: 3),
//                           child: pw.Text("• $s",
//                               style: pw.TextStyle(
//                                   fontSize: 8, color: PdfColors.white)),
//                         )),
//                   ],
//                 ),
//               ),

//               pw.SizedBox(width: 15),

//               // Right Content
//               pw.Expanded(
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text("Profile",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text(
//                         "Dedicated Customer Service Representative dedicated to providing quality care "
//                         "for ultimate customer satisfaction. Proven ability to establish and maintain "
//                         "excellent communication and relationships with clients. Adapt in general "
//                         "accounting and finance transactions. Skilled with various computer programs "
//                         "including Microsoft Office Word, Excel, PowerPoint, and Outlook. "
//                         "Bringing forth several years of experience in customer support environments.",
//                         style: pw.TextStyle(fontSize: 10)),
//                     pw.SizedBox(height: 15),

//                     pw.Text("Employment History",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 6),

//                     _jobEntry(
//                         "Branch Customer Service Representative, AT&T Inc., Seattle",
//                         [
//                           "Promoted the company’s products and services.",
//                           "Handled inbound calls and responded to inquiries.",
//                           "Worked with customers to identify needs and suggest products/services."
//                         ]),
//                     pw.SizedBox(height: 10),

//                     _jobEntry("Customer Service Representative, Gold Coast Hotel, Seattle",
//                         [
//                           "Worked with customers to identify needs and provide assistance.",
//                           "Answered phone calls and managed online reservations.",
//                           "Handled customer complaints and resolved issues in a timely manner."
//                         ]),
//                     pw.SizedBox(height: 10),

//                     _jobEntry("Customer Sales Representative, Macy’s, Bellevue", [
//                       "Assisted customers in finding clothing, shoes, and accessories.",
//                       "Maintained up-to-date knowledge of promotions and sales.",
//                       "Built positive customer relationships and ensured satisfaction."
//                     ]),

//                     pw.SizedBox(height: 15),
//                     pw.Text("Education",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text(
//                         "Bachelor of Communications, University of Seattle, Seattle - Graduated with High Honors",
//                         style: pw.TextStyle(fontSize: 10)),
//                     pw.Text("High School Diploma, Hartwick High School, Hartwick",
//                         style: pw.TextStyle(fontSize: 10)),

//                     pw.SizedBox(height: 15),
//                     pw.Text("References",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text("Melissa Leeds from Gold Coast Hotel | msleeds@coasthotel.com | 732-219-0199",
//                         style: pw.TextStyle(fontSize: 10)),
//                     pw.Text("George Kenny from AT&T | gkenny@att.com | 888-377-0823",
//                         style: pw.TextStyle(fontSize: 10)),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Show Print / Save Dialog
//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }

//   // 🔹 Helper for Job Entries
//   pw.Widget _jobEntry(String title, List<String> bullets) {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Text(title,
//             style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
//         pw.SizedBox(height: 3),
//         ...bullets.map((b) => pw.Bullet(text: b, style: pw.TextStyle(fontSize: 9))),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: const Text("Resume Example"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print, size: 28),
//             onPressed: _generatePdf,
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔹 Left Sidebar (UI)
//             Container(
//               width: 150,
//               color: Colors.green.shade900,
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.white,
//                     child: Text("SW",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green.shade900)),
//                   ),
//                   const SizedBox(height: 10),
//                   const Text("Sophie Walton",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white)),
//                   const SizedBox(height: 4),
//                   const Text("CUSTOMER SERVICE\nREPRESENTATIVE",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(fontSize: 10, color: Colors.white)),
//                   const SizedBox(height: 20),
//                   const Text("Details",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.white)),
//                   const SizedBox(height: 6),
//                   const Text(
//                       "5200 42nd Ave SW,\nSeattle, WA 98116\n"
//                       "Mobile: +1 712-219-0199\n"
//                       "Email: mswalton@seek.com\n"
//                       "LinkedIn: linkedin.com/in/sophie",
//                       style: TextStyle(fontSize: 10, color: Colors.white)),
//                   const SizedBox(height: 20),
//                   const Text("Skills",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold, color: Colors.white)),
//                   const SizedBox(height: 6),
//                   for (var s in [
//                     "Excellent Communication Skills",
//                     "Relationship Skills",
//                     "Technology Skills",
//                     "Multitasking & Prioritization",
//                     "Time Management",
//                     "Marketing Strategies"
//                   ])
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 3),
//                       child: Text("• $s",
//                           style: const TextStyle(
//                               fontSize: 10, color: Colors.white)),
//                     ),
//                 ],
//               ),
//             ),

//             const SizedBox(width: 15),

//             // 🔹 Right Content (UI)
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Profile",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 4),
//                   const Text(
//                       "Dedicated Customer Service Representative dedicated to providing quality care "
//                       "for ultimate customer satisfaction. Proven ability to establish and maintain "
//                       "excellent communication and relationships with clients. Adapt in general "
//                       "accounting and finance transactions. Skilled with various computer programs "
//                       "including Microsoft Office Word, Excel, PowerPoint, and Outlook."),
//                   const SizedBox(height: 15),

//                   const Text("Employment History",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 6),
//                   _jobEntryUI("Branch Customer Service Representative, AT&T Inc., Seattle",
//                       [
//                         "Promoted the company’s products and services.",
//                         "Handled inbound calls and responded to inquiries.",
//                         "Worked with customers to identify needs and suggest products/services."
//                       ]),
//                   const SizedBox(height: 10),
//                   _jobEntryUI("Customer Service Representative, Gold Coast Hotel, Seattle",
//                       [
//                         "Worked with customers to identify needs and provide assistance.",
//                         "Answered phone calls and managed online reservations.",
//                         "Handled customer complaints and resolved issues in a timely manner."
//                       ]),
//                   const SizedBox(height: 10),
//                   _jobEntryUI("Customer Sales Representative, Macy’s, Bellevue", [
//                     "Assisted customers in finding clothing, shoes, and accessories.",
//                     "Maintained up-to-date knowledge of promotions and sales.",
//                     "Built positive customer relationships and ensured satisfaction."
//                   ]),
//                   const SizedBox(height: 15),

//                   const Text("Education",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 4),
//                   const Text(
//                       "Bachelor of Communications, University of Seattle, Seattle - Graduated with High Honors"),
//                   const Text(
//                       "High School Diploma, Hartwick High School, Hartwick"),
//                   const SizedBox(height: 15),

//                   const Text("References",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 4),
//                   const Text(
//                       "Melissa Leeds from Gold Coast Hotel | msleeds@coasthotel.com | 732-219-0199"),
//                   const Text(
//                       "George Kenny from AT&T | gkenny@att.com | 888-377-0823"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔹 Helper for Job Entries in UI
//   Widget _jobEntryUI(String title, List<String> bullets) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
//         const SizedBox(height: 3),
//         for (var b in bullets) Text("• $b"),
//       ],
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class Resume2Screen extends StatefulWidget {
//   const Resume2Screen({Key? key}) : super(key: key);

//   @override
//   State<Resume2Screen> createState() => _Resume2ScreenState();
// }

// class _Resume2ScreenState extends State<Resume2Screen> {
//   // 🔹 PDF Generator
//   Future<void> _generatePdf() async {
//     final pdf = pw.Document();

//     // PAGE 1 (Sidebar + Profile + Jobs + Education)
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(20),
//         build: (context) {
//           return pw.Row(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               _pdfSidebar(), // Full sidebar
//               pw.SizedBox(width: 15),
//               pw.Expanded(
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text("Profile",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text(
//                         "Dedicated Customer Service Representative dedicated to providing quality care "
//                         "for ultimate customer satisfaction. Proven ability to establish and maintain "
//                         "excellent communication and relationships with clients. Adapt in general "
//                         "accounting and finance transactions. Skilled with various computer programs "
//                         "including Microsoft Office Word, Excel, PowerPoint, and Outlook. "
//                         "Bringing forth several years of experience in customer support environments.",
//                         style: pw.TextStyle(fontSize: 10)),

//                     pw.SizedBox(height: 15),
//                     pw.Text("Employment History",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 6),

//                     _jobEntry(
//                         "Branch Customer Service Representative, AT&T Inc., Seattle",
//                         [
//                           "Promoted the company’s products and services.",
//                           "Handled inbound calls and responded to inquiries.",
//                           "Worked with customers to identify needs and suggest products/services."
//                         ]),
//                     pw.SizedBox(height: 10),

//                     _jobEntry(
//                         "Customer Service Representative, Gold Coast Hotel, Seattle",
//                         [
//                           "Worked with customers to identify needs and provide assistance.",
//                           "Answered phone calls and managed online reservations.",
//                           "Handled customer complaints and resolved issues in a timely manner."
//                         ]),
//                     pw.SizedBox(height: 10),

//                     _jobEntry("Customer Sales Representative, Macy’s, Bellevue", [
//                       "Assisted customers in finding clothing, shoes, and accessories.",
//                       "Maintained up-to-date knowledge of promotions and sales.",
//                       "Built positive customer relationships and ensured satisfaction."
//                     ]),

//                     pw.SizedBox(height: 15),
//                     pw.Text("Education",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text(
//                         "Bachelor of Communications, University of Seattle, Seattle - Graduated with High Honors",
//                         style: pw.TextStyle(fontSize: 10)),
//                     pw.Text(
//                         "High School Diploma, Hartwick High School, Hartwick",
//                         style: pw.TextStyle(fontSize: 10)),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // PAGE 2 (Green container completely empty + References on right)
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(20),
//         build: (context) {
//           return pw.Row(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               // 🔹 Empty Sidebar
//               pw.Container(
//                 width: 150,
//                 color: PdfColors.green900,
//                 padding: const pw.EdgeInsets.all(12),
//               ),
//               pw.SizedBox(width: 15),
//               // 🔹 Only References section on Page 2
//               pw.Expanded(
//                 child: pw.Column(
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Text("References",
//                         style: pw.TextStyle(
//                             fontSize: 14, fontWeight: pw.FontWeight.bold)),
//                     pw.SizedBox(height: 4),
//                     pw.Text(
//                         "Melissa Leeds from Gold Coast Hotel | msleeds@coasthotel.com | 732-219-0199",
//                         style: pw.TextStyle(fontSize: 10)),
//                     pw.SizedBox(height: 6),
//                     pw.Text(
//                         "George Kenny from AT&T | gkenny@att.com | 888-377-0823",
//                         style: pw.TextStyle(fontSize: 10)),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Show Print / Save Dialog
//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }

//   // 🔹 Sidebar widget (full) for Page 1
//   pw.Widget _pdfSidebar() {
//     return pw.Container(
//       width: 150,
//       color: PdfColors.green900,
//       padding: const pw.EdgeInsets.all(12),
//       child: pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.center,
//         children: [
//           pw.Container(
//             width: 60,
//             height: 60,
//             decoration: pw.BoxDecoration(
//               shape: pw.BoxShape.circle,
//               color: PdfColors.white,
//             ),
//             alignment: pw.Alignment.center,
//             child: pw.Text("SW",
//                 style: pw.TextStyle(
//                     fontSize: 20,
//                     fontWeight: pw.FontWeight.bold,
//                     color: PdfColors.green900)),
//           ),
//           pw.SizedBox(height: 10),
//           pw.Text("Sophie Walton",
//               style: pw.TextStyle(
//                   fontSize: 14,
//                   fontWeight: pw.FontWeight.bold,
//                   color: PdfColors.white)),
//           pw.SizedBox(height: 4),
//           pw.Text("CUSTOMER SERVICE\nREPRESENTATIVE",
//               textAlign: pw.TextAlign.center,
//               style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),

//           pw.SizedBox(height: 20),
//           pw.Text("Details",
//               style: pw.TextStyle(
//                   fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
//           pw.SizedBox(height: 6),
//           pw.Text("5200 42nd Ave SW,\nSeattle, WA 98116\n"
//               "Mobile: +1 712-219-0199\n"
//               "Email: mswalton@seek.com\n"
//               "LinkedIn: linkedin.com/in/sophie",
//               style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),

//           pw.SizedBox(height: 20),
//           pw.Text("Skills",
//               style: pw.TextStyle(
//                   fontWeight: pw.FontWeight.bold, color: PdfColors.white)),
//           pw.SizedBox(height: 6),
//           ...[
//             "Excellent Communication Skills",
//             "Relationship Skills",
//             "Technology Skills",
//             "Multitasking & Prioritization",
//             "Time Management",
//             "Marketing Strategies"
//           ].map((s) => pw.Padding(
//                 padding: const pw.EdgeInsets.only(bottom: 3),
//                 child: pw.Text("• $s",
//                     style: pw.TextStyle(fontSize: 8, color: PdfColors.white)),
//               )),
//         ],
//       ),
//     );
//   }

//   // 🔹 Helper for job entries
//   pw.Widget _jobEntry(String title, List<String> bullets) {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.start,
//       children: [
//         pw.Text(title,
//             style: pw.TextStyle(fontSize: 11, fontWeight: pw.FontWeight.bold)),
//         pw.SizedBox(height: 3),
//         ...bullets.map(
//             (b) => pw.Bullet(text: b, style: pw.TextStyle(fontSize: 9))),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Resume Example"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print, size: 28),
//             onPressed: _generatePdf,
//           ),
//         ],
//       ),
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // 🔹 Left Sidebar UI
//           Container(
//             width: 150,
//             color: Colors.green.shade900,
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   width: 60,
//                   height: 60,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   alignment: Alignment.center,
//                   child: const Text("SW",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.green)),
//                 ),
//                 const SizedBox(height: 10),
//                 const Text("Sophie Walton",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white)),
//                 const SizedBox(height: 4),
//                 const Text("CUSTOMER SERVICE\nREPRESENTATIVE",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 8, color: Colors.white)),

//                 const SizedBox(height: 20),
//                 const Text("Details",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.white)),
//                 const SizedBox(height: 6),
//                 const Text("5200 42nd Ave SW,\nSeattle, WA 98116\n"
//                     "Mobile: +1 712-219-0199\n"
//                     "Email: mswalton@seek.com\n"
//                     "LinkedIn: linkedin.com/in/sophie",
//                     style: TextStyle(fontSize: 8, color: Colors.white)),

//                 const SizedBox(height: 20),
//                 const Text("Skills",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.white)),
//                 const SizedBox(height: 6),
//                 ...[
//                   "Excellent Communication Skills",
//                   "Relationship Skills",
//                   "Technology Skills",
//                   "Multitasking & Prioritization",
//                   "Time Management",
//                   "Marketing Strategies"
//                 ].map((s) => Padding(
//                       padding: const EdgeInsets.only(bottom: 3),
//                       child: Text("• $s",
//                           style:
//                               const TextStyle(fontSize: 8, color: Colors.white)),
//                     )),
//               ],
//             ),
//           ),
//           const SizedBox(width: 15),
//           // 🔹 Right Content UI
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(12),
//               children: const [
//                 Text("Profile",
//                     style:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 4),
//                 Text(
//                   "Dedicated Customer Service Representative dedicated to providing quality care for ultimate customer satisfaction. "
//                   "Proven ability to establish and maintain excellent communication and relationships with clients. "
//                   "Adapt in general accounting and finance transactions. Skilled with various computer programs "
//                   "including Microsoft Office Word, Excel, PowerPoint, and Outlook.",
//                   style: TextStyle(fontSize: 10),
//                 ),
//                 SizedBox(height: 15),
//                 Text("Employment History",
//                     style:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 6),
//                 Text("Branch Customer Service Representative, AT&T Inc., Seattle",
//                     style:
//                         TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
//                 Text("• Promoted the company’s products and services.\n"
//                     "• Handled inbound calls and responded to inquiries.\n"
//                     "• Worked with customers to identify needs and suggest products/services."),
//                 SizedBox(height: 10),
//                 Text("Customer Service Representative, Gold Coast Hotel, Seattle",
//                     style:
//                         TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
//                 Text("• Worked with customers to identify needs and provide assistance.\n"
//                     "• Answered phone calls and managed online reservations.\n"
//                     "• Handled customer complaints and resolved issues in a timely manner."),
//                 SizedBox(height: 10),
//                 Text("Customer Sales Representative, Macy’s, Bellevue",
//                     style:
//                         TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
//                 Text("• Assisted customers in finding clothing, shoes, and accessories.\n"
//                     "• Maintained up-to-date knowledge of promotions and sales.\n"
//                     "• Built positive customer relationships and ensured satisfaction."),
//                 SizedBox(height: 15),
//                 Text("Education",
//                     style:
//                         TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                 Text(
//                     "Bachelor of Communications, University of Seattle, Seattle - Graduated with High Honors"),
//                 Text("High School Diploma, Hartwick High School, Hartwick"),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }







// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';


// const Color kLeftGreen = Color(0xFF0C6A57); // adjust if you want exact green
// const double leftColumnWidth = 260;


//   @override
     
   
// class Resume2Screen extends StatelessWidget {
//    Resume2Screen({super.key});

//   // --- This is the material extracted from the 6 images you provided.
//   // I included the main sections below. Edit text if you want exact wording tweaks.
//   final String aboutText = '''
// Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.
// ''';

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

//   final List<Map<String, String>> experiences = [
//     {
//       'role': 'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'SecureHops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'details':
//           'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications. Implemented CI/CD pipelines and cloud deployments (AWS/GCP). Promoted for delivering high-quality solutions and mentoring junior developers.'
//     },
//     {
//       'role': 'Team Lead (Flutter + Backend) [Promoted]',
//       'company': 'SecureHops',
//       'period': 'Jan 2023 - Jan 2025',
//       'details':
//           'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
//     },
//     {
//       'role': 'Senior Flutter & Backend Developer [Promoted]',
//       'company': 'SecureHops',
//       'period': 'July 2022 - Jan 2025',
//       'details':
//           'Built and maintained scalable mobile apps, integrated backend services, and improved app delivery pipelines.'
//     },
//     {
//       'role': 'Flutter Developer',
//       'company': 'TYDUP LTD',
//       'period': 'April 2024 - Sept 2025',
//       'details':
//           'Designed and developed a mobile app to connect customers with on-demand cleaning services. Implemented server-driven UI and profile modules.'
//     },
//     // The images included many freelance & other positions (Fiverr, WeTeach, VeTech etc.)
//     {
//       'role': 'Flutter Developer (Freelance / Contracts)',
//       'company': 'Fiverr / Upwork / Various',
//       'period': '2019 - 2024',
//       'details':
//           'Worked on dozens of projects including consumer apps, e-commerce, and utility apps. Delivered high-quality code, well-documented APIs, and user-centric design.'
//     },
//   ];

//   final List<String> coreSkills = [
//     'Flutter & Dart - Cross-Platform Development, iOS & Android',
//     'Firebase Suite - Auth, Firestore, Storage, Cloud Functions',
//     'Backend Development - Node.js, Laravel, REST, GraphQL, Express.js',
//     'State Management - Provider, Riverpod, BLoC, GetX, Cubit',
//     'DevOps & Deployment - CI/CD, Docker, Kubernetes, GitHub Actions',
//     'AI & ML Integration - TensorFlow Lite, Firebase ML Kit, OpenAI APIs',
//     'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
//     'Version Control - Git, GitHub, GitLab, Bitbucket',
//     'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',
//   ];

//   // Projects - condensed list taken from the last images. Add/edit as needed.
//   final List<Map<String, String>> projects = [
//     {
//       'title': 'Sendsorta',
//       'tag': 'Mobile Application',
//       'desc': 'Personalized guidance app with 24/7 support and case resources.'
//     },
//     {
//       'title': 'Griot Connects',
//       'tag': 'Mobile Application',
//       'desc': 'Social marketplace for sellers and buyers with secure checkout.'
//     },
//     {
//       'title': 'CircleUp',
//       'tag': 'Mobile Application',
//       'desc': 'Platform to create events and connect local businesses.'
//     },
//     {
//       'title': 'InstaCalm Anxiety',
//       'tag': 'Mobile Application',
//       'desc': 'Anxiety therapy helper with relaxation sessions and content.'
//     },
//     {
//       'title': 'BargainEx',
//       'tag': 'Mobile Application',
//       'desc': 'E-commerce platform for buying and selling categories.'
//     },
//     {
//       'title': 'Salamy',
//       'tag': 'Mobile Application',
//       'desc': 'Islamic daily prayer and Quran app.'
//     },
//     {
//       'title': 'Ping',
//       'tag': 'Mobile Application',
//       'desc': 'Proximity-based social app connecting nearby contacts.'
//     },
//     {
//       'title': 'Globe',
//       'tag': 'Website + Backend',
//       'desc': 'Interactive website with unique user interaction visuals.'
//     },
//     {
//       'title': 'Certainlini',
//       'tag': 'Website + Backend',
//       'desc': 'Platform for building compliance and certification workflows.'
//     },
//   ];

//   final List<String> references = [
//     'Melissa Leeds from Gold Coast Hotel — melissagoldcoast.com | 732-219-0199',
//     'George Kenny from AT&T — gkenny@att.com | 888-977-0923'
//   ];

//   // --- End content definitions

//   // Helper to build the left column (profile)
//   Widget _buildLeftColumn(BuildContext context) {
//     return 
    
//     Container(
//       height: 2000,
//       width: leftColumnWidth,
//       color: kLeftGreen,
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Avatar and name
//           Center(
//             child: Column(
//               children: [
//                 CircleAvatar(
//                   radius: 36,
//                   backgroundColor: Colors.white,
//                   child: Text(
//                     'AS',
//                     style: TextStyle(
//                       color: kLeftGreen,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 const Text(
//                   'ARHAM SARWAR',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 6),
//                 const Text(
//                   'Senior Flutter Developer (Backend + AI + Deployment)',
//                   style: TextStyle(color: Colors.white70, fontSize: 12),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 22),
//           const Divider(color: Colors.white24),
//           const SizedBox(height: 8),

//           // Contact
//           const Text('Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           const Text('Address: 5200 42nd Ave SW, Seattle', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 6),
//           const Text('Mobile: +92 308 4695012', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 6),
//           const Text('Email: arham.sarwar786@gmail.com', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 6),
//           const Text('LinkedIn: linkedin.com/in/arham-sarwar', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 18),

//           // Skills vertical list
//           const Text('Skills', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           _skillChip('Flutter & Dart'),
//           _skillChip('Firebase Suite'),
//           _skillChip('Backend APIs'),
//           _skillChip('CI/CD & DevOps'),
//           _skillChip('AI/ML Integration'),
//           const Spacer(),

//           // small footer note
//           const Text(
//             'Available for freelance & full-time roles',
//             style: TextStyle(color: Colors.white70, fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _skillChip(String label) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 6),
//       padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
//     );
//   }

//   Widget _buildRightColumn(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile / About
//             const Text('Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(aboutText, style: const TextStyle(fontSize: 14, height: 1.4)),
//             const SizedBox(height: 14),

//             // Employment History
//             const Text('Employment History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             ...experiences.map((e) => _buildExperienceCard(e)).toList(),
//             const SizedBox(height: 12),

//             // Education
//             const Text('Education', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             ...education.map((ed) => _buildEducationRow(ed)).toList(),
//             const SizedBox(height: 12),

//             // Core skills
//             const Text('Core Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             ...coreSkills.map((s) => _bulletText(s)).toList(),
//             const SizedBox(height: 12),

//             // Projects (we appended projects)
//             const Text('Projects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             ...projects.map((p) => _buildProjectRow(p)).toList(),
//             const SizedBox(height: 12),

//             // References
//             const Text('References', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             ...references.map((r) => _bulletText(r)).toList(),

//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildExperienceCard(Map<String, String> e) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(border: Border(left: BorderSide(color: kLeftGreen, width: 4))),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Text('${e['role']}', style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 4),
//         Text('${e['company']} • ${e['period']}', style: const TextStyle(fontSize: 12, color: Colors.black54)),
//         const SizedBox(height: 8),
//         Text('${e['details']}', style: const TextStyle(fontSize: 13, height: 1.4)),
//       ]),
//     );
//   }

//   Widget _buildEducationRow(Map<String, String> ed) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(ed['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(ed['institution'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.black54)),
//               Text(ed['years'] ?? '', style: const TextStyle(fontSize: 12, color: Colors.black54)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _bulletText(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('• ', style: TextStyle(fontSize: 16)),
//           Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
//         ],
//       ),
//     );
//   }

//   Widget _buildProjectRow(Map<String, String> p) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(Icons.folder_open, size: 18, color: Colors.grey[700]),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(p['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//               const SizedBox(height: 2),
//               Text('${p['tag']} — ${p['desc']}', style: const TextStyle(fontSize: 13, color: Colors.black87)),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }

//   // ----- PDF generation -----
//   Future<Uint8List> _generatePdf(PdfPageFormat format) async {
//     final doc = pw.Document(pageMode: PdfPageMode.fullscreen);

// // final pw.Font helvetica = pw.Font.helvetica();
//  // using open sans from pdf package helper

//     // create a multi-page layout: left column (green) and right content column
//     // We'll break content into sections and let the pdf engine paginate.
//     // Helper to build header block for each "page section" in pdf widgets.
//     pw.Widget leftProfile = pw.Container(
//       width: 160,
//       color: PdfColor.fromHex('#0C6A57'),
//       padding: const pw.EdgeInsets.all(10),
//       child: pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Container(
//             alignment: pw.Alignment.center,
//             child: pw.Container(
//               width: 64,
//               height: 64,
//               decoration: pw.BoxDecoration(
//                 color: PdfColor.fromInt(0xffffffff),
//                 shape: pw.BoxShape.circle,
//               ),
//               child: pw.Center(
//                 child: pw.Text('AS', style: pw.TextStyle(fontSize: 20, color: PdfColor.fromInt(0xFF0C6A57))),
//               ),
//             ),
//           ),
//           pw.SizedBox(height: 8),
//           pw.Text('ARHAM SARWAR', style: pw.TextStyle( color: PdfColor.fromInt(0xffffffff), fontSize: 12, fontWeight: pw.FontWeight.bold)),
//           pw.SizedBox(height: 6),
//           pw.Text('Senior Flutter Developer (Backend + AI + Deployment)', style: pw.TextStyle( color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//           pw.SizedBox(height: 10),
//           pw.Divider(color: PdfColor.fromInt(0xffffffff)),
//           pw.SizedBox(height: 6),
//           pw.Text('Details', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontWeight: pw.FontWeight.bold)),
//           pw.SizedBox(height: 6),
//           pw.Text('Mobile: +92 308 4695012', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//           pw.Text('Email: arham.sarwar786@gmail.com', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//           pw.Text('LinkedIn: linkedin.com/in/arham-sarwar', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//           pw.SizedBox(height: 10),
//           pw.Text('Skills', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontWeight: pw.FontWeight.bold)),
//           pw.SizedBox(height: 6),
//           for (var s in coreSkills.take(5)) pw.Container(margin: const pw.EdgeInsets.only(bottom: 4), child: pw.Text('• $s', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8))),
//         ],
//       ),
//     );

//     // Right column content builder (stack all sections into a list of pw.Widget)
//     List<pw.Widget> rightContent = [];

//     rightContent.add(pw.Text('Profile', style: pw.TextStyle( fontSize: 14, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     rightContent.add(pw.Text(aboutText, style: pw.TextStyle( fontSize: 10)));
//     rightContent.add(pw.SizedBox(height: 8));

//     rightContent.add(pw.Text('Employment History', style: pw.TextStyle( fontSize: 12, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     for (var e in experiences) {
//       rightContent.add(pw.Container(
//         margin: const pw.EdgeInsets.only(bottom: 6),
//         child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//           pw.Text(e['role'] ?? '', style: pw.TextStyle( fontSize: 11, fontWeight: pw.FontWeight.bold)),
//           pw.Text('${e['company']} • ${e['period']}', style: pw.TextStyle( fontSize: 9, color: PdfColor.fromInt(0xff666666))),
//           pw.SizedBox(height: 4),
//           pw.Text(e['details'] ?? '', style: pw.TextStyle( fontSize: 10)),
//         ]),
//       ));
//     }

//     rightContent.add(pw.SizedBox(height: 8));
//     rightContent.add(pw.Text('Education', style: pw.TextStyle( fontSize: 12, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     for (var ed in education) {
//       rightContent.add(pw.Row(children: [
//         pw.Expanded(child: pw.Text(ed['title'] ?? '', style: pw.TextStyle( fontSize: 10, fontWeight: pw.FontWeight.bold))),
//         pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
//           pw.Text(ed['institution'] ?? '', style: pw.TextStyle( fontSize: 9, color: PdfColor.fromInt(0xff555555))),
//           pw.Text(ed['years'] ?? '', style: pw.TextStyle( fontSize: 9, color: PdfColor.fromInt(0xff555555))),
//         ])
//       ]));
//     }

//     rightContent.add(pw.SizedBox(height: 8));
//     rightContent.add(pw.Text('Core Skills', style: pw.TextStyle( fontSize: 12, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     for (var s in coreSkills) {
//       rightContent.add(pw.Text('. $s', style: pw.TextStyle( fontSize: 9)));
//     }

//     rightContent.add(pw.SizedBox(height: 8));
//     rightContent.add(pw.Text('Projects', style: pw.TextStyle( fontSize: 12, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     for (var p in projects) {
//       rightContent.add(pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         pw.Container(width: 12, child: pw.Text('•')),
//         pw.SizedBox(width: 4),
//         pw.Expanded(child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//           pw.Text(p['title'] ?? '', style: pw.TextStyle( fontSize: 10, fontWeight: pw.FontWeight.bold)),
//           pw.Text('${p['tag']} — ${p['desc']}', style: pw.TextStyle( fontSize: 9)),
//         ])),
//       ]));
//       rightContent.add(pw.SizedBox(height: 6));
//     }

//     rightContent.add(pw.SizedBox(height: 8));
//     rightContent.add(pw.Text('References', style: pw.TextStyle( fontSize: 12, fontWeight: pw.FontWeight.bold)));
//     rightContent.add(pw.SizedBox(height: 6));
//     for (var r in references) rightContent.add(pw.Text('. $r', style: pw.TextStyle( fontSize: 9)));

//     // Now create pages: we will create a multi-column page where leftProfile is fixed and rightContent is flowed.
//     // We'll add multiple pages until all right content is consumed.
//     // Simpler approach: build a big column and add it to a MultiPage; the Pdf engine will paginate automatically.
//     doc.addPage(
//       pw.MultiPage(
//         pageFormat: format,
//         margin: const pw.EdgeInsets.all(20),
//         build: (context) {
//           return [
//             pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//               // left fixed column
//               pw.Container(width: 160, child: leftProfile),
//               pw.SizedBox(width: 12),
//               // right column fills remaining width
//               pw.Expanded(child: pw.Column(children: rightContent)),
//             ]),
//           ];
//         },
//       ),
//     );

//     return doc.save();
//   }

//   void _onPrintPressed(BuildContext context) {
//     // Use the Printing package to layout and print PDF
//     Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
//       return await _generatePdf(format);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CV - Arham Sarwar'),
//         backgroundColor: kLeftGreen,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             tooltip: 'Print / Export PDF',
//             onPressed: () => _onPrintPressed(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Row(
//           children: [
//             _buildLeftColumn(context),
//             _buildRightColumn(context),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: kLeftGreen,
//         child: const Icon(Icons.file_download),
//         onPressed: () {
//           // also allow quick export
//           _onPrintPressed(context);
//         },
//       ),
//     );
//   }
// }









// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';

// const Color kLeftGreen = Color(0xFF0C6A57);
// const double leftColumnWidth = 260;

// class Resume2Screen extends StatelessWidget {
//   Resume2Screen({super.key});

//   final String aboutText = '''
// Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.
// ''';

//   final List<Map<String, String>> education = [
//     {'title': 'Bachelors in Information Technology', 'institution': 'University of Punjab Lahore', 'years': '2019 - 2023'},
//     {'title': 'F.Sc Pre-Engineering', 'institution': 'Islamia College, Lahore', 'years': '2016 - 2019'},
//     {'title': 'Matric', 'institution': 'Islamia High School, Lahore', 'years': '2014 - 2016'},
//   ];

//   final List<Map<String, String>> experiences = [
//     {
//       'role': 'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
//       'company': 'SecureHops | www.securehops.com',
//       'period': 'Sept 2023 - Jan 2025',
//       'details': 'Developed cross-platform mobile apps using Flutter and Firebase. Integrated and developed backend APIs (Node.js, Laravel, GraphQL) for scalable applications. Implemented CI/CD pipelines and cloud deployments (AWS/GCP).'
//     },
//     {
//       'role': 'Team Lead (Flutter + Backend)',
//       'company': 'SecureHops',
//       'period': 'Jan 2023 - Jan 2025',
//       'details': 'Led team, developed cross-platform apps, integrated backend systems, implemented CI/CD and cloud deployments, mentored junior devs.'
//     },
//     {
//       'role': 'Flutter Developer',
//       'company': 'TYDUP LTD',
//       'period': 'April 2024 - Sept 2025',
//       'details': 'Designed and developed a mobile app to connect customers with on-demand cleaning services. Implemented server-driven UI and profile modules.'
//     },
//     {
//       'role': 'Flutter Developer (Freelance / Contracts)',
//       'company': 'Fiverr / Upwork / Various',
//       'period': '2019 - 2024',
//       'details': 'Worked on dozens of projects including consumer apps, e-commerce, and utility apps. Delivered high-quality code, well-documented APIs, and user-centric design.'
//     },
//   ];

//   final List<String> coreSkills = [
//     'Flutter & Dart - Cross-Platform Development, iOS & Android',
//     'Firebase Suite - Auth, Firestore, Storage, Cloud Functions',
//     'Backend Development - Node.js, Laravel, REST, GraphQL, Express.js',
//     'State Management - Provider, Riverpod, BLoC, GetX, Cubit',
//     'DevOps & Deployment - CI/CD, Docker, Kubernetes, GitHub Actions',
//     'AI & ML Integration - TensorFlow Lite, Firebase ML Kit, OpenAI APIs',
//     'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
//     'Version Control - Git, GitHub, GitLab, Bitbucket',
//     'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',
//   ];

//   final List<Map<String, String>> projects = [
//     {'title': 'Sendsorta', 'tag': 'Mobile Application', 'desc': 'Personalized guidance app with 24/7 support and case resources.'},
//     {'title': 'Griot Connects', 'tag': 'Mobile Application', 'desc': 'Social marketplace for sellers and buyers with secure checkout.'},
//     {'title': 'CircleUp', 'tag': 'Mobile Application', 'desc': 'Platform to create events and connect local businesses.'},
//     {'title': 'InstaCalm Anxiety', 'tag': 'Mobile Application', 'desc': 'Anxiety therapy helper with relaxation sessions and content.'},
//     {'title': 'BargainEx', 'tag': 'Mobile Application', 'desc': 'E-commerce platform for buying and selling categories.'},
//     {'title': 'Salamy', 'tag': 'Mobile Application', 'desc': 'Islamic daily prayer and Quran app.'},
//     {'title': 'Ping', 'tag': 'Mobile Application', 'desc': 'Proximity-based social app connecting nearby contacts.'},
//     {'title': 'Globe', 'tag': 'Website + Backend', 'desc': 'Interactive website with unique user interaction visuals.'},
//     {'title': 'Certainlini', 'tag': 'Website + Backend', 'desc': 'Platform for building compliance and certification workflows.'},
//   ];

//   final List<String> references = [
//     'Melissa Leeds — melissagoldcoast.com | 732-219-0199',
//     'George Kenny — gkenny@att.com | 888-977-0923'
//   ];

//   Widget _buildLeftColumn(BuildContext context) {
//     return Container(
      
//       width: leftColumnWidth,
//       color: kLeftGreen,
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Column(
//               children: const [
//                 CircleAvatar(radius: 36, backgroundColor: Colors.white, child: Text('AS', style: TextStyle(color: kLeftGreen, fontSize: 24, fontWeight: FontWeight.bold))),
//                 SizedBox(height: 12),
//                 Text('ARHAM SARWAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
//                 SizedBox(height: 6),
//                 Text('Senior Flutter Developer (Backend + AI + Deployment)', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
//               ],
//             ),
//           ),
//           const SizedBox(height: 22),
//           const Divider(color: Colors.white24),
//           const Text('Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 6),
//           const Text('Mobile: +92 308 4695012', style: TextStyle(color: Colors.white70)),
//           const Text('Email: arham.sarwar786@gmail.com', style: TextStyle(color: Colors.white70)),
//           const Text('LinkedIn: linkedin.com/in/arham-sarwar', style: TextStyle(color: Colors.white70)),
//           const SizedBox(height: 18),
//           const Text('Skills', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           ...coreSkills.take(6).map((e) => Padding(
//                 padding: const EdgeInsets.only(bottom: 6),
//                 child: Text(e, style: const TextStyle(color: Colors.white70, fontSize: 12)),
//               )),
//           const Spacer(),
//           const Text('Available for freelance & full-time roles', style: TextStyle(color: Colors.white70, fontSize: 12)),
//         ],
//       ),
//     );
//   }

//   Widget _buildRightColumn(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//           Text(aboutText),
//           const SizedBox(height: 16),
//           const Text('Employment History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           ...experiences.map((e) => Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Text(e['role'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
//                   Text('${e['company']} • ${e['period']}', style: const TextStyle(fontSize: 12)),
//                   Text(e['details'] ?? '', style: const TextStyle(fontSize: 13)),
//                 ]),
//               )),
//           const SizedBox(height: 16),
//           const Text('Education', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           ...education.map((e) => Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Text('${e['title']} - ${e['institution']} (${e['years']})'),
//               )),
//           const SizedBox(height: 16),
//           const Text('Core Skills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           ...coreSkills.map((s) => Text('• $s')),
//           const SizedBox(height: 16),
//           const Text('Projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           ...projects.map((p) => Text('${p['title']} — ${p['desc']}')),
//           const SizedBox(height: 16),
//           const Text('References', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//           ...references.map((r) => Text('• $r')),
//         ]),
//       ),
//     );
//   }

//   Future<Uint8List> _generatePdf(PdfPageFormat format) async {
//     final doc = pw.Document();

//     final leftProfile = pw.Container(
//       width: 160,
//       color: PdfColor.fromHex('#0C6A57'),
//       padding: const pw.EdgeInsets.all(10),
//       child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//         pw.Center(
//           child: pw.Container(
//             width: 64,
//             height: 64,
//             decoration: pw.BoxDecoration(shape: pw.BoxShape.circle, color: PdfColor.fromInt(0xffffffff)),
//             child: pw.Center(child: pw.Text('AS', style: pw.TextStyle(color: PdfColor.fromHex('#0C6A57')))),
//           ),
//         ),
//         pw.SizedBox(height: 10),
//         pw.Text('ARHAM SARWAR', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontWeight: pw.FontWeight.bold)),
//         pw.SizedBox(height: 6),
//         pw.Text('Senior Flutter Developer (Backend + AI + Deployment)', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//         pw.SizedBox(height: 10),
//         pw.Text('Mobile: +92 308 4695012', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//         pw.Text('Email: arham.sarwar786@gmail.com', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//         pw.Text('LinkedIn: linkedin.com/in/arham-sarwar', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//         pw.SizedBox(height: 10),
//         pw.Text('Skills', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontWeight: pw.FontWeight.bold)),
//         for (var s in coreSkills.take(5)) pw.Text('• $s', style: pw.TextStyle(color: PdfColor.fromInt(0xffffffff), fontSize: 8)),
//       ]),
//     );

//     doc.addPage(
//       pw.MultiPage(
//         margin: const pw.EdgeInsets.all(20),
//         pageFormat: format,
//         build: (context) => [
//           pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//             leftProfile,
//             pw.SizedBox(width: 10),
//             pw.Expanded(
//               child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                 pw.Text('Profile', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
//                 pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
//                 pw.SizedBox(height: 8),
//                 pw.Text('Employment History', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                 for (var e in experiences)
//                   pw.Padding(
//                     padding: const pw.EdgeInsets.only(top: 6),
//                     child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
//                       pw.Text(e['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
//                       pw.Text('${e['company']} • ${e['period']}', style: const pw.TextStyle(fontSize: 9)),
//                       pw.Text(e['details'] ?? '', style: const pw.TextStyle(fontSize: 9)),
//                     ]),
//                   ),
//                 pw.SizedBox(height: 8),
//                 pw.Text('Education', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                 for (var ed in education) pw.Text('${ed['title']} - ${ed['institution']} (${ed['years']})', style: const pw.TextStyle(fontSize: 9)),
//                 pw.SizedBox(height: 8),
//                 pw.Text('Core Skills', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                 for (var s in coreSkills) pw.Text('• $s', style: const pw.TextStyle(fontSize: 9)),
//                 pw.SizedBox(height: 8),
//                 pw.Text('Projects', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                 for (var p in projects)
//                   pw.Text('${p['title']} — ${p['desc']}', style: const pw.TextStyle(fontSize: 9)),
//                 pw.SizedBox(height: 8),
//                 pw.Text('References', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
//                 for (var r in references) pw.Text('• $r', style: const pw.TextStyle(fontSize: 9)),
//               ]),
//             ),
//           ]),
//         ],
//       ),
//     );

//     return doc.save();
//   }

//   void _onPrintPressed(BuildContext context) {
//     Printing.layoutPdf(onLayout: (PdfPageFormat format) async => await _generatePdf(format));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('CV - Arham Sarwar'),
//         backgroundColor: kLeftGreen,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.print),
//             onPressed: () => _onPrintPressed(context),
//           ),
//         ],
//       ),
//       body: 
      
      
//       Row(children: [_buildLeftColumn(context), _buildRightColumn(context)]),
//     );
//   }
// }








import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

const Color kLeftGreen = Color(0xFF0C6A57);
const double leftColumnWidth = 260;

class Resume2Screen extends StatelessWidget {
  Resume2Screen({super.key});

  final String aboutText = '''
Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps, with expertise in backend systems and AI solutions. Passionate about building scalable, high-quality applications that drive innovation.
''';

  final List<Map<String, String>> education = [
    {'title': 'Bachelors in Information Technology', 'institution': 'University of Punjab Lahore', 'years': '2019 - 2023'},
    {'title': 'F.Sc Pre-Engineering', 'institution': 'Islamia College, Lahore', 'years': '2016 - 2019'},
    {'title': 'Matric', 'institution': 'Islamia High School, Lahore', 'years': '2014 - 2016'},
  ];

  final List<Map<String, String>> experiences = [
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
     {
      'role': 'Flutter Developer _ WeQed',
     
      'period': 'Dec 2024 _ Present',
      'details': 'Developed and launched an app with 5K+ downloads and a 12+ content rating.'

'Built a performing learning app to sign up and earn by sharing their knowledge and skills.'

'Developed features such as user sign-in, rewards system, and teacher/student dashboards.'

'Designed solutions to help users solve problems efficiently and gain the right direction.'

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
           
   
   
    
    
  ];
  final List<String> coreSkills = [
       'Flutter & Dart - Cross-Platform Development, Android',

    'Firebase Suite - Auth, Firestore, Storage, Functions',
    'Backend Development - Node.js, Laravel,  GraphQL',
    'State Management - Provider, Riverpod, BLoC, Cubit',
    'DevOps & Deployment - CI/CD, Docker, Kubernetes ',
    'AI & ML Integration - TensorFlow Lite, Firebase Kit',
    'Databases - MySQL, PostgreSQL, MongoDB, SQLite',
    'Version Control - Git, GitHub, GitLab, Bitbucket',
    'Project Tools - Jira, Trello, ClickUp, Agile/Scrum',

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

  final List<String> references = [
    'Melissa Leeds — melissagoldcoast.com | 732-219-0199',
    'George Kenny — gkenny@att.com | 888-977-0923'
  ];

  // ✅ LEFT COLUMN FIXED
  Widget _buildLeftColumn(BuildContext context) {
    return Container(
      width: leftColumnWidth,
      color: kLeftGreen,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: const [
                CircleAvatar(radius: 36, backgroundColor: Colors.white, child: Text('AS', style: TextStyle(color: kLeftGreen, fontSize: 24, fontWeight: FontWeight.bold))),
                SizedBox(height: 12),
                Text('ARHAM SARWAR', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 6),
                Text('Senior Flutter Developer', style: TextStyle(color: Colors.white70, fontSize: 12), textAlign: TextAlign.center),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Divider(color: Colors.white24),
          const Text('Details', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          const Text('Mobile: +92 308 4695012', style: TextStyle(color: Colors.white70)),
          const Text('Email: arham.sarwar786@gmail.com', style: TextStyle(color: Colors.white70)),
          const Text('LinkedIn: linkedin.com/in/arham-sarwar', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 18),
          const Text('Top Skills', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...coreSkills.take(4).map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(e, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              )),
          const Spacer(),
          const Text('Available for freelance & full-time roles', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRightColumn(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text(aboutText),
          const SizedBox(height: 16),
          const Text('Employment History', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ...experiences.map((e) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(e['role'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('${e['company']} • ${e['period']}', style: const TextStyle(fontSize: 12)),
                  Text(e['details'] ?? '', style: const TextStyle(fontSize: 13)),
                ]),
              )),
          const SizedBox(height: 16),
          const Text('Education', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ...education.map((e) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('${e['title']} - ${e['institution']} (${e['years']})'),
              )),
          const SizedBox(height: 16),
          const Text('Projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ...projects.map((p) => Text('${p['title']} — ${p['desc']}')),
          const SizedBox(height: 16),
          const Text('References', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ...references.map((r) => Text('• $r')),
        ]),
      ),
    );
  }

  // ✅ PDF with 4 Pages
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final doc = pw.Document();

    pw.Widget leftProfile() => pw.Container(
          width: 160,
          color: PdfColor.fromHex('#084A3F'),
          padding: const pw.EdgeInsets.all(10),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
               pw.SizedBox(height: 20),
              pw.Center(
                child: pw.Container(
                  width: 40,
                  height: 40,
                  decoration: pw.BoxDecoration(shape: pw.BoxShape.circle, color: PdfColors.white),
                  child: pw.Center(child: pw.Text('AS', style: pw.TextStyle(color: PdfColor.fromHex('#0C6A57')))),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Text('ARHAM SARWAR', style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold,fontSize: 14)),
             
              pw.Text('...', style: pw.TextStyle(color: PdfColors.white,)),
              pw.SizedBox(height: 3),

              pw.Text('Senior Flutter Developer', style: pw.TextStyle(color: PdfColors.white, fontSize: 11)),
         
           
           pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              //  pw.Divider(color: PdfColors.white),
                   pw.SizedBox(height: 20),
              pw.Text('Details', style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold,fontSize: 14)),
    pw.SizedBox(height: 10),
              pw.Text('Mobile: +92 308 4695012', style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
             pw.SizedBox(height: 5),
             
              pw.Text('Email: arham.sarwar786@gmail.com', style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
             
               pw.SizedBox(height: 5),
             
              pw.Text('Linkedin:arham-sarwar-a1b56b176 ', style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
             
              pw.SizedBox(height: 20),
              pw.Text('Skills', style: pw.TextStyle(color: PdfColors.white, fontWeight: pw.FontWeight.bold,fontSize: 14)), 
              pw.SizedBox(height: 10),
              pw.Text('Flutter Cross-Platform Development',
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ),
   pw.SizedBox(height: 5),

  pw.Text('Firebase Suite_Cloud Functions',
    
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ),
 pw.SizedBox(height: 5), pw.Text(
    'Backend Development ',
    
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ), 
 pw.SizedBox(height: 5),pw.Text(
    'State Management',

 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ), 
 pw.SizedBox(height: 5),pw.Text(
    'DevOps & Deployment ',
    
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ), 
 pw.SizedBox(height: 5),pw.Text(
    'AI & ML Integration',

 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ),
 pw.SizedBox(height: 5), pw.Text(
    'Databases ',
  
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ),
 pw.SizedBox(height: 5), pw.Text(
    'Version Control ',
   
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ), 
 pw.SizedBox(height: 5),pw.Text(
    'Project Tools ',
 style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
   pw.SizedBox(height: 10),
 pw.Container(
  height: 4,
  decoration: pw.BoxDecoration(color: PdfColors.white,
  borderRadius: pw.BorderRadius.circular(3))
 ),
              
              // for (var s in coreSkills.take(10)) pw.Text(' $s', style: pw.TextStyle(color: PdfColors.white, fontSize: 8)),
             pw.SizedBox(height: 10),
            ]
           )
            ],
          ),

          
        );

    // Page 1
    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Row(children: [
          leftProfile(),
          pw.SizedBox(width: 20),
          pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              pw.Text('Profile', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColor.fromHex('#084A3F'),)),
             pw.SizedBox(height:  10),
              pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
              pw.SizedBox(height: 8),
              pw.Text('Experience', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColor.fromHex('#084A3F'),)),
              for (var e in experiences)
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(e['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 11)),
             pw.SizedBox(height:  3),

                    pw.Text(' ${e['period']}', style:  pw.TextStyle(fontSize: 8,fontWeight: pw.FontWeight.bold)),
                     pw.SizedBox(height:  3),
                    pw.Text(e['details'] ?? '', style: const pw.TextStyle(fontSize: 10)),
                  ]),
                ),
              // pw.SizedBox(height: 8),
             
            ]),
          ),
        ]),
      ),
    );

    // Page 2
    doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 160,
         color: PdfColor.fromHex('#084A3F'),
          padding: const pw.EdgeInsets.all(10),
          
          ),
        
          pw.SizedBox(width: 10),
       pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
              // pw.Text('Profile', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
              // pw.Text(aboutText, style: const pw.TextStyle(fontSize: 10)),
              // pw.SizedBox(height: 8),
              // pw.Text('Employment History', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
              for (var e in experiences2)
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 6),
                  child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                    pw.Text(e['role'] ?? '', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
                              pw.SizedBox(height:  3),
                    pw.Text(' ${e['period']}', style: const pw.TextStyle(fontSize: 9)),
                             pw.SizedBox(height:  3),
                    pw.Text(e['details'] ?? '', style: const pw.TextStyle(fontSize: 9)),
                  ]),
                ),
              pw.SizedBox(height: 20),
           
              pw.Text('Education', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColor.fromHex('#084A3F'),)),
              pw.SizedBox(height: 10),
            
              for (var ed in education) pw.Text('${ed['title']} - ${ed['institution']} (${ed['years']})', style: const pw.TextStyle(fontSize: 12)),
             
                            pw.SizedBox(height: 20),
              
               pw.Text(' Skills', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 15,color: PdfColor.fromHex('#084A3F'))),
                                        pw.SizedBox(height: 10),
              for (var s in coreSkills) pw.Text(' $s', style:  pw.TextStyle(fontSize: 12,)),
                pw.SizedBox(height:  20),
              pw.Text('Projects', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14,  color: PdfColor.fromHex('#084A3F'),)),


            ]),
          ),
    
        ]),
      ),
    );


// page 3
      doc.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 160,
           color: PdfColor.fromHex('#084A3F'),
          padding: const pw.EdgeInsets.all(10),
          
          ),
        
          pw.SizedBox(width: 10),
          pw.Expanded(
            child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
             
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
        pageFormat: format,
        build: (context) => pw.Row(children: [
          pw.Container(
          width: 160,
        color: PdfColor.fromHex('#084A3F'),
          padding: const pw.EdgeInsets.all(10),
          
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
              pw.SizedBox(height: 10),
              pw.Text('References', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 12)),
              for (var r in references) pw.Text('• $r', style: const pw.TextStyle(fontSize: 9)),
            ]),
          ),
        ]),
      ),
    );


    return doc.save();
  }

  void _onPrintPressed(BuildContext context) {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async => await _generatePdf(format));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CV - Arham Sarwar'),
        backgroundColor: kLeftGreen,
        actions: [
          IconButton(icon: const Icon(Icons.print), onPressed: () => _onPrintPressed(context)),
        ],
      ),
      body: Row(children: [_buildLeftColumn(context), _buildRightColumn(context)]),
    );
  }
}
