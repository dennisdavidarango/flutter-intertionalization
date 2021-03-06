import 'package:flutter/material.dart';
import 'package:test_internationalization/screens/Corousel-demo.dart';
import 'package:test_internationalization/screens/discover.dart';
import 'package:test_internationalization/screens/home.dart';
import 'package:test_internationalization/screens/profile-screen-crop.dart';
import 'package:test_internationalization/screens/profile-screen.dart';
import 'package:test_internationalization/screens/settings-screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: this.navInferior(context),
    );
  }

  BottomNavigationBar navInferior(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, color: Colors.orange),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Me',
        ),
      ],
      currentIndex: _selectedIndex, //New
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _pages = [
    Center(child: Home()),
    Center(child: Discover()),
    Center(child: ProfileScreenCrop()),
    Center(child: SettingsScreen()),
    Center(child: ProfileScreen()),
  ];
}
