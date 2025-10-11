

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
