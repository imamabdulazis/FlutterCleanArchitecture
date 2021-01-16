import 'package:clean_architect/features/presentation/components/widget/custom_tabbar.dart';
import 'package:clean_architect/features/presentation/screens/account/account_screen.dart';
import 'package:clean_architect/features/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    AccountScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = [
    MdiIcons.homeOutline,
    Icons.ondemand_video,
    MdiIcons.storefront,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    MdiIcons.menu
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
              onTap: (index) => setState(() => _selectedIndex = index)),
        ),
      ),
    );
  }
}
