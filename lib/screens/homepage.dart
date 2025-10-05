import 'dart:async';
import 'package:flutter/material.dart';
// import 'mcq_list_screen.dart';
import 'mock_test_screen.dart';
import 'managerial_round_screen.dart';
import 'question_list_screen.dart';
import 'gd_topic_screen.dart';
import 'hr_list_screen.dart';
import 'appti_list_screen.dart';
import 'BranchListScreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  Timer? _timer;
  double _imageOffset = 0;
  double _maxImageOffset = 0;
  final GlobalKey _roundsSectionKey = GlobalKey();

  // ignore: non_constant_identifier_names
  final List<Map<String, dynamic>> Rounds = [
    {
      'title': 'Technical Interview',
      'description': 'Master coding challenges and system design questions',
      'imageurl':
          'https://thumbs.dreamstime.com/b/vector-illustration-young-business-group-discussion-their-office-young-business-group-discussion-their-office-157641854.jpg',
      'color': Colors.green,
    },
    {
      'title': 'Aptitude Tests',
      'description': 'Sharpen your logical reasoning and quantitative skills',
      'imageurl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmAAhd-P_c1PQiaDmIJdHzNzqYfnRKe8D5ig&s',
      'color': Colors.blue,
    },
    {
      //
      'title': 'HR Rounds',
      'description': 'Perfect your behavioral and situational responses',
      'imageurl':
          'https://t3.ftcdn.net/jpg/03/64/90/68/360_F_364906832_3CWsp5oXzh8oauRKz7SYtPfCZ57JfESZ.jpg',
      'color': Colors.pink,
    },
    {
      'title': 'Group Discussions',
      'description': 'Build confidence in team communication scenarios',
      'imageurl':
          'https://www.shutterstock.com/shutterstock/videos/3590094077/thumb/9.jpg?ip=x480',
      'color': Colors.orange,
    },
  ];

  final List<Map<String, dynamic>> interviewRounds = [
    {
      'title': 'Aptitude Round',
      'icon': Icons.psychology,
      'color': Colors.blue,
      'route': '/ApptiListScreen',
    },
    {
      'title': 'Technical Round',
      'icon': Icons.code,
      'color': Colors.green,
      'route': '/McqListScreen',
    },
    {
      'title': 'Coding Round',
      'icon': Icons.forum,
      'color': Colors.orange,
      'route': '/QuestionListScreen',
    },
    {
      'title': 'Group Discussion',
      'icon': Icons.people,
      'color': Colors.purple,
      'route': '/GdTopicScreen',
    },
    {
      'title': 'HR Round',
      'icon': Icons.analytics,
      'color': Colors.red,
      'route': '/HrListScreen',
    },
    {
      'title': 'Managerial Round',
      'icon': Icons.slideshow,
      'color': Colors.teal,
      'route': '/ManagerialListScreen',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        if (_currentPage >= Rounds.length) _currentPage = 0;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maxImageOffset = MediaQuery.of(context).size.height * 0.4;
    });

    _scrollController.addListener(() {
      setState(() {
        _imageOffset = -_scrollController.offset * 0.5;
        if (_imageOffset < -_maxImageOffset) _imageOffset = -_maxImageOffset;
        if (_imageOffset > 0) _imageOffset = 0;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNextPage() {
    if (_currentPage < Rounds.length - 1) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _currentPage = 0;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToRoute(String route) {
    if (route.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            switch (route) {
              case '/ApptiListScreen':
                return const ApptiListScreen();
              case '/McqListScreen':
                return const BranchListScreen();
              case '/QuestionListScreen':
                return const QuestionListScreen();
              case '/GdTopicScreen':
                return const GdTopicScreen();
              case '/HrListScreen':
                return const HrListScreen();
              case '/ManagerialListScreen':
                return const ManagerialListScreen();
              default:
                return const SizedBox();
            }
          },
        ),
      );
    }
  }

  void _scrollToRoundsSection() {
    final context = _roundsSectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        Rounds.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: _currentPage == index ? 14 : 12,
          height: _currentPage == index ? 6 : 4,
          decoration: BoxDecoration(
            color: _currentPage == index
                ? Colors.blue
                // ignore: deprecated_member_use
                : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselNavButton({
    double? left,
    double? right,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: 0,
      bottom: 0,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.black54, size: 20),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, _imageOffset),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                'https://media.istockphoto.com/id/2158822426/vector/team-of-business-people-celebrate-success-in-work-collaboration-together-giving-high-five.jpg?s=612x612&w=0&k=20&c=Uj2XPX8u8dR-0mo09NlYq7DIWrSfitF08UEAPxGmc4E=',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.35),

                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF5E6E8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Hello Dream Chaser!',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Ready. Get. Set. Succeed!',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 116, 109, 109),
                              ),
                            ),SizedBox(width: 8),
                            Icon(
                              Icons.directions_run,
                              color: Color.fromARGB(255, 116, 109, 109),
                              size: 20,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      SizedBox(
                        height: 200,
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: _pageController,
                              itemCount: Rounds.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                final item = Rounds[index];
                                return GestureDetector(
                                  onTap: _scrollToRoundsSection,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              // ignore: deprecated_member_use
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius: 6,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network(
                                              item['imageurl'] ?? '',
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Container(
                                                    color: Colors.grey[300],
                                                    child: const Center(
                                                      child: Icon(Icons.error),
                                                    ),
                                                  ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                    Colors.transparent,
                                                    // ignore: deprecated_member_use
                                                    Colors.black.withOpacity(
                                                      0.7,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 20,
                                              left: 16,
                                              right: 16,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item['title'],
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    item['description'],
                                                    style: TextStyle(
                                                      // ignore: deprecated_member_use
                                                      color: Colors.white
                                                          // ignore: deprecated_member_use
                                                          .withOpacity(0.9),
                                                      fontSize: 14,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            _buildCarouselNavButton(
                              left: 8,
                              icon: Icons.arrow_back_ios,
                              onTap: _goToPreviousPage,
                            ),
                            _buildCarouselNavButton(
                              right: 8,
                              icon: Icons.arrow_forward_ios,
                              onTap: _goToNextPage,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildCarouselIndicators(),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MockTestScreen(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25,
                                vertical: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFFC8BAD3), // Change as needed
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "🧠 Challenge Yourself",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MockTestScreen(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      textStyle: const TextStyle(fontSize: 16),
                                    ),
                                    child: const Text("Begin 💯"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // --- End added button ---
                      Padding(
                        key: _roundsSectionKey,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.0,
                              ),
                          itemCount: interviewRounds.length,
                          itemBuilder: (context, index) {
                            final round = interviewRounds[index];
                            return GestureDetector(
                              onTap: () => _navigateToRoute(round['route']),
                              child: TweenAnimationBuilder(
                                duration: const Duration(milliseconds: 200),
                                tween: Tween(begin: 0.95, end: 1.0),
                                builder: (context, value, child) {
                                  return Transform.scale(
                                    scale: value,
                                    child: child,
                                  );
                                },
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () =>
                                        _navigateToRoute(round['route']),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            round['icon'],
                                            size: 40,
                                            color: round['color'],
                                          ),
                                          const SizedBox(height: 16),
                                          Text(
                                            round['title'],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
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

class SingleCompanyScreen extends StatelessWidget {
  final String title;
  final String imageurl;
  final String content;
  final String stitle;

  const SingleCompanyScreen({
    super.key,
    required this.title,
    required this.imageurl,
    required this.content,
    required this.stitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                imageurl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
              ),

              const SizedBox(height: 20),
              Text(content, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
