import 'package:clean_architect/features/presentation/screens/menu/menu_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../components/widget/custom_tabbar.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavScreen extends StatefulWidget {
  static const route = '/BottomNavScreen';
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    const Scaffold(),
    AccountScreen(),
    const Scaffold(),
    const MenuScreen()
  ];

  final List<IconData> _icons = [
    MdiIcons.homeOutline,
    MdiIcons.storefront,
    CupertinoIcons.person_circle,
    MdiIcons.bellOutline,
    MdiIcons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _icons.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index) => setState(
              () => _selectedIndex = index,
            ),
          ),
        ),
      ),
    );
  }
}
