import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../data/models/article_model.dart';
import '../../../data/models/test_data.dart';

import '../widgets/comment_section_widget.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final String articleId;

  const ArticleDetailsScreen({super.key, required this.articleId});

  @override
  State<ArticleDetailsScreen> createState() => ArticleDetailsScreenState();
}

class ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late Article article;

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

    article = articles.firstWhere((article) => article.id == widget.articleId);
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
      icon: const Icon(Icons.close, color: AppColor.blackColor),
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
                  article.title,
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
                            article.authorImageUrl,
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
                            article.author, // Replace with actual name
                            style: TextStyle(
                                fontSize: 18.0.spMax, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${article.date.toString().substring(0, 10)}',
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
                CachedNetworkImage(
                  imageUrl: article.imageUrl,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
       20.verticalSpace,
       Html(
      data: """
         
                <h2>What is AI?</h2>
                <p>AI refers to the simulation of human intelligence in machines that are programmed to think and learn like humans. These systems can perform tasks that typically require human intelligence, such as visual perception, speech recognition, decision-making, and language translation.</p>
      
                <h2>Applications of AI</h2>
                <p>AI is being used in a variety of fields to enhance efficiency and innovation. Here are some key applications:</p>
                <ul>
                    <li><strong>Healthcare:</strong> AI is helping doctors diagnose diseases more accurately and develop personalized treatment plans.</li>
                    <li><strong>Finance:</strong> AI algorithms are improving fraud detection and enabling more sophisticated trading strategies.</li>
                    <li><strong>Retail:</strong> AI-driven recommendation systems are enhancing the shopping experience by suggesting products based on user preferences.</li>
                    <li><strong>Transportation:</strong> Autonomous vehicles are set to revolutionize the way we travel, reducing accidents and traffic congestion.</li>
                </ul>
      
                <h2>The Future of AI</h2>
                <p>As AI technology continues to evolve, it will open up new possibilities and challenges. Ethical considerations, such as data privacy and job displacement, need to be addressed to ensure that AI benefits society as a whole. By embracing AI responsibly, we can unlock its full potential and create a better future for everyone.</p>
      
                <p>In conclusion, AI is a powerful tool that has the potential to transform various aspects of our lives. By understanding its capabilities and limitations, we can harness its power to drive innovation and improve our world.</p>
              """,
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
