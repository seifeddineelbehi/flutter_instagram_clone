import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_responsive_ui/data/data.dart';
import 'package:instagram_responsive_ui/models/models.dart';
import 'package:instagram_responsive_ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Instagram",
          style: TextStyle(
              color: Colors.black, fontFamily: 'VeganStyle', fontSize: 24.0),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.plusSquare,
              color: Colors.black,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.heart,
              color: Colors.black,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesomeIcons.paperPlane,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),
      body:
          HomeScreenMobile(trackingScrollController: _trackingScrollController),
    );
  }
}

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({
    Key? key,
    required TrackingScrollController trackingScrollController,
  })  : _trackingScrollController = trackingScrollController,
        super(key: key);

  final TrackingScrollController _trackingScrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _trackingScrollController,
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 2.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
                const Divider(
                  thickness: 0.5,
                  color: Colors.black12,
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}
