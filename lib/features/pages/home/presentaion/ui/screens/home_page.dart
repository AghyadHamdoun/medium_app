import 'package:flutter/material.dart';
import 'package:DevLogger/core/theme/app_color.dart';
import 'package:DevLogger/features/addArticle/presentaion/ui/screens/add_article_screen.dart';
import 'package:DevLogger/features/pages/home/presentaion/ui/widgets/article_list.dart';

import '../../../../../addArticle/presentaion/ui/widgets/quill_html_editor.dart';
import '../../../../../articleDetails/data/models/test_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
 late TabController tabController ;
 @override
  void initState() {
    super.initState();

    tabController = TabController(length:5 , vsync: this,initialIndex: 1 );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevLogger',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Implement notification functionality
            },
          ),
        ],
        bottom:  TabBar(
          controller: tabController,
          tabs: [
            InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddArticleScreen()));
              },
              child: Tab(
                icon: Icon(Icons.add),
              ),
            ),
            Tab(text: 'For you'),
            Tab(text: 'Following'),
            Tab(text: 'Flutter'),
            Tab(text: 'AWS'),
          ],
        ),
      ),
      body: TabBarView(
        controller:tabController ,
        children: [
          SizedBox(),
          ArticleList(articles:articles),
          const Center(child: Text('there is no articles yet!')),
          const Center(child: Text('there is no articles yet!')),
          const Center(child: Text('there is no articles yet!')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.blueColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddArticleScreen()));
        },
        child: const Icon(Icons.edit),
      ),


    );
  }
}




