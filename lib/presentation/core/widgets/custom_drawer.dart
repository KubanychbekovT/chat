import 'package:chat/presentation/chat/more/settings/settings_page.dart';
import 'package:chat/presentation/chat/more/user_information/user_information_page.dart';
import 'package:chat/presentation/chat/widgets/select_user.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width / 2;
    return Drawer(
        child: Container(
            width: drawerWidth,
            color: const Color(0xff1b252f),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 26),
                    child: ListTile(
                      title: Text(
                        'Tiger',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.grey),
                    title: const Text(
                      'My Information',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserInformationPage(nickname: 'Tiger', email: 'amur@gmail.com',),));
                    },
                  ),
                  const Divider(color: Colors.black54),
                  ListTile(
                    leading: const Icon(Icons.chat,
                        color: Colors.grey),
                    title: const Text('New Group',
                        style: TextStyle(color: Colors.white)),
                     onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectContact()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings,
                        color: Colors.grey),
                    title: const Text('Settings',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.grey),
                    title: const Text('Log Out',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }
}
