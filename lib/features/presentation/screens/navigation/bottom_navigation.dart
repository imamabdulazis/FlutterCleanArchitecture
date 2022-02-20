import 'package:clean_architect/features/common/constants/translation_constants.dart';
import 'package:clean_architect/features/domain/entities/language/BottomNavEntity.dart';
import 'package:clean_architect/features/presentation/screens/menu/menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../components/widget/custom_tabbar.dart';
import '../account/account_screen.dart';
import '../home/home_screen.dart';

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

  int _selectedIndex = 0;

  final List<BottomNavEntity> _customNav = [
    BottomNavEntity(
      screen: HomeScreen(),
      title: R.home,
      activeIcons: CupertinoIcons.house_fill,
      defaultIcons: CupertinoIcons.home,
    ),
    BottomNavEntity(
      screen: HomeScreen(),
      title: R.marketPlace,
      activeIcons: MdiIcons.storefront,
      defaultIcons: MdiIcons.storefrontOutline,
    ),
    BottomNavEntity(
      screen: HomeScreen(),
      title: R.profile,
      activeIcons: CupertinoIcons.person_alt_circle_fill,
      defaultIcons: CupertinoIcons.person_alt_circle,
    ),
    BottomNavEntity(
      screen: HomeScreen(),
      title: R.notifications,
      activeIcons: MdiIcons.bell,
      defaultIcons: MdiIcons.bellOutline,
    ),
    BottomNavEntity(
      screen: HomeScreen(),
      title: R.menu,
      activeIcons: MdiIcons.menu,
      defaultIcons: MdiIcons.menu,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _customNav.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.black87,
            textTheme: Theme.of(context).textTheme,
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: CustomTabBar(
              customNav: _customNav,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(
                () => _selectedIndex = index,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
