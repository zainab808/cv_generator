

// lib/main.dart
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

final Color accent = const Color(0xFFD0B9BC); // muted rose header
final Color sidebar = const Color(0xFFB69DA2); // darker rose sidebar

class Resume3Page extends StatefulWidget {
  const Resume3Page({Key? key}) : super(key: key);

  @override
  State<Resume3Page> createState() => _Resume3PageState();
}

class _Resume3PageState extends State<Resume3Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: sidebar,
        title: const Text('One-page Résumé — Donna style (Arham content)'),
        actions: [
          IconButton(
            tooltip: 'Export PDF',
            onPressed: () async {
              final pdfBytes = await buildPdf();
              await Printing.sharePdf(
                bytes: pdfBytes,
                filename: 'Arham_Sarwar_Resume.pdf',
              );
            },
            icon: const Icon(Icons.picture_as_pdf),
          ),
          IconButton(
            tooltip: 'Print / Preview',
            onPressed: () async {
              final doc = await buildPdfDocument();
              await Printing.layoutPdf(onLayout: (format) => doc.save());
            },
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: AspectRatio(
            aspectRatio: 0.7,
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  // LEFT SIDEBAR
                  Flexible(
                    flex: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: sidebar,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 14,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 96,
                              height: 96,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 4,
                                ),
                                image: const DecorationImage(
                                  image: AssetImage('flower/ap.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'PROFILE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Senior Flutter Developer skilled in Flutter, Firebase, and backend systems solutions. Looking forward to leadership opportunities.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'CONTACT ME',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'PHONE:\n+92 308 4695012',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'LINKEDIN:\narham-sarwar-a1b56b176',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'EMAIL:\narham.sarwar786@gmail.com',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // RIGHT MAIN AREA
                  Flexible(
                    flex: 65,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          color: accent,
                          padding: const EdgeInsets.symmetric(
                            vertical: 18,
                            horizontal: 20,
                          ),
                          width: double.infinity,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                'ARHAM\nSARWAR',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w900,
                                  height: 0.95,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Senior Flutter Developer',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 20,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SectionTitle(title: 'EDUCATION'),
                                  SizedBox(height: 6),
                                  BoldText(
                                    'Bachelors in Information Technology',
                                  ),
                                  SizedBox(height: 2),
                                  SmallText(
                                    'University of Punjab Lahore • 2019 - 2023',
                                  ),
                                  SizedBox(height: 12),
                                  SectionTitle(title: 'EXPERIENCE'),
                                  SizedBox(height: 6),
                                  ExperienceItem(
                                    role:
                                        'Full Stack Developer (Flutter + Backend + Deployments) [Promoted]',
                                    period: 'Sept 2023 - Jan 2025',
                                    bullets: [
                                      'Developed cross-platform mobile apps using Flutter and Firebase.',
                                      'Integrated backend APIs (Node.js, Laravel, GraphQL).',
                                      'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
                                    ],
                                  ),
                                  ExperienceItem(
                                    role: 'Team Lead (Flutter + Backend)',
                                    period: 'Jan 2023 - Jan 2025',
                                    bullets: [
                                      'Led team, developed cross-platform apps, implemented CI/CD.',
                                      'Mentored junior devs and reviewed architecture.',
                                    ],
                                  ),
                                  ExperienceItem(
                                    role:
                                        'CTO & Flutter Developer — Harry Chat',
                                    period: 'Dec 2024 - Present',
                                    bullets: [
                                      'Designed and developed core features for the app.',
                                      'Improved workflows and retention; 10K+ downloads.',
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  SectionTitle(title: 'PROJECTS'),
                                  SizedBox(height: 6),
                                  SmallText(
                                    '• Salamy — Islamic daily prayer & Quran app\n• BargainEx — E-commerce app\n• WirdBook — Spiritual guide app\n• IQRA Quran App — Offline Quran features, prayer times\n• WeTeachs — Learn and earn app\n• Umazing — Multi-functional eCommerce platform',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) => Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
  );
}

class BoldText extends StatelessWidget {
  final String text;
  const BoldText(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
  );
}

class SmallText extends StatelessWidget {
  final String text;
  const SmallText(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      Text(text, style: const TextStyle(fontSize: 12, color: Colors.black87));
}

class ExperienceItem extends StatelessWidget {
  final String role;
  final String period;
  final List<String> bullets;
  const ExperienceItem({
    Key? key,
    required this.role,
    required this.period,
    required this.bullets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
          ),
          Text(
            period,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 6),
          ...bullets
              .map((b) => Text('• $b', style: const TextStyle(fontSize: 12)))
              .toList(),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
 pw.Widget experienceItem({
    required String role,
    required String period,
    required List<String> bullets,
  }) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 20),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(role,
              style: pw.TextStyle( fontSize: 12, color: PdfColors.black,fontWeight: pw.FontWeight.bold)),
          pw.Text(period,
              style: pw.TextStyle(
                  fontSize: 11, color: PdfColors.grey700)),
          // pw.SizedBox(height: 3),
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: bullets
                .map((b) => pw.Bullet(
                      text: b,
                      style: pw.TextStyle( fontSize: 11),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

Future<Uint8List> buildPdf() async {
  final doc = await buildPdfDocument();
  return doc.save();
}

Future<pw.Document> buildPdfDocument() async {
  final doc = pw.Document();

  Uint8List? photoBytes;
  try {
    final data = await rootBundle.load('flower/ap.jpg');
    photoBytes = data.buffer.asUint8List();
  } catch (_) {
    photoBytes = null;
  }
  final pw.MemoryImage? photo = photoBytes != null
      ? pw.MemoryImage(photoBytes)
      : null;

  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      margin: const pw.EdgeInsets.all(20),
      build: (context) {
        return pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Left sidebar
            pw.Container(
              width: 190,
              padding: const pw.EdgeInsets.all(20),
              color: PdfColor.fromInt(0xFFB69DA2),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 20),
                  if (photo != null)
                    pw.Center(
                      child: pw.ClipOval(
                        child: pw.Image(
                          photo,
                          width: 145,
                          height: 170,
                          fit: pw.BoxFit.cover,
                        ),
                      ),
                    ),
                  pw.SizedBox(height: 30),
                  pw.Text(
                    'PROFILE',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      font: 
                      pw.Font.timesBold(),
                      fontSize: 15,
                      color: PdfColor.fromInt(0xFFFFFFFF),
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'Senior Flutter Developer in mobile app development.\n\n Skilled in Flutter, Firebase, with expertise in backend systems solutions. \n\nLooking forward to team leadership opportunities.',
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xFFFFFFFF),
                      fontSize: 12,
                    ),
                  ),

                  pw.SizedBox(height: 40),
                  pw.Text(
                    'CONTACT ME',
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromInt(0xFFFFFFFF),
                      fontSize: 15,    font: 
                      pw.Font.timesBold(),
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'PHONE:\n+92 308 4695012',
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xFFFFFFFF),
                      fontSize: 12,
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'LINKEDIN:\narham-sarwar-a1b56b176',
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xFFFFFFFF),
                      fontSize: 12,
                    ),
                  ),
                  pw.SizedBox(height: 6),
                  pw.Text(
                    'EMAIL:\narham.sarwar786@gmail.com',
                    style: pw.TextStyle(
                      color: PdfColor.fromInt(0xFFFFFFFF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            // Right side content
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Header connected to sidebar
                  pw.Container(
                    height: 200,
                    width: double.infinity,
                    padding: const pw.EdgeInsets.only(top: 60, left: 20),
                    color: PdfColor.fromInt(0xFFD0B9BC),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'ARHAM\nSARWAR',
                          style: pw.TextStyle(
                            fontSize: 35,
                            fontWeight: pw.FontWeight.bold,
                               font: 
                      pw.Font.timesBold(),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Senior Flutter Developer',
                          style: pw.TextStyle(
                            fontSize: 13,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Body with 20pt left padding
                  pw.Padding(
                    padding: const pw.EdgeInsets.only(
                      left: 20,
                      top: 35,
                      right: 10,
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'EDUCATION',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,   font: 
                      pw.Font.timesBold(),
                          ),
                        ),
                        pw.SizedBox(height: 15),
                        pw.Text(
                          'Bachelors in Information Technology',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        pw.SizedBox(height: 5),

                        pw.Text(
                          'University of Punjab Lahore  2019 _ 2023',
                          style: pw.TextStyle(fontSize: 13),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'F.Sc Pre-Engineering',

                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        pw.SizedBox(height: 5),

                        pw.Text(
                          'institution Islamia College, Lahore 2016 _ 2019',
                          style: pw.TextStyle(fontSize: 13),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Matric',

                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          'Islamia High School, Lahore 2014 _ 2016',

                          style: pw.TextStyle(fontSize: 13),
                        ),
                         
                        pw.SizedBox(height: 20),

                         pw.Text(
                          'EXPERIENCE',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,   font: 
                      pw.Font.timesBold(),
                          ),
                        ),
                        pw.SizedBox(height: 15),










  // 🔹 Helper Widget for Experience Items
 

  
    
      
       

            // 🔸 Experience 1
            experienceItem(
              role:
                  'Full Stack Developer (Flutter + Backend + Deployments) ',
              period: 'Sept 2023 - Jan 2025',
              bullets: [
                'Developed cross-platform mobile apps using Flutter and Firebase.',
                'Integrated backend APIs (Node.js, Laravel, GraphQL).',
                'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
              ],
            ),

            // 🔸 Experience 2
            experienceItem(
              role: 'Team Lead (Flutter + Backend)',
              period: 'Jan 2023 - Jan 2025',
              bullets: [
                'Led team, developed cross-platform apps, implemented CI/CD.',
                'Mentored junior devs and reviewed architecture.',
              ],
            ),

            // 🔸 Experience 3
            // experienceItem(
            //   role: 'CTO & Flutter Developer — Harry Chat',
            //   period: 'Dec 2024 - Present',
            //   bullets: [
            //     'Designed and developed core features for the app.',
            //     'Improved workflows and retention; 10K+ downloads.',
            //   ],
            // ),
      
        
 
                        
                        // pw.Bullet(
                     
                        //   text:
                        //       'Full Stack Developer (Flutter + Backend + Deployments) Promoted _ Sept 2023 _ Jan 2025',
                        // ),
                        // pw.Bullet(
                        //   text:
                        //       'Developed cross-platform apps and managed cloud deployments (AWS/GCP).',
                        // ),
                        // pw.Bullet(
                        //   text:
                        //       'Team Lead (Flutter + Backend) _ Jan 2023 _ Jan 2025',
                        // ),
                        // pw.Bullet(text: 'Led team, implemented CI/CD.'),
                        // pw.Bullet(
                        //   text:
                        //       'CTO & Flutter Developer _ Harry Chat _ Dec 2024 _ Present',
                        // ),
                        // pw.Bullet(
                        //   text: 'Designed core features; 10K+ downloads.',
                        // ),
                     

                                               pw.SizedBox(height: 5),

                         pw.Text(
                          'PROJECTS',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,   font: 
                      pw.Font.timesBold(),
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Bullet(
                          text: 'Salamy_ Islamic daily prayer & Quran app',
                        ),
                        pw.Bullet(text: 'BargainEx_ E-commerce platform'),
                        pw.Bullet(text: 'WirdBook_ Spiritual guide app'),
                        pw.Bullet(
                          text:
                              'IQRA Quran App_ Offline Quran and prayer times',
                        ),
                        // pw.Bullet(
                        //   text: 'WeTeachs_ Learn and earn platform for tutors',
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  return doc;
}
