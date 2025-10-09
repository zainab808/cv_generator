// Updated Flutter resume UI with left-aligned header and vertical divider between columns
// One-page two-column layout with name/title on top and divider separating columns

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

  @override


final condensedResume = ResumeData(
  name: 'ARHAM SARWAR',
  title: 'Senior Flutter Developer',
  location: 'Lahore, Pakistan',
  phone: '+92 308 4695012',
  email: 'arhamsarwar786@gmail.com',
  nationality: 'Pakistani',
  languages: ['English', 'Urdu'],
  profile:
      'Senior Flutter developer with 6+ years building scalable cross-platform apps. Strong Firebase, backend, and CI/CD experience. Passionate about performance and user-centric design.',
  coreSkills: [
    'Flutter & Dart',
    'Firebase (Auth, Firestore, Functions)',
    'State Mgmt (Provider, Riverpod, GetX)',
    'Backend: Node.js / REST / GraphQL',
    'CI/CD, Docker, GitHub Actions',
    'Databases: MySQL, PostgreSQL, MongoDB'
  ],
  experiences: [
    Experience(
      role: 'CTO & Senior Flutter Developer',
      company: 'Harry Chat / Multiple',
      period: 'Dec 2024 — Present',
      bullets: [
        'Led architecture and delivery of multiple Flutter apps (10K+ downloads).',
        'Improved retention by 70% via performance and UX improvements.'
      ],
    ),
    Experience(
      role: 'Team Lead / Full Stack Flutter',
      company: 'Freelance & Agencies',
      period: 'Jan 2023 — Jan 2025',
      bullets: [
        'Led teams, delivered cross-platform apps, and set CI/CD pipelines.',
        'Mentored juniors and owned deployments.'
      ],
    ),
  ],
  education: [
    Education(
      degree: 'Bachelors in Information Technology',
      institute: 'University of Punjab, Lahore',
      year: '2019 — 2023',
    ),
  ],
  projects: [
    'IQRA Quran App — offline Quran, prayer times, 10K+ downloads',
    'Griot Connects — social marketplace with secure checkout',
    'WeTeachs — learn & earn platform with teacher dashboards'
  ],
);

class Resume3Page  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('One-page Resume — ARHAM SARWAR'),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            tooltip: 'Export PDF',
            onPressed: () async {
              final pdfBytes = await generatePdf(condensedResume);
              await Printing.layoutPdf(onLayout: (_) async => pdfBytes);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ResumePage(data: condensedResume),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResumePage extends StatelessWidget {
  final ResumeData data;
  ResumePage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(data.name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        Text(data.title,
            style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        SizedBox(height: 16),

        // Divider under header
        Divider(thickness: 1, color: Colors.black87),
        SizedBox(height: 12),

        // Two-column layout
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('DETAILS'),
                  info('ADDRESS', data.location),
                  info('PHONE', data.phone),
                  info('EMAIL', data.email),
                  info('NATIONALITY', data.nationality),
                  SizedBox(height: 10),
                  sectionTitle('SKILLS'),
                  ...data.coreSkills.map((s) => Text('• $s')),
                  SizedBox(height: 10),
                  sectionTitle('LANGUAGES'),
                  ...data.languages.map((l) => Text(l)),
                ],
              ),
            ),

            // Vertical Divider
            Container(width: 1, height: 600, color: Colors.grey[400]),
            SizedBox(width: 18),

            // Right Column
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('PROFILE'),
                  Text(data.profile),
                  SizedBox(height: 10),
                  sectionTitle('EMPLOYMENT HISTORY'),
                  ...data.experiences.map((e) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ExperienceWidget(e),
                      )),
                  SizedBox(height: 10),
                  sectionTitle('EDUCATION'),
                  ...data.education.map((ed) => Text(
                      '${ed.degree}, ${ed.institute} (${ed.year})',
                      style: TextStyle(fontSize: 13))),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget sectionTitle(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      );

  Widget info(String label, String value) => Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            Text(value, style: TextStyle(fontSize: 13)),
          ],
        ),
      );
}

class ExperienceWidget extends StatelessWidget {
  final Experience e;
  ExperienceWidget(this.e);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${e.role}, ${e.company}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        Text(e.period, style: TextStyle(color: Colors.black54, fontSize: 12)),
        ...e.bullets.map((b) => Text('• $b', style: TextStyle(fontSize: 12)))
      ],
    );
  }
}

Future<Uint8List> generatePdf(ResumeData data) async {
  final doc = pw.Document();

  doc.addPage(
    pw.Page(
    
      margin: pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
          pw.Text(data.name, style: pw.TextStyle(fontSize: 22, fontWeight: pw.FontWeight.bold)),
          pw.Text(data.title, style: pw.TextStyle(fontSize: 12)),
          pw.Divider(thickness: 1),
          pw.SizedBox(height: 10),
          pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Expanded(
              flex: 1,
              child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('DETAILS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(data.location),
                pw.Text(data.phone),
                pw.Text(data.email),
                pw.Text(data.nationality),
                pw.SizedBox(height: 8),
                pw.Text('SKILLS', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ...data.coreSkills.map((s) => pw.Text('• $s', style: pw.TextStyle(fontSize: 9))),
                pw.SizedBox(height: 8),
                pw.Text('LANGUAGES', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ...data.languages.map((l) => pw.Text(l)),
              ]),
            ),
            pw.Container(width: 1, height: 600, 
            
            color: PdfColors.black
            
            ),
            pw.SizedBox(width: 10),
            pw.Expanded(
              flex: 2,
              child: pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
                pw.Text('PROFILE', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                pw.Text(data.profile, style: pw.TextStyle(fontSize: 10)),
                pw.SizedBox(height: 10),
                pw.Text('EMPLOYMENT HISTORY',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ...data.experiences.map((e) => pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('${e.role}, ${e.company}', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
                        pw.Text(e.period, style: pw.TextStyle(fontSize: 9, color: PdfColors.grey600)),
                        ...e.bullets.map((b) => pw.Text('• $b', style: pw.TextStyle(fontSize: 9)))
                      ],
                    )),
                pw.SizedBox(height: 10),
                pw.Text('EDUCATION', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ...data.education.map((ed) => pw.Text('${ed.degree}, ${ed.institute} (${ed.year})', style: pw.TextStyle(fontSize: 9)))
              ]),
            ),
          ])
        ]);
      },
    ),
  );

  return await doc.save();
}

class ResumeData {
  final String name, title, location, phone, email, nationality, profile;
  final List<String> coreSkills, languages, projects;
  final List<Experience> experiences;
  final List<Education> education;
  ResumeData({
    required this.name,
    required this.title,
    required this.location,
    required this.phone,
    required this.email,
    required this.nationality,
    required this.profile,
    required this.coreSkills,
    required this.languages,
    required this.experiences,
    required this.education,
    required this.projects,
  });
}

class Experience {
  final String role, company, period;
  final List<String> bullets;
  Experience({required this.role, required this.company, required this.period, required this.bullets});
}

class Education {
  final String degree, institute, year;
  Education({required this.degree, required this.institute, required this.year});
}