// Updated Flutter resume UI with left-aligned header and vertical divider between columns
// One-page two-column layout with name/title on top and divider separating columns

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

@override
final condensedResume = ResumeData(
  name: 'ARHAM ',
  surname: 'SARWAR',
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
    'Databases: MySQL, PostgreSQL, MongoDB',
  ],
  experiences: [
    Experience(
      role: 'CTO & Senior Flutter Developer',
      company: '',
      period: 'Dec 2024 _Present',
      bullets: [
        'Led architecture and delivery of multiple Flutter apps (10K+ downloads).',
        'Improved retention by 70% via performance and UX improvements.',
      ],
    ),
    Experience(
      role: 'Flutter Developer _ Self',
      company: '',
      period: 'Sept 2024 _ Dec 2024',
      bullets: [
        'Delivered high-quality solutions with strong technical expertise, ensuring tasks of any size were completed efficiently.',
      ],
    ),
    Experience(
      role: 'CTO & FlutterFlow Developer _ Griot Contents',

      period: 'Jan 2024 _ Present',

      company: '',
      bullets: [
        'Developed an eBook app for users to buy and sell eBooks online.',
      ],
    ),
    Experience(
      role: 'Team Lead | Full Stack Flutter',
      company: '',
      period: 'Jan 2023 _ Jan 2025',
      bullets: [
        'Led teams, delivered cross-platform apps, and set CI/CD pipelines.',
        'Mentored juniors and owned deployments.',
      ],
    ),
  ],
  education: [
    Education(
      degree: 'Bachelors in Information Technology',
      institute: 'University of Punjab, Lahore',
      year: '2019 _2023',
    ),
      Education(
      degree:  'F.Sc Pre-Engineering',
      institute: 'Islamia College, Lahore',
      year:  '2016 - 2019',
    ),  Education(
      degree: 'Matric',
      institute: 'Islamia High School, Lahore',
      year: '2014_2016',
    ),
  ],
  projects: [
    'IQRA Quran App — offline Quran, prayer times, 10K+ downloads',
    'Griot Connects — social marketplace with secure checkout',
    'WeTeachs — learn & earn platform with teacher dashboards',
  ],
);

class Resume1Page extends StatelessWidget {
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
          ),
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
        Text(
          data.name,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        Text(
          data.title,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
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
                  ...data.experiences.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: ExperienceWidget(e),
                    ),
                  ),
                  SizedBox(height: 10),
                  sectionTitle('EDUCATION'),
                  ...data.education.map(
                    (ed) => Text(
                      '${ed.degree}, ${ed.institute} (${ed.year})',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
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
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );

  Widget info(String label, String value) => Padding(
    padding: const EdgeInsets.only(bottom: 4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
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
        Text(
          '${e.role}, ${e.company}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(e.period, style: TextStyle(color: Colors.black54, fontSize: 12)),
        ...e.bullets.map((b) => Text('• $b', style: TextStyle(fontSize: 12))),
      ],
    );
  }
}

Future<Uint8List> generatePdf(ResumeData data) async {
  final doc = pw.Document();

  doc.addPage(
    pw.Page(
      margin: pw.EdgeInsets.only(top: 30, left: 30, right: 30),
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              data.name,
              style: pw.TextStyle(fontSize: 34, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 3),

            pw.Text(
              data.surname,
              style: pw.TextStyle(fontSize: 34, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 15),

            pw.Text(
              data.title,
              style: pw.TextStyle(fontSize: 14, color: PdfColors.grey800),
            ),
            pw.SizedBox(height: 25),
            pw.Divider(thickness: 0.3,color: PdfColors.black),
            pw.SizedBox(height: 10),

            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  flex: 1,

                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'DETAILS',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 2),

                      pw.Container(
                        height: 3,
                        width: 40,
                        decoration: pw.BoxDecoration(
                          borderRadius: pw.BorderRadius.circular(2),
                          color: PdfColors.black,
                        ),
                      ),
                      pw.SizedBox(height: 15),
                      pw.Text(
                        'LOCATION',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(data.location),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'PHONE',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(data.phone),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'EMAIL',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(data.email),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'NATIONALITY',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Text(data.nationality),
                      pw.SizedBox(height: 20),

                      pw.Text(
                        ' SKILLS',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      pw.SizedBox(height: 3),
                      pw.Container(
                        height: 3,
                        width: 40,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(2),
                        ),
                      ),
                      pw.SizedBox(height: 15),

                      pw.Text(
                        'Flutter Cross-Platform Development',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),

                      pw.Text(
                        'Firebase Suite_Cloud Functions',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Backend Development ',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'State Management',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'DevOps & Deployment ',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'AI & ML Integration',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Databases ',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Version Control ',

                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        'Project Tools ',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                      pw.SizedBox(height: 20),

                      pw.Text(
                        'LANGUAGES',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      pw.Container(
                        height: 2.5,
                        width: 40,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(2),
                        ),
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'English',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                       pw.SizedBox(height: 5),
                      pw
                      .Text(
                        'Urdu',
                        style: pw.TextStyle(
                          color: PdfColors.black,
                          fontSize: 9,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Container(
                        height: 4,
                        width: 160,
                        decoration: pw.BoxDecoration(
                          color: PdfColors.black,
                          borderRadius: pw.BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                ),

                pw.Container(width: 1, height: 600, color: PdfColors.black),
                pw.SizedBox(width: 10),
                pw.Expanded(
                  flex: 2,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'PROFILE',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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

                      pw.Text(data.profile, style: pw.TextStyle(fontSize: 10)),
                      pw.SizedBox(height: 10),
                      pw.Container(
                        height: 1,
                        width: double.infinity,
                        color: PdfColors.grey,
                      ),
                      pw.SizedBox(height: 10),
                      pw.Text(
                        'EXPERIENCE',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                      ...data.experiences.map(
                        (e) => pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              '${e.role}, ${e.company}',
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.SizedBox(height: 2),

                            pw.Text(
                              e.period,
                              style: pw.TextStyle(
                                fontSize: 9,
                                color: PdfColors.grey800,
                              ),
                            ),
                            pw.SizedBox(height: 4),

                            ...e.bullets.map(
                              (b) => pw.Text(
                                ' $b',
                                style: pw.TextStyle(fontSize: 10),

                              ),


                          

                            ),
                             pw.SizedBox(height: 5),
                          ],
                        ),
                      ),
                      pw.SizedBox(height: 10),
                       pw.SizedBox(height: 10),
                      pw.Text(
                        'EDUCATION',
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                      ...data.education.map(
                        (ed) => pw.Text(
                          '${ed.degree},\n ${ed.institute}\n (${ed.year})\n\n',
                          style: pw.TextStyle(fontSize: 9,fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );

  return await doc.save();
}

class ResumeData {
  final String name,
      surname,
      title,
      location,
      phone,
      email,
      nationality,
      profile;
  final List<String> coreSkills, languages, projects;
  final List<Experience> experiences;
  final List<Education> education;
  ResumeData({
    required this.name,
    required this.surname,
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
  Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.bullets,
  });
}

class Education {
  final String degree, institute, year;
  Education({
    required this.degree,
    required this.institute,
    required this.year,
  });
}
