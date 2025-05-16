import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:DevLogger/features/pages/porfile/presentation/ui/screens/my_articles.dart';
import 'package:DevLogger/features/pages/porfile/presentation/ui/widgets/followrs_widget.dart';

import '../../articleDetails/data/models/test_data.dart';
import 'ElevatedStyle.dart';
import 'Tabs/AboutTabs.dart';

class MyProfile extends StatefulWidget {
  static const String routeName = 'MyProfile';
  MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final List<Map<String, dynamic>> followers = [
    {
      'imageUrl': 'https://randomuser.me/api/portraits/women/1.jpg',
      'name': 'Alice Johnson',
      'isFollowing': false,
    },
    {
      'imageUrl': 'https://randomuser.me/api/portraits/men/2.jpg',
      'name': 'Bob Williams',
      'isFollowing': true,
    },
  ];

  final List<Map<String, dynamic>> following = [
    {
      'imageUrl': 'https://randomuser.me/api/portraits/men/3.jpg',
      'name': 'Charlie Brown',
      'isFollowing': true,
    },
    {
      'imageUrl': 'https://randomuser.me/api/portraits/women/4.jpg',
      'name': 'Diana Davis',
      'isFollowing': true,
    },
  ];

  void _showFollowersDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Followers'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: followers.length,
              itemBuilder: (context, index) {
                final follower = followers[index];
                return FollowUnfollowListTile(
                  imageUrl: follower['imageUrl'],
                  name: follower['name'],
                  isFollowing: follower['isFollowing'],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showFollowingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Following'),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: following.length,
              itemBuilder: (context, index) {
                final user = following[index];
                return FollowUnfollowListTile(
                  imageUrl: user['imageUrl'],
                  name: user['name'],
                  isFollowing: user['isFollowing'],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text("DevLogger", style: TextStyle(fontWeight: FontWeight.bold)),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(4.0), // Adjust height as needed
                child: Container(
                  height: 1,
                  color: Colors.grey.shade200, // Customize underline color
                ))),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text(
                          "Aghyad Hamdoun",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => _showFollowingDialog(context),
                            child: Text("1 following", style: TextStyle(fontWeight: FontWeight.w500)),
                          ),
                          Text(" . ", style: TextStyle(fontWeight: FontWeight.w500)),
                          InkWell(
                            onTap: () => _showFollowersDialog(context),
                            child: Text("0 followers", style: TextStyle(fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  15.horizontalSpace,
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpE5eYPFPxZX0oQk_7e-R7ljAOHMokM-zVNA&s"),
                      ),
                    ],
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                children: [
                  Elevatedstyle(
                    color: Colors.white,
                    text: "Edit your profile",
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 10),
                  Elevatedstyle(
                    color: Colors.black,
                    text: "settings",
                    textColor: Colors.white,
                  ),
                ],
              ),
              10.verticalSpace,
              TabBar(
                  indicatorColor: Colors.black,
                  padding: EdgeInsets.only(bottom: 15),
                  tabs: [
                    Tab(text: 'about'),
                    Tab(text: 'my articles')
                  ]),
              Expanded(
                child: TabBarView(children: [
                  AboutTabs(),
                  MyArticles(articles: articles),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
