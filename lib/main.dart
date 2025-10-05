import 'package:crackit/screens/favorites_screen.dart';
import 'package:crackit/screens/loginsignuipage.dart';
import 'package:crackit/screens/splashscreen.dart';
import 'package:crackit/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // ignore: deprecated_member_use
          useInheritedMediaQuery: true,
          home: const SplashScreen(), 
          onGenerateRoute: (settings) {
            if (settings.name == '/favorites') {
              final args = settings.arguments;
              if (args is List<dynamic>) {
                return MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favorites: args),
                );
              } else {
                return MaterialPageRoute(
                  builder: (_) => const Scaffold(body: Center(child: Text("Invalid favorites data"))),
                );
              }
            }

            switch (settings.name) {
              case '/login':
                return MaterialPageRoute(builder: (_) => const Loginsignuipage());
              case '/home':
                return MaterialPageRoute(builder: (_) => const NavBar(initialIndex: 0));
              default:
                return null;
            }
          },
        );
      },
    );
  }
}