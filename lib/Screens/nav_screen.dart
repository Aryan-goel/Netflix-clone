import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_responsive_ui/Screens/homescreen.dart';
import 'package:flutter_netflix_responsive_ui/cubits/cubits.dart';

class Navscreen extends StatefulWidget {
  @override
  _NavscreenState createState() => _NavscreenState();
}

class _NavscreenState extends State<Navscreen> {
  final List<Widget> _screen = [
    Home(key: PageStorageKey('home Screen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<AppBarCubit>(
            create: (_) => AppBarCubit(), child: _screen[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: _icons
              .map(
                (title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                    icon: Icon(icon, size: 30.0),
                    title: Text(title),
                  ),
                ),
              )
              .values
              .toList(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.grey,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          onTap: (index) => setState(() => _currentIndex = index),
        ));
  }
}
