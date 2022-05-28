import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = "20220515_164751.jpg";
    return Drawer(
    
      child: Container(
        
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Sadia Sultana",
                    style: TextStyle(color: Colors.white),
                  ),
                  accountEmail: Text(
                    "sultanasadia785@gmail.com",
                    style: TextStyle(color: Colors.white),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                )),
                ListTile(
                  leading: Icon(CupertinoIcons.home,color: Colors.white,),
                  title:Text("Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ) ,
                ),
                  ListTile(
                  leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                  title:Text("Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ) ,
                ),
                  ListTile(
                  leading: Icon(CupertinoIcons.mail_solid,color: Colors.white,),
                  title:Text("Email me",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ) ,
                ),
          ],
        ),
      ),
    );
  }
}
