import 'package:flutter/material.dart';
import 'list_tile_builder.dart';
import 'main.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({super.key});

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  String name = "Amir Reza";
  bool isVisibale = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[800],
      width: 250,
      child: ListView(
        children: <Widget>[
          drawerHeaderBuilder(context),
          Container(
            padding: EdgeInsets.zero,
            color: Colors.grey[700],
            child: Material(
              child: Column(
                children: [
                  Visibility(
                    visible: isVisibale,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: ListTile(
                            tileColor: Colors.grey[800],
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  child: AspectRatio(
                                      aspectRatio: 20 / 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(300),
                                        child: Image.asset(
                                          'assets/self.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            title: Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        listTileBuilder(
                          text: 'Contact',
                          icon: Icons.add,
                        ),
                        const Divider(
                          height: 1.0,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  listTileBuilder(
                    text: 'New Group',
                    icon: Icons.group,
                  ),
                  listTileBuilder(
                    text: 'Contact',
                    icon: Icons.person,
                  ),
                  listTileBuilder(
                    text: 'Calls',
                    icon: Icons.call,
                  ),
                  listTileBuilder(
                    text: 'People Nearby',
                    icon: Icons.person_pin_circle_outlined,
                  ),
                  listTileBuilder(
                    text: 'Saved Message',
                    icon: Icons.bookmark_border,
                  ),
                  listTileBuilder(
                    text: 'Settings',
                    icon: Icons.settings,
                  ),
                  const Divider(
                    height: 1.2,
                    color: Colors.black,
                  ),
                  listTileBuilder(
                    text: 'Invite Friends',
                    icon: Icons.person_add,
                  ),
                  listTileBuilder(
                    text: 'text:Telegram Info',
                    icon: Icons.info,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  DrawerHeader drawerHeaderBuilder(BuildContext context) {
    double turns = 0.0;
    void changeResulotaion() {
      setState(
        () {
          turns += 1.0 / 4.0;
        },
      );
    }

    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            color: Colors.grey[900],
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 6,
              top: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 60,
                width: 60,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(400),
                          ),
                          alignment: Alignment.center,
                          elevation: 0,
                          content: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: InteractiveViewer(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(300),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 60 / 65,
                                  child: Image.asset(
                                    'assets/self.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(200),
                      ),
                      child: AspectRatio(
                        aspectRatio: 30 / 30,
                        child: Image.asset(
                          'assets/self.jpg',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              left: 60,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: const Text(
                  '+98 840 8949',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 11,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: AnimatedRotation(
                duration: const Duration(
                  seconds: 1,
                ),
                turns: turns,
                child: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isVisibale = !isVisibale;
                        changeResulotaion();
                      },
                    );
                  },
                  icon: AnimatedRotation(
                    duration: const Duration(
                      seconds: 1,
                    ),
                    turns: turns,
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              height: 50,
              width: 50,
              child: InkWell(
                onTap: () {
                  setState(
                    () {
                      isIcon = !isIcon;
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 15,
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: isIcon
                        ? AnimatedOpacity(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            opacity: isIcon ? 1 : 0,
                            child: const Icon(
                              Icons.wb_sunny_rounded,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        : AnimatedOpacity(
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            curve: Curves.bounceIn,
                            opacity: isIcon ? 0 : 1,
                            child: const Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
