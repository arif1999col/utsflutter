import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerComponent extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    logout() {
    Future.delayed(Duration(milliseconds: 2000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('logged_in', false);
      Navigator.pushReplacementNamed(context, '/');
    });
  }
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('images/buku.png')
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/dashboard');
            },
          ),
          ListTile(
            title: Text('Pengguna'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/user');
            },
          ),
          ListTile(
            title: Text('Buku'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/buku');
            },
          ),
              ListTile(
            title: Text('Logout'),
            onTap: () {
              logout();
              child: Text(
                          'Logout', 
                          style: TextStyle(color: Colors.white),
              );
            },
          )
        ],
      ),
    );
  }

}