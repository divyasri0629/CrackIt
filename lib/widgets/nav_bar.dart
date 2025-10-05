
import 'package:crackit/screens/chat_bot.dart';
import 'package:crackit/screens/global_favorites.dart';
import 'package:flutter/material.dart';
import 'package:cnav/cnav.dart';

import 'package:crackit/screens/company_ui.dart';
import 'package:crackit/screens/homepage.dart';
import 'package:crackit/screens/profile_page.dart';


class NavBar extends StatefulWidget {
  final int initialIndex;

  const NavBar({super.key, this.initialIndex = 0});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _currentIndex;
  bool _showChatBot = false;

  final List<Widget> _screens = [
    const MainPage(),
    CompanyUi(isDark: false, onToggleTheme: () {}),
    const PlaceholderWidget("Chatbot Screen"),
    const PlaceholderWidget("Favorites Screen"),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onNavTapped(int index) {
    if (index == 2) {
      setState(() {
        _showChatBot = !_showChatBot; // toggle chatbot
      });
    } else if (index == 3) {
      final allFavorites = [
        ...globalDsaFavorites,
        ...globalAptitudeFavorites,
        ...globalHrFavorites,
        ...globalManagerialFavorites,
      ];
      Navigator.pushNamed(context, '/favorites', arguments: allFavorites);
    } else {
      setState(() {
        _currentIndex = index;
        _showChatBot = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_currentIndex != 0) {
          setState(() => _currentIndex = 0);
          return false;
        }
        return true;
      },
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            IndexedStack(
              index: _currentIndex,
              children: _screens,
            ),
            if (_showChatBot)
              Positioned(
                bottom: 120,
                left: 10,
                right: 10,
                child: ChatBotWidget(
                  apiKey: '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',
                  onClose: () {
                    setState(() => _showChatBot = false);
                  },
                ),
              ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return CNav(
      iconSize: 90.0,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(15),
      borderRadius: const Radius.circular(20),
      selectedColor: Colors.white,
      unSelectedColor: const Color.fromARGB(255, 180, 180, 180),
      backgroundColor: const Color.fromARGB(255, 36, 34, 34),
      isFloating: true,
      items: [
        CNavItem(icon: const Icon(Icons.home)),
        CNavItem(icon: const Icon(Icons.business)),
        CNavItem(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 58, 58),
              shape: BoxShape.circle,
              
            ),
            child: const Icon(Icons.child_care_outlined, color: Colors.white,size: 135,),
          ),
        ),
        CNavItem(icon: const Icon(Icons.favorite)),
        CNavItem(icon: const Icon(Icons.person)),
      ],
      currentIndex: _currentIndex,
      onTap: _onNavTapped,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;
  const PlaceholderWidget(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}