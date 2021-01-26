import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../data/datasource/binding/cache/dummy.dart';
import 'local_widget/app_bar_home.dart';
import 'local_widget/post_widget.dart';
import 'local_widget/rooms_widget.dart';
import 'local_widget/stories_widget.dart';

class HomeScreen extends HookWidget {
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    // final prefs = sl<SharedPrefs>();

    useEffect(() {
      print("Test use Effect");
      return;
    }, const []);

    //
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          AppBarHome(),
          PostWidget(currentUser: currentUser),
          RoomsWidget(onlineUsers: onlineUsers),
          StoriesWidget(currentUser: currentUser, stories: stories),
        ],
      ),
    );
  }
}
