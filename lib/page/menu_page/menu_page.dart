import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/home/home.dart';
import 'package:facebook_app/models/model.dart';
import 'package:facebook_app/page/menu_page/loading_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({this.controller});

  final TabController controller;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ScrollController _scrollController;
  String see = 'See More';
  bool isMore = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        constraints: BoxConstraints.expand(),
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MENU',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon_Button(
                    icon: Icons.search,
                    onPress: () {},
                  )
                ],
              ),
            ),
            FlatButton(
              onPressed: () =>
                  widget.controller.animateTo(widget.controller.index - 2),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey[300]))),
                child: Row(
                  children: [
                    CircleAvatarImage(
                      user: currentUser,
                      height: 40,
                      width: 40,
                    ),
                    SizedBox(width: 6),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: currentUser.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                        TextSpan(
                            text: '\nSee your profile',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)))
                      ]),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                crossAxisCount: 4,
                itemCount: items.length,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                itemBuilder: (BuildContext context, int index) {
                  final ItemMenu item = items[index];
                  if (index < 10) {
                    return Card(
                      elevation: 6,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              item.image,
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    if (isMore) {
                      return Card(
                        elevation: 6,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                item.image,
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(height: 4),
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.grey[300],
                onPressed: () {
                  setState(() {
                    isMore = !isMore;
                    if (isMore) {
                      see = 'See Less';
                    } else {
                      see = 'See More';
                    }
                  });
                },
                child: Text(
                  see,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Container(
              child: ExpansionTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(Icons.help, size: 32),
                ),
                title: Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                children: [
                  ChildrenExpansionTileCard(
                    widget: Image.asset('assets/images/help_center.png', height: 28, width: 28),
                    title: 'Help Center',
                  ),
                  ChildrenExpansionTileCard(
                    widget: Icon(MdiIcons.inboxFull),
                    title: 'Support Inbox',
                  ),
                  ChildrenExpansionTileCard(
                    widget: Icon(Icons.report_problem),
                    title: 'Report a Problem',
                  ),
                  ChildrenExpansionTileCard(
                    widget: Icon(Icons.help_center_outlined),
                    title: 'Term & Policies',
                  ),
                ],
              ),
            ),
            Container(
              child: ExpansionTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Image.asset('assets/images/settings.png', width: 30, height: 30,),
                ),
                title: Text(
                  'Setting & Policies',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                children: [
                  ChildrenExpansionTileCard(
                    widget: Image.asset('assets/images/privacy.png', height: 28, width: 28),
                    title: 'Privacy Shortcuts',
                  ),
                  ChildrenExpansionTileCard(
                    widget: Image.asset('assets/images/cellular.png', height: 28, width: 28),
                    title: 'Cellular Data Usage',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                color: Colors.grey[300],
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoadingLogout()));
                },
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



