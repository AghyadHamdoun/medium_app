import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreTagsPage extends StatelessWidget {
  final List<Map<String, List<String>>> topics = [
    {
      'IT': ['Programming', '.NET', 'Flutter', 'AWS', 'PHP'],
    },
    {
      'Cooking': ['Diet', 'Cookies', 'Sweets'],
    },
  ];

   ExploreTagsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DevLogger',style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBox(),
           16.verticalSpace,
            Expanded(
              child: ListView(
                children: topics.map((topic) {
                  final topicName = topic.keys.first;
                  final tags = topic[topicName]!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          topicName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: tags.map((tag) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      tag,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black, // Button color
                                      foregroundColor: Colors.white, // Text color
                                      padding: EdgeInsets.symmetric(horizontal: 16), // Adjust horizontal padding
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8), // Rounded corners
                                      ),
                                    ),
                                    onPressed: () {
                                      // Handle follow button tap
                                      print('Followed tag: $tag');
                                    },
                                    child: Text('Follow'),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search tags...',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}