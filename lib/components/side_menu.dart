import 'package:flutter/material.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('lib/assets/images/syringes.jpg')),
            DrawerListTile(title: 'ABG',icon: const Icon(Icons.calculate),press: (){},),
          ],
        ),
      ),
    );
  }

}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);
  final String title;
  final Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: icon,
      title: Text(title,style: const TextStyle(color: Colors.white54),),

    );
  }}