import 'package:flutter/material.dart';
import 'package:uts/screens/dashboard_screen.dart';
import 'package:uts/screens/buku/buku_screen.dart';
import 'package:uts/screens/login_screen.dart';
import 'package:uts/screens/user/form_user_screen.dart';
import 'package:uts/screens/user/user_screen.dart';
 final routes  = <String, WidgetBuilder>
 {
   '/'        : (context) => (LoginScreen()),
   '/dashboard'    : (context) => (DashboardScreen()),
   '/user'         : (context) => (UserScreen()),
   '/user/form'    : (context) => (FormUserScreen()),
   '/buku'       : (context) => (BukuScreen()),
 };