
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DevLogger/features/pages/porfile/profile.dart';

import '../../core/theme/app_color.dart';
import 'explore/presentation/ui/screeens/explore_page.dart';
import 'favorite/presentaion/ui/screens/favorite_page.dart';
import 'home/presentaion/ui/screens/home_page.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;


  @override
  void initState() {
    super.initState();

    controller = PageController(initialPage: select, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          if (select != 0) {
            controller.jumpToPage(0);
            setState(() {
              select = 0;
            });
            return false;
          } else {
            SystemNavigator.pop();
            return true;
          }
        },
        child: Scaffold(
          body: PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
                HomePage(),
              ExploreTagsPage(),
              FavoritePage(),
               MyProfile(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 30,),
                label: '', // No label
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search,size: 30,),
                label: '', // No label
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark,size: 30,),
                label: '', // No label
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle,size: 30,),
                label: '', // No label
              ),
            ],
            currentIndex: select,
            onTap: (index) {
              setState(() {
                select = index;
              });
              controller.jumpToPage(select);
            },
            selectedItemColor: AppColor.blackColor,
            selectedFontSize: 16.sp,
            selectedIconTheme:
            IconThemeData(size: 30.r, color: AppColor.blackColor),
            showUnselectedLabels: true,
            unselectedIconTheme:
            IconThemeData(size: 30.r, color: Colors.grey),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
