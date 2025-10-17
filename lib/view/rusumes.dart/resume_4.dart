import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';





class _ProjectTile extends StatelessWidget {
  final String title, desc;
  const _ProjectTile({required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(desc, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}


class Resume4Page extends StatelessWidget {
  Resume4Page({super.key});

  static const Color blue = Color(0xFF1E5AA8);

  // ------------------ DATA ------------------
  final String name = 'ARHAM SARWAR';
  final String contact =
      '                                                      Lahore, Pakistan  \n arhamsarwar786@gmail.com  |  +92 308 4695012';

  final String summary =
      'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Passionate about building scalable, high-quality applications that drive innovation. Skilled in Flutter, REST APIs, Firebase, CI/CD, and backend architecture. Experienced in managing full product lifecycles and leading teams from concept to deployment.Combines deep technical knowledge with strong problem-solving and communication skills to bridge product vision and execution.';

  final List<String> skills = [
    'Flutter & Dart',
    'Firebase',
    'REST APIs',
    'Backend Integration',
    'CI/CD',
    'DevOps',
    'GitHub Actions',
    'State Management',
    'AI Integration',
    'Databases',
  ];

  final List<Map<String, dynamic>> experience = [
    {
      'role':
          'Full Stack Developer (Flutter + Backend + Deployments) [Promoted] | Securehops',
      'date': 'Sept 2023 - Jan 2025',
      'points': [
        'Developed cross-platform mobile apps using Flutter and Firebase.',
        'Integrated and developed backend APIs (Node.js, Laravel, GraphQL).',
        'Implemented CI/CD pipelines and cloud deployments (AWS/GCP).',
        'Mentored junior developers and performed code reviews.',
      ],
    },
    {
      'role': 'Team Lead (Flutter + Backend) [Promoted] | Securehops',
      'date': 'Jan 2023 - Jan 2025',
      'points': [
        'Led a team of Flutter developers to build and ship multiple production apps.',
        'Planned sprint deliverables and reviewed architecture designs.',
        'Built developer tooling and release automation.',
      ],
    },
    {
      'role': 'Flutter Developer | WeTeachs',
      'date': 'Dec 2024 - Present',
      'points': [
        'Developed and launched an app with 5K+ downloads.',
        'Built live quiz and earning features for learners.',
      ],
    },
    {
      'role': 'Flutter Developer | TIDUP',
      'date': 'Apr 2024 - Sept 2025',
      'points': ['Developed delivery app and collaborated with product teams.'],
    },

   
  ];


  // ------------------ UI ------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text('Arham Sarwar - Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      PdfPreview(build: (format) => _buildPdf(format)),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 750),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  contact,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Divider(color: Colors.grey.shade800, thickness: 1),
                const SizedBox(height: 8),

                _sectionTitle('Profile'),
                Text(
                  summary,
                  style: const TextStyle(fontSize: 12, height: 1.4),
                ),
                const SizedBox(height: 16),
                  Divider(color: Colors.grey.shade800, thickness: 1),

                _sectionTitle('Skills'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills
                      .map(
                        (s) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            s,
                            style: const TextStyle(
                              color: blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                  Divider(color: Colors.grey.shade800, thickness: 1),
                const SizedBox(height: 16),

                _sectionTitle('Experience'),
                ...experience.map((exp) => _expTile(exp)),
                const SizedBox(height: 16),
  Divider(color: Colors.grey.shade800, thickness: 1),
                _sectionTitle('Projects'),
   _ProjectTile(
                          title: 'WirdBook',
                          desc:
                              'Spiritual guide app for daily litanies and reminders.',
                        ),
                        _ProjectTile(
                          title: 'IQRA Quran App',
                          desc:
                              'Quranic app offering offline reading and prayer times.',
                        ),
                        _ProjectTile(
                          title: 'Griot Connects',
                          desc:
                              'Marketplace app with secure checkout and user roles.',
                        ),
                        _ProjectTile(
                          title: 'WeTeachs',
                          desc: 'Learning platform where users teach and earn.',
                        ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blue,
        
      ),
    ),
  );


  

  Widget _expTile(Map<String, dynamic> exp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exp['role'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            exp['date'],
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          const SizedBox(height: 4),
          ...List.generate(
            exp['points'].length,
            (i) => Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(fontSize: 11, height: 1.2)),
                  Expanded(
                    child: Text(
                      exp['points'][i],
                      style: const TextStyle(fontSize: 11, height: 1.3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ PDF ------------------
  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final pdf = pw.Document();
    final bluePdf = PdfColor.fromHex('#1E5AA8');

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(30),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                children: [
                  pw.Text(
                    name,
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                      color: bluePdf,
                      font: pw.Font.timesBold()
                    ),
                  ),
                  pw.Spacer(),
                  pw.SizedBox(height: 4),

                  pw.Text(
                    contact,
                    style: pw.TextStyle(fontSize: 9, color: PdfColors.black),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(color: PdfColors.blueGrey300,thickness: 0.3),
              pw.SizedBox(height: 10),

              _pdfHeading('Profile', bluePdf),
              pw.Text(
                summary,
                style: const pw.TextStyle(fontSize: 10, height: 1.3),
              ),
              pw.SizedBox(height: 20),
                 pw.Divider(color: PdfColors.blueGrey300,thickness: 0.3),pw.SizedBox(height: 10),

              _pdfHeading('Skills', bluePdf),

              pw.Row(
                children: [
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text("APIs ", style: pw.TextStyle(fontSize: 12)),

                  pw.SizedBox(width: 106),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('Flutter & Dart', style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(width: 40),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('GitHub Actions', style: pw.TextStyle(fontSize: 13)),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('Firebase ', style: pw.TextStyle(fontSize: 12)),

                  pw.SizedBox(width: 85),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('Backend ', style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(width: 60),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('CI/CD & DevOps', style: pw.TextStyle(fontSize: 13)),
                ],
              ),
              pw.Row(
                children: [
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text(
                    'State Management ',
                    style: pw.TextStyle(fontSize: 12),
                  ),

                  pw.SizedBox(width: 30),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('AI integration', style: pw.TextStyle(fontSize: 12)),
                  pw.SizedBox(width: 40),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(
                    height: 8,
                    width: 8,
                    color: PdfColor.fromHex('#1E5AA8'),
                  ),
                  pw.SizedBox(width: 2),
                  pw.Container(height: 8, width: 8, color: PdfColors.grey),
                  pw.SizedBox(width: 12),
                  pw.Text('Databases ', style: pw.TextStyle(fontSize: 13)),
                ],
              ),

              pw.SizedBox(height: 10),
                 pw.Divider(color: PdfColors.blueGrey300,thickness: 0.3),
                 pw.SizedBox(height: 10),

              _pdfHeading('Experience', bluePdf),
              ...experience.map((exp) {
                return pw.Padding(
                  padding: const pw.EdgeInsets.only(bottom: 6),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        exp['role'],
                        style: pw.TextStyle(
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          font: pw.Font.timesBold()
                        ),
                      ),
                      pw.Text(
                        exp['date'],
                        style: pw.TextStyle(
                          fontSize: 8,
                          color: PdfColors.grey700,
                        ),
                      ),
                      pw.SizedBox(height: 2),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: (exp['points'] as List<String>)
                            .map(
                              (p) => pw.Bullet(
                                text: p,
                                style: const pw.TextStyle(fontSize: 8),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                );
              }).toList(),
              pw.SizedBox(height: 10),
                 pw.Divider(color: PdfColors.blueGrey300,thickness: 0.3),
                 pw.SizedBox(height: 10),

              _pdfHeading('Projects', bluePdf),
            _projItem(
                            'WirdBook',
                            'Spiritual guide app for daily litanies and reminders.',
                          ),
                          _projItem(
                            'IQRA Quran App',
                            'Offline Quran, daily Duas, and prayer time app.',
                          ),
                          _projItem(
                            'Griot Connects',
                            'Marketplace app with secure checkout and user roles.',
                          ),
                          _projItem(
                            'WeTeachs',
                            'Learning platform where users teach and earn.',
                          ),
                          _projItem(
                            'CRO App',
                            'Job-finding platform for students with employer web panel and admin dashboard for management and scalability.',
                          ),

            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _pdfHeading(String title, PdfColor color) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 4),
    child: pw.Text(
      title,
      style: pw.TextStyle(fontSize: 17, fontWeight: pw.FontWeight.bold,color: color,font: pw.Font.timesBold()),
    ),
  );
  pw.Widget _projItem(String title, String desc) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 3),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9,font: pw.Font.timesBold()),
        ),
        pw.Text(desc, style: const pw.TextStyle(fontSize: 9)),
      ],
    ),
  );
  
}
