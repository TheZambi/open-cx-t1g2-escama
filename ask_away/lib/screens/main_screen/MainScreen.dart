import 'package:ask_away/components/SimpleButton.dart';
import 'package:ask_away/components/UserIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../talks_screen/TalksScreen.dart';
import 'components/SideMenu.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: DrawerComponent(),
      appBar: MainScreenAppBar(_drawerKey),
      body: Container(
        color: Color(0xFFE5E5E5),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 40,
                  right: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ask Away",
                      style: TextStyle(
                        fontSize: 55,
                      ),
                    ),
                    Text(
                      "Every great answer starts with a great question.",
                      style: TextStyle(
                        color: Color(0xFF9A9A9A),
                        fontSize: 35,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          bottom: 70,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                            SimpleButton(
                              "Find talk",
                              () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TalksScreen(),
                                  ),
                                );
                              },
                              37,
                              Color(0xFFE11D1D),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

MainScreenAppBar(GlobalKey<ScaffoldState> _drawerKey) {
  return AppBar(
    toolbarHeight: 100,
    leading: Padding(
      padding: const EdgeInsets.only(left: 10),
      child: new IconButton(
        icon: new Icon(
          Icons.menu,
          size: 40,
          color: Colors.black,
        ),
        onPressed: () => {_drawerKey.currentState.openDrawer()},
      ),
    ),
    backgroundColor: Color(0xFFE5E5E5),
    elevation: 0.0,
    actions: [
      Padding(
          padding: const EdgeInsets.only(
            top: 20,
            right: 10,
          ),
          child: UserIcon()),
    ],
  );
}