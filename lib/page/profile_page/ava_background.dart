import 'package:facebook_app/Widgets/widgets.dart';
import 'package:facebook_app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Ava_Background extends StatelessWidget {
  ImageProvider getBackgroundImage = NetworkImage(currentUser.imageUrl);
  ImageProvider getAvaImage = NetworkImage(currentUser.imageUrl);

  showBottomSheet(context, List<Widget> children) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottemSheet(
            children: children
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(overflow: Overflow.visible, children: [
      GestureDetector(
        onTap: () {
          showBottomSheet(
            context,
            [
              ListTileItem(
                icon: Icons.photo,
                text: 'View Profile Cover',
              ),
              ListTileItem(
                icon: Icons.upload_sharp,
                text: 'Upload Photo',
              ),
              ListTileItem(
                icon: MdiIcons.facebook,
                text: 'Select Photo on Facebook',
              ),
              ListTileItem(
                icon: Icons.create,
                text: 'Create Cover Collage',
              ),
              ListTileItem(
                icon: Icons.create,
                text: 'Select Artwork',
              ),
            ],
          );
        },
        child: Container(
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0)),
              image: DecorationImage(
                  image: getBackgroundImage, fit: BoxFit.cover)),
        ),
      ),
      Positioned(
          bottom: -90,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                GestureDetector(
                  onTap: (){
                    showBottomSheet(
                      context,
                      [
                        ListTileItem(
                          icon: Icons.photo,
                          text: 'Add Frame',
                        ),
                        ListTileItem(
                          icon: Icons.upload_sharp,
                          text: 'Take New Profile Video',
                        ),
                        ListTileItem(
                          icon: MdiIcons.facebook,
                          text: 'Select Profile Video',
                        ),
                        ListTileItem(
                          icon: Icons.create,
                          text: 'Select Profile Picture',
                        ),
                        ListTileItem(
                          icon: Icons.create,
                          text: 'View Profile Picture',
                        ),
                        ListTileItem(
                          icon: Icons.create,
                          text: 'Make Avatar Profile Picture',
                        ),
                      ],
                    );
                  },
                  child: Container(
                    width: 180.0,
                    height: 180.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4.0, color: Colors.white),
                      shape: BoxShape.circle,
                      image:
                          DecorationImage(image: getAvaImage, fit: BoxFit.cover),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                  },
                  child: Icon_Button(
                    icon: Entypo.camera,
                    onPress: () => print('camera'),
                    size: 28.0,
                  ),
                ),
              ],
            ),
          )),
      Positioned(
          bottom: 15.0,
          right: 15.0,
          child: Icon_Button(
            icon: Entypo.camera,
            onPress: () {
              showBottomSheet(
                context,
                [
                  ListTileItem(
                    icon: Icons.photo,
                    text: 'View Profile Cover',
                  ),
                  ListTileItem(
                    icon: Icons.upload_sharp,
                    text: 'Upload Photo',
                  ),
                  ListTileItem(
                    icon: MdiIcons.facebook,
                    text: 'Select Photo on Facebook',
                  ),
                  ListTileItem(
                    icon: Icons.create,
                    text: 'Create Cover Collage',
                  ),
                  ListTileItem(
                    icon: Icons.create,
                    text: 'Select Artwork',
                  ),
                ],
              );
            },
            size: 28.0,
          )),
    ]);
  }
}

class BottemSheet extends StatelessWidget {
  BottemSheet({this.children});

  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
