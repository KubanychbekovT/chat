import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final double drawerWidth =
        MediaQuery.of(context).size.width / 2;
    return Drawer(
        child: Container(
            width: drawerWidth,
            color: Color(0xff1b252f),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26),
                    child: ListTile(
                      title: const Text(
                        'Tiger',
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.white),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.grey),
                    title: const Text('Моя информация', style: TextStyle(color: Colors.white),),
                    onTap: () {},
                  ),
                  const Divider(color: Colors.black54),

                  ListTile(
                    leading: const Icon(Icons.question_mark_outlined, color: Colors.grey),
                    title: const Text('Частые вопросы', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications_none_outlined, color: Colors.grey),
                    title: const Text('Уведомления', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.grey),
                    title: const Text('Выйти', style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }
}
