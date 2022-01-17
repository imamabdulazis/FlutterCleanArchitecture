import '../../../../data/models/response/user_model.dart';
import '../../../components/utility/palette.dart';
import 'profile_avatar.dart';
import 'package:flutter/material.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({Key? key, required this.onlineUsers}) : super(key: key);

  final List<UserModel> onlineUsers;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0, 5.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 60.0,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
            itemCount: 1 + onlineUsers.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: _CreateRoomsButton(),
                );
              }
              final UserModel user = onlineUsers[index - 1];
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child:
                      ProfileAvatar(imageUrl: user.imageUrl!, isActive: true));
            },
          ),
        ),
      ),
    );
  }
}

class _CreateRoomsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent[100]!,
      ),
      textColor: Palette.facebookBlue,
      child: Row(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (dynamic rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5.0),
          const Text(
            'Create\nRoom\'s',
            style: TextStyle(fontSize: 9.0),
          )
        ],
      ),
    );
  }
}
