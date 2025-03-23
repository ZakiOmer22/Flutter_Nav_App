import 'package:flutter/material.dart';
import 'package:navigation_app/pages/dashboard.dart';
import 'package:navigation_app/pages/profile.dart';
import 'package:navigation_app/pages/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of widgets to be displayed
  final List<Widget> pageOptions = [
    const DashboardPage(),
    const SearchPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          final int index =
              settings.arguments as int? ?? 0; // Default to 0 if null
          return MaterialPageRoute(
            builder: (context) => pageOptions[index],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Track current index if needed
        onTap: (index) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => pageOptions[index],
            settings: RouteSettings(arguments: index),
          ));
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Contact US',
          ),
        ],
      ),
    );
  }
}
