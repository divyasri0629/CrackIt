
import 'package:crackit/screens/company_card.dart';
import 'package:flutter/material.dart';


class CompanyUi extends StatefulWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const CompanyUi({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  @override
  State<CompanyUi> createState() => _CompanyUiState();
}

class _CompanyUiState extends State<CompanyUi> {
  final List<Map<String, dynamic>> company = [
    {
      'title': 'Apple',
      'imageurl': 'https://www.tailorbrands.com/wp-content/uploads/2021/01/apple_logo_1988.jpg',
      'content':
      'Apple is a renowned technology company founded in 1976 by Steve Jobs, Steve Wozniak, and Ronald Wayne. It is known for its innovative products like the iPhone, Mac, iPad, and iOS software. Apple’s interview process usually includes an initial HR screening, followed by technical interviews focusing on problem-solving, system design, and behavioral questions.',
      'rounds': [
        'Online Test (Aptitude + Technical MCQs + Coding)',
        'Technical Interview ',
        'Managerial/HR Interview',
      ],
      'address':
      'Apple Park, 1 Apple Park Way, Cupertino, CA 95014, United States',
    },
    {
      'title': 'Amazon',
      'imageurl': 'https://static.vecteezy.com/system/resources/previews/019/766/240/non_2x/amazon-logo-amazon-icon-transparent-free-png.png',
      'content':
      'Amazon is a global e-commerce and cloud computing company founded by Jeff Bezos in 1994. It is known for its online marketplace, AWS (Amazon Web Services), and consumer electronics like Kindle and Echo. The interview process at Amazon typically includes an online assessment, multiple technical interviews, and behavioral rounds focused on Amazon’s Leadership Principles.',
      'rounds': [
        'Online Assessment (OA – DSA/Coding)',
        'Technical Interviews (DSA + System Design) ',
        'Bar Raiser Round',
        'HR Round',
      ],
      'address': '410 Terry Ave North, Seattle, WA 98109, United States',
    },
    {
      'title': 'IBM',
      'imageurl': 'https://upload.wikimedia.org/wikipedia/commons/f/fc/IBM_logo_in.jpg',
      'content':
      'IBM (International Business Machines Corporation) is a global technology company founded in 1911. It is known for its contributions to computing, cloud services, AI (like Watson), and enterprise solutions. IBM’s interview process generally includes an aptitude test, technical interviews, and behavioral rounds focusing on problem-solving and innovation.',
      'rounds': [
        'cognitive Ability & Techincal Test',
        'Coding Test',
        'Techincal Interview',
        'HR Interview',
      ],
      'address': ' New Orchard Road, Armonk, NY 10504-1722, United States',
    },
    {
      'title': 'Accenture',
      'imageurl': 'assets/c16.png',
      'content':
      'Accenture is a global professional services company founded in 1989, known for its expertise in IT services, consulting, and digital transformation. It serves clients across various industries with solutions in technology and strategy. Accenture’s interview process typically includes an aptitude test, technical interview, and HR or behavioral round.',
      'rounds': [
        'cognitive & Techincal Assessment',
        'Coding Round',
        'Communication Round',
        'HR Interview',
      ],
      'address':
      '1 Grand Canal Square, Grand Canal Harbour, Dublin D02 P820, Ireland',
    },
    {
      'title': 'google',
      'imageurl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVoX4LZRtUg7t6GaqOstWjs_mAegjnIFfeAgYUcdOxhsei5mEeUQ5VuTqX6SGZj2DKRqI&usqp=CAU',
      'content':
      'Google, founded in 1998 by Larry Page and Sergey Brin, is a global tech giant known for products like Search, Android, and YouTube; its interview process usually includes online assessments, multiple technical rounds, and a final behavioral interview.',
      'rounds': [
        'Online Coding Test',
        'Techincal Interviews(2 - 4 Rounds)',
        'Hiring Manager Round',
        'HR Round',
      ],
      'address':
      'Googleplex, 1600 Amphitheatre Parkway, Mountain View, CA 94043, United States',
    },
    {
      'title': 'Infosys',
      'imageurl':'https://media.assettype.com/theleaflet/2025-04-04/wmav9t4h/1000186408.jpg?w=1200&h=675&auto=format%2Ccompress&fit=max&enlarge=true',
      'content':
      'Infosys is a global IT services and consulting company founded in 1981 in India. It is known for providing software development, maintenance, and independent validation services to companies across various sectors. The interview process at Infosys typically includes an online aptitude test, technical interview, and HR or behavioral round.',
      'rounds': [
        'Online Test(Appitude, Reasoning, Verbal)',
        'Technical Interview',
        'HR Interview',
      ],
      'address':
      '#44, Electronics City, Hosur Road, Bengaluru, Karnataka 560100, India',
    },
    {
      'title': 'Microsoft',
      'imageurl': 'https://cdn-dynmedia-1.microsoft.com/is/image/microsoftcorp/RWCZER-Legal-IP-Trademarks-CP-MS-logo-740x417-1?wid=406&hei=230&fit=crop',
      'content':
      'Microsoft is a multinational technology company founded by Bill Gates and Paul Allen in 1975. It is best known for products like Windows, Office, Azure, and Xbox. Microsoft’s interview process usually includes an online assessment, technical interviews focused on data structures, algorithms, and system design, followed by a behavioral round.',
      'rounds': [
        'Online Assessment(MCQ + Coding)',
        'Technical Interview(2-3)',
        'HR Round',
      ],
      'address': '1 Microsoft Way, Redmond, WA 98052, United States',
    },
    {
      'title': 'TCS',
      'imageurl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Tata_Consultancy_Services_old_logo.svg/2560px-Tata_Consultancy_Services_old_logo.svg.png',
      'content':
      'TCS (Tata Consultancy Services) is a global IT services and consulting company founded in 1968, and part of the Tata Group. It is known for delivering software solutions, business outsourcing, and consulting services. The TCS interview process usually includes an online test (TCS NQT), followed by a technical interview and an HR round.',
      'rounds': [
        'Online Aptitude + Coding Test',
        'Technical Interview',
        'HR Interview',
      ],
      'address':
      '9th Floor, Nirmal Building, Nariman Point, Mumbai, Maharashtra 400021, India',
    },
    {
      'title': 'Wipro',
      'imageurl':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM6amFlEOb6mvn-F1n9_RgikWe3SXZUMk3qGdCqvVJqKI2JGpsHxemSToW-F_U0FvJHSA&usqp=CAU',
      'content':
      'Wipro is a global information technology, consulting, and business process services company founded in 1945. It provides IT solutions and services across various industries including banking, healthcare, and energy. The interview process at Wipro typically includes an online assessment, a technical interview, and a final HR round.',
      'rounds': [
        'Online Test(Aptitude, Reasoning, Verbal)',
        'Technical Interview',
        'HR Interview',
      ],
      'address':
      'Doddakannelli, Sarjapur Road, Bengaluru, Karnataka 560035, India',
    },
    {
      'title': 'Samsung',
      'imageurl': 'https://images.samsung.com/is/image/samsung/assets/us/about-us/brand/logo/mo/360_197_1.png?720_N_PNG',
      'content':
      'Samsung is a South Korean multinational company founded in 1938, known for its innovations in electronics, particularly smartphones, televisions, semiconductors, and consumer appliances. Samsung’s interview process usually includes an online coding test, technical interviews focused on problem-solving and core subjects, and a behavioral or HR round.',
      'rounds': [
        'technical assessments',
        'skills tests presentations',
        'one-on-one interviews',
        'group panel interviews',
        'behavioral interviews',
        'HR Interview',
      ],
      'address':
      '129 Samsung-ro, Yeongtong-gu, Suwon-si, Gyeonggi-do, South Korea',
    },
    {
      'title': 'Toyota',
      'imageurl': 'https://static.vecteezy.com/system/resources/previews/020/927/563/non_2x/toyota-logo-brand-car-symbol-with-name-black-design-japan-automobile-illustration-free-vector.jpg',
      'content':
      'Toyota is a Japanese multinational automotive manufacturer founded in 1937 by Kiichiro Toyoda. It is one of the largest carmakers in the world, known for models like the Corolla, Camry, and hybrid vehicles like the Prius. The interview process at Toyota typically includes an aptitude test, technical interview focused on automotive and mechanical knowledge, and an HR round.',
      'rounds': [
        'phone interviews',
        'one-on-one interviews',
        'skills, IQ tests, personality assessments',
        'group panel interviews & presentations',
        'HR Interview',
      ],
      'address': '1 Toyota-Cho, Toyota City, Aichi Prefecture 471-8571, Japan',
    },
    {
      'title': 'Walmart',
      'imageurl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_szZNzXObUmLZq18n5jgWCrUhJ-K0giSzHw&s',
      'content':
      'Walmart is an American multinational retail corporation founded in 1962 by Sam Walton. It operates a chain of hypermarkets, discount department stores, and grocery stores. Walmart Global Tech, its technology division, conducts interviews that typically include online assessments, technical rounds focused on coding and system design, and behavioral interviews.',
      'rounds': [
        ' online assessments',
        'behavioral & technical interviews (especially for tech roles)',
        'HR interviews',
      ],
      'address':
      '702 S.W. 8th Street, Bentonville, Arkansas 72716, United States',
    },
    {
      'title': 'HCL',
      'imageurl': 'https://techstory.in/wp-content/uploads/2015/06/HCL.gif',
      'content':
      'HCL Technologies is a global IT services and consulting company founded in 1976 in India. It offers services in digital, engineering, cloud, and IT infrastructure across various industries. The HCL interview process typically includes an online aptitude test, followed by technical interviews and an HR or behavioral round.',
      'rounds': [
        'Aptitude + Technical Test',
        'Technical Interview',
        'HR interview',
      ],
      'address': 'A-11, Sector 3, Noida, Uttar Pradesh 201301, India',
    },
  ];

  List<Map<String, dynamic>> filteredCompany = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCompany = company;
  }

  void _filterCompanies(String query) {
    final result = company.where((element) {
      final title = element['title']!.toLowerCase();
      final input = query.toLowerCase();
      return title.contains(input);
    }).toList();

    setState(() {
      filteredCompany = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEADADE),
      appBar: AppBar(
        title: const Text('Companies'),
        foregroundColor: Colors.white,
        backgroundColor:Color(0xFFC8BAD3)
        
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: _filterCompanies,
                  decoration: InputDecoration(
                    hintText: 'Search company...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredCompany.length,
                  itemBuilder: (context, index) {
                    return CompanyCard(company: filteredCompany[index],isDark: widget.isDark,onToggleTheme: widget.onToggleTheme,);
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}