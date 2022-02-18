import 'package:flutter/material.dart';

import '../../../../data/models/response/user_model.dart';
import 'profile_avatar.dart';

class PostWidget extends StatelessWidget {
  final UserModel currentUser;

  // ignore: sort_constructors_first
  const PostWidget({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 0.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ProfileAvatar(imageUrl: currentUser.imageUrl!),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Ink(
                    child: InkWell(
                      onTap: () {
                        print('create post');
                      },
                      child: const Text('What\'s on your mind?'),
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live',
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Theme.of(context).colorScheme.primary))),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo',
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Theme.of(context).colorScheme.primary))),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room',
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Theme.of(context).colorScheme.primary))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
