import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_responsive_ui/config/palette.dart';

class StoryProfileAvatar extends StatelessWidget {
  final bool isAddStory;
  final bool post;
  final String? urlImage;
  final double size;

  StoryProfileAvatar({
    Key? key,
    required this.size,
    this.post = false,
    this.urlImage,
    this.isAddStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, gradient: Palette.StoryBackground),
          child: isAddStory
              ? CircleAvatar(
                  radius: size - 2,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(urlImage),
                )
              : CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: size,
                  child: CircleAvatar(
                    radius: size - 2,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(urlImage),
                  ),
                ),
        ),
        isAddStory
            ? !post
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: 28.0,
                          width: 28.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1,
                          child: Container(
                            height: 25.0,
                            width: 25.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF1777F2),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.add),
                              iconSize: 20.0,
                              color: Colors.white,
                              onPressed: () => print('Add to Story'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink()
            : const SizedBox.shrink()
      ],
    );
  }
}
