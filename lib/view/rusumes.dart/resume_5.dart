import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Resume5Page extends StatefulWidget {
  const Resume5Page({super.key});

  @override
  State<Resume5Page> createState() => _Resume5PageState();
}

class _Resume5PageState extends State<Resume5Page> {
  final Color blue = const Color(0xFF134080);

  // ---------------- PDF Generator -----------------
  Future<Uint8List> _generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(0),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Black Header
              pw.Container(
                height: 90,
                color: PdfColor.fromHex("#4A4A4A"),
                width: double.infinity,
                padding: const pw.EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'ARHAM SARWAR',
                      style: pw.TextStyle(
                        color: PdfColors.white,
                        fontSize: 32,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Sidebar
                  pw.Container(
                    height: 750,
                    width: 170,
                    color: PdfColor.fromInt(0xFF134080),
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 20),
                        _sideHeading('DETAILS'),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          ' +92 308 4695012\n arham.sarwar786@gmail.com\n linkedin.com/in/arham-sarwar-a1b56b176',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(color: PdfColors.grey, thickness: 0.3),
                        pw.SizedBox(height: 10),
                        _sideHeading('CORE QUALIFICATION'),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Flutter & Dart\nFirebase Suite\nBackend (Node, Laravel)\nState Management\nCI/CD, DevOps\nAI & ML\nDatabases\nGit & GitHub',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(color: PdfColors.grey, thickness: 0.3),

                        pw.SizedBox(height: 10),
                        _sideHeading('LANGUAGES'),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'English\nUrdu',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(color: PdfColors.grey, thickness: 0.3),
                        pw.SizedBox(height: 10),

                        _sideHeading('INTRESTS'),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'RecreationalFootballLeague teamcaptain\nTwo-timeleaguechampions\nLocalcommunitytheatre: performedplaysandshows',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(color: PdfColors.grey, thickness: 0.3),
                        pw.SizedBox(height: 10),
                        _sideHeading('ADDITIONAL INFORMATION'),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'Taughtlifesavingskillsand CPRclasses\nRed Cross volunteer',
                          style: pw.TextStyle(
                            color: PdfColors.white,
                            fontSize: 9,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Divider(color: PdfColors.grey, thickness: 0.3),
                        pw.SizedBox(height: 10),
                      ],
                    ),
                  ),
                  // Main body
                  pw.Expanded(
                    child: pw.Container(
                      padding: const pw.EdgeInsets.all(16),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 10),
                          _sectionTitle('PROFILE'),
                          pw.Text(
                            'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps with expertise in backend systems and AI solutions.',
                            style: const pw.TextStyle(fontSize: 10),
                          ),
                          pw.SizedBox(height: 10),
                          _sectionTitle('EXPERIENCE'),
                          pw.SizedBox(height: 10),

                          _expItem(
                            'CTO & Flutter Developer _ Harry Chat',
                            'Dec 2024 _ Present',
                            'Leading Islamic app Wordbook with 10K+ downloads. Designed and developed core features, improving workflows and retention.',
                          ),

                          _expItem(
                            'CTO & FlutterFlow Developer _ Griot Contents',
                            'Jan 2024 _ Present',
                            'Developed an eBook app for users to buy and sell eBooks online with secure authentication, payment integration, and digital library management.',
                          ),

                          _expItem(
                            'CTO & Flutter Developer _ IQRA Quran App',
                            'Jan 2024 _ Present',
                            'Led the development of the IQRA Quran App with offline access to the Holy Quran. Designed technical architecture ensuring scalability and user experience.',
                          ),

                          _expItem(
                            'CTO & Flutter Developer _ CRO App',
                            'Jan 2024 _ Present',
                            'Developed a Flutter mobile app for students to find jobs. Built Flutter web panels for employers to post jobs and managed end-to-end deployment.',
                          ),

                          _expItem(
                            'Team Lead (Flutter + Backend) _ SecureHops',
                            'Jan 2023 _ Jan 2025',
                            'Led Flutter team to build production apps, managed releases, reviewed architecture, and mentored developers.',
                          ),

                          pw.SizedBox(height: 8),
                          _sectionTitle('EDUCATION'),
                          pw.SizedBox(height: 5),
                          _projItem(
                            'BS Information Technology',
                            'University of Punjab Lahore (2019_2023)',
                          ),
                          _projItem(
                            'F.Sc Pre-Engineering',
                            'Islamia College Lahore (2016_2019)',
                          ),
                          _projItem(
                            'Matriculation',
                            'Islamia High School Lahore (2014_2016)',
                          ),
                          pw.SizedBox(height: 8),
                          _sectionTitle('PROJECTS'),
                          pw.SizedBox(height: 5),
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

                          _projItem(
                            'Reverse Disease',
                            'Health tracking app monitoring fatigue, sugar, weight, and nutrition. Built with FlutterFlow to promote healthy lifestyles.',
                          ),

                          _projItem(
                            'Salamly',
                            'Muslim Daily App featuring Quran, prayer times, Islamic tools, and 50K+ downloads. Focused on user experience and performance.',
                          ),

                          _projItem(
                            'OnFekwa',
                            'Social media app helping users discover lifestyle trends. Includes story uploads, messaging, and sharing features.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // Helper methods for PDF
  pw.Widget _sideHeading(String text) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 2),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        color: PdfColors.white,
        fontSize: 11,
        fontWeight: pw.FontWeight.bold,
      ),
    ),
  );

  pw.Widget _sectionTitle(String text) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 2),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontSize: 13, fontWeight: pw.FontWeight.bold),
    ),
  );

  pw.Widget _expItem(String title, String date, String desc) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 3),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          date,
          style: const pw.TextStyle(fontSize: 9, color: PdfColors.grey800),
        ),
        pw.SizedBox(height: 2),
        pw.Text(desc, style: const pw.TextStyle(fontSize: 10)),
      ],
    ),
  );

  pw.Widget _projItem(String title, String desc) => pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 3),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9),
        ),
        pw.Text(desc, style: const pw.TextStyle(fontSize: 8)),
      ],
    ),
  );

  // ---------------- Flutter UI -----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: blue,
        title: const Text('Arham Sarwar - Resume'),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf_outlined),
            tooltip: 'Generate PDF',
            onPressed: () async {
              final pdfData = await _generatePdf();
              await Printing.layoutPdf(onLayout: (_) => pdfData);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Black header bar
          Container(
            color: Color(0xff4A4A4A),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ARHAM SARWAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),

              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar
                Container(
                  width: 160,
                  color: blue,
                  padding: const EdgeInsets.all(12),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'DETAILS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),
                        Text(
                          ' +92 308 4695012\n arham.sarwar786@gmail.com\n linkedin.com/in/arham-sarwar-a1b56b176',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, thickness: 0.3),
                        SizedBox(height: 10),
                        
                                                Text(
                          'CORE QUALIFICATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Flutter & Dart\nFirebase Suite\nBackend (Node, Laravel)\nState Management\nCI/CD, DevOps\nAI & ML\nDatabases\nGit & GitHub',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, thickness: 0.3),

                        SizedBox(height: 10),
                                               Text(
                          'LANGUAGES',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'English\nUrdu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, thickness: 0.3),
                        SizedBox(height: 10),

                                                Text(
                          'INTRESTS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'RecreationalFootballLeague teamcaptain\nTwo-timeleaguechampions\nLocalcommunitytheatre: performedplaysandshows',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, thickness: 0.3),
                        SizedBox(height: 10),
                                                Text(
                          'ADDITIONAL INFORMATION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Taughtlifesavingskillsand CPRclasses\nRed Cross volunteer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.grey, thickness: 0.3),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'PROFILE',
                          style: TextStyle(
                            color: Color(0xFF134080),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Senior Flutter Developer with 6+ years of experience in mobile app development, backend integration, and cloud deployment. Skilled in Flutter, Firebase, CI/CD, and DevOps with expertise in backend systems and AI solutions.',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'EXPERIENCE',
                          style: TextStyle(
                            color: Color(0xFF134080),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        _ExperienceTile(
                          title: 'CTO & Flutter Developer _ Harry Chat',
                          date: 'Dec 2024 _ Present',
                          desc:
                              'Leading Islamic app “Wordbook” with 10K+ downloads. Designed and developed core features improving retention.',
                        ),
                        _ExperienceTile(
                          title: 'CTO & FlutterFlow Developer _ Griot Contents',
                          date: 'Jan 2024 _ Present',
                          desc:
                              'Developed eBook app for buying/selling eBooks with secure authentication and payments.',
                        ),
                        _ExperienceTile(
                          title: 'Team Lead (Flutter + Backend) _ SecureHops',
                          date: 'Jan 2023 _ Jan 2025',
                          desc:
                              'Led Flutter team, managed releases, and improved performance.',
                        ),
                        _ExperienceTile(
                          title: 'Flutter Developer _ Salamgram',
                          date: 'Mar 2019 _ Jan 2025',
                          desc:
                              'Built features for Muslim Daily App with 50K+ downloads.',
                        ),
                        SizedBox(height: 12),
                        Text(
                          'EDUCATION',
                          style: TextStyle(
                            color: Color(0xFF134080),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        _ProjectTile(
                          title: 'BS Information Technology',
                          desc: 'University of Punjab Lahore (2019_2023)',
                        ),
                        _ProjectTile(
                          title: 'F.Sc Pre-Engineering',
                          desc: 'Islamia College Lahore (2016_2019)',
                        ),
                        _ProjectTile(
                          title: 'Matriculation',
                          desc: 'Islamia High School Lahore (2014_2016)',
                        ),
                        SizedBox(height: 12),
                        Text(
                          'PROJECTS',
                          style: TextStyle(
                            color: Color(0xFF134080),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------- UI Helper Widgets ---------------------
class _ExperienceTile extends StatelessWidget {
  final String title, date, desc;
  const _ExperienceTile({
    required this.title,
    required this.date,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(date, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Text(desc, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

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
