import 'package:flutter/material.dart';

import '../../../../article/data/models/test_data.dart';
import '../widgets/article_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home',style: TextStyle(fontWeight: FontWeight.bold),),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                // Implement notification functionality
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(text: 'For you'),
              Tab(text: 'Following'),
              Tab(text: 'Flutter'),
              Tab(text: 'AWS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InkWell(
              onTap: () {},
            ),
            ArticleList(articles: articles),
            const Center(child: Text('Trending')),
            const Center(child: Text('flutter')),
            const Center(child: Text('c#')),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Disable shifting animation
          items:const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black,size: 30,),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.grey,size: 30,),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark, color: Colors.grey,size: 30,),
              label: '', // No label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle, color: Colors.grey,size: 30,),
              label: '', // No label
            ),
          ],
          backgroundColor: Colors.white, // Background color
          currentIndex: 1,
          selectedItemColor: Colors.blue, // Selected icon color
          unselectedItemColor: Colors.grey, // Unselected icon color
          onTap: (index){},
        ),

      ),
    );
  }
}




