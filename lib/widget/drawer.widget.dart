import 'package:flutter/material.dart';

class MyAppDrawer extends StatelessWidget {
  const MyAppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Theme.of(context).primaryColor])),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/profile.png"),
                    radius: 50,
                  )
                ],
              )),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/home");
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            title: Text("Products"),
            leading: Icon(Icons.production_quantity_limits_sharp,
                color: Theme.of(context).primaryColor),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/products");
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          )
        ],
      ),
    );
  }
}
