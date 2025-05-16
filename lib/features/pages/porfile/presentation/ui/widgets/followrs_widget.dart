
import 'package:flutter/material.dart';

class FollowUnfollowListTile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final bool isFollowing;

  FollowUnfollowListTile({
    required this.imageUrl,
    required this.name,
    this.isFollowing = false,
  });

  @override
  _FollowUnfollowListTileState createState() => _FollowUnfollowListTileState();
}

class _FollowUnfollowListTileState extends State<FollowUnfollowListTile> {
  late bool isFollowing;

  @override
  void initState() {
    super.initState();
    isFollowing = widget.isFollowing;
  }

  void _toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      title: Text(widget.name),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isFollowing ? Colors.grey : Colors.black,
          foregroundColor: Colors.white,
        ),
        onPressed: _toggleFollow,
        child: Text(isFollowing ? 'Unfollow' : 'Follow'),
      ),
    );
  }
}



