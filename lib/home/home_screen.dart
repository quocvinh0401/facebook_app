import 'package:badges/badges.dart';
import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/page/page.dart';
import 'package:facebook_app/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(_handleTabSection);
    _scrollController = ScrollController();
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
  }

  void _handleTabSection() {
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool isScroll) {
          return [
            SliverAppBar(
              brightness: Brightness.light,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              pinned: true,
              floating: true,
              title: Text(
                'facebook',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
              actions: [
                Icon_Button(
                  icon: Icons.search,
                  onPress: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => SearchScreen()));
                  }
                ),
                Icon_Button(
                  icon: MdiIcons.facebookMessenger,
                  onPress: () => print('mess'),
                )
              ],
              bottom: TabBar(
                unselectedLabelColor: Colors.grey[700],
                labelColor: Colors.blue,
                controller: _tabController,
                tabs: [
                  Tab(
                      icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  )),
                  Tab(
                    child: Badge(
                      shape: BadgeShape.circle,
                      badgeContent: Text(
                        '13',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      badgeColor: Colors.red,
                      child: Icon(Icons.ondemand_video_outlined, size: 30),
                    ),
                  ),
                  Tab(
                      icon: Icon(
                    MdiIcons.accountCircleOutline,
                    size: 30,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  )),
                  Tab(icon: Icon(Icons.menu_outlined, size: 30))
                ],
              ),
            )
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            RefreshIndicator(
              color: Colors.blue,
              child: HomePage(
                controllerTab: _tabController,
                scrollController: _scrollController,
              ),
              onRefresh: refreshList,
              backgroundColor: Colors.white,
            ),
            WatchPage(),
            ProfilePage(),
            NotificationPage(),
            MenuPage(controller: _tabController)
          ],
        ),
      ),
    );
  }
}

