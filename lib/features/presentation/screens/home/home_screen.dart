import 'package:clean_architect/features/data/datasource/binding/cache/dummy.dart';
import 'package:clean_architect/features/data/datasource/binding/cache/share_prefs.dart';
import 'package:clean_architect/features/di/injection_container.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/app_bar_home.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/post_widget.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/rooms_widget.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/stories_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  static const String route = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    final prefs = sl<SharedPrefs>();

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
