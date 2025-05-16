import 'dart:io';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../articleDetails/data/models/article_model.dart';


class PreviewScreen extends StatefulWidget {
final  String title;
 final File articleImage;
 final String htmlData;


  const PreviewScreen({super.key, required this.title,required this.articleImage,required this.htmlData});

  @override
  State<PreviewScreen> createState() => PreviewScreenState();
}

class PreviewScreenState extends State<PreviewScreen> {


  late final ScrollController _scrollController;
  bool _isBottomNavVisible = true;

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_isBottomNavVisible) {
        setState(() {
          _isBottomNavVisible = true;
        });
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined, color: AppColor.blackColor),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            PopupMenuButton<String>(
              iconColor: AppColor.blackColor,
              onSelected: (String item) {
                switch (item) {
                  case 'edit':
                  // TODO: Implement edit functionality
                    break;
                  case 'delete':
                  // TODO: Implement delete functionality
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 30.spMax, fontWeight: FontWeight.bold),
                ),
                20.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Image container
                    Container(
                      width: 50.0,
                      height: 50.0,
                      clipBehavior: Clip.antiAlias,
                      // Ensures rounded corners if desired
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpE5eYPFPxZX0oQk_7e-R7ljAOHMokM-zVNA&s',
                          ),
                          fit: BoxFit.cover, // Adjust image fitting if needed
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0), // Spacing between image and name

                    // Name text
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Aghyad Hamdoun", // Replace with actual name
                            style: TextStyle(
                                fontSize: 18.0.spMax, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${DateTime.now().toString().substring(0, 10)}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    // Follow button
                    Text(
                      "Follow",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                  ],
                ),
                20.verticalSpace,
                Image.file(widget.articleImage),
                20.verticalSpace,
                Html(
                  data: widget.htmlData,
                ),

                // Container(height: 400.h,child: CommentSection(article: article)),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _isBottomNavVisible ? kBottomNavigationBarHeight : 0,
          child: Wrap(
            children: [
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,color: AppColor.blackColor,),
                    label: 'Likes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.comment),
                    label: 'Comments',
                  ),
                ],
                currentIndex: 0,
                // Set the current index if needed
                selectedItemColor: Colors.blue,
                showSelectedLabels: false,
                // Hide labels
                showUnselectedLabels: false, // Hide labels
              ),
            ],
          ),
        ),
      ),
    );
  }
}
