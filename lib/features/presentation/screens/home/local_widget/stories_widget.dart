import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architect/features/data/models/response/story_model.dart';
import 'package:clean_architect/features/data/models/response/user_model.dart';
import 'package:clean_architect/features/presentation/components/utility/palette.dart';
import 'package:clean_architect/features/presentation/screens/home/local_widget/profile_avatar.dart';
import 'package:flutter/material.dart';

class StoriesWidget extends StatelessWidget {
  final UserModel currentUser;
  final List<StoryModel> stories;

  const StoriesWidget(
      {Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 200.0,
          color: Colors.white,
          child: ListView.builder(
            addAutomaticKeepAlives: false,
            cacheExtent: 100.0,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 8.0,
            ),
            itemCount: 1 + stories.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _StoryCard(
                  isAddStory: true,
                  currentUser: currentUser,
                );
              }
              final StoryModel story = stories[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: _StoryCard(story: story),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final UserModel? currentUser;
  final StoryModel? story;

  const _StoryCard(
      {Key? key, this.isAddStory = false, this.currentUser, this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[350]!),
            borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            print('IMAM');
          },
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                    imageUrl:
                        isAddStory ? currentUser!.imageUrl : story!.imageUrl,
                    height: double.infinity,
                    width: 110.0,
                    fit: BoxFit.cover),
              ),
              Container(
                height: double.infinity,
                width: 110.0,
                decoration: BoxDecoration(
                    gradient: Palette.storyGradient,
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              if (isAddStory)
                const SizedBox()
              else
                Positioned(
                  top: 10.0,
                  left: 8.0,
                  child: ProfileAvatar(
                    imageUrl: story!.user!.imageUrl!,
                    hasBorder: !story!.isViewed!,
                  ),
                ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: isAddStory
                    ? Container(
                        height: 85,
                        width: 55,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 60,
                            child: Text(
                              'Create a Story',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ))
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Text(
                          story!.user!.name!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
              ),
              if (!isAddStory)
                const SizedBox()
              else
                Positioned(
                  left: 30,
                  bottom: 65,
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: const BoxDecoration(
                      color: Palette.facebookBlue,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () => print('add to story'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
