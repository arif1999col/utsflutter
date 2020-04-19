import 'package:flutter/material.dart';
import 'package:uts/components/button_component.dart';
import 'package:uts/components/drawer_component.dart';
import 'package:uts/components/header_component.dart';
import 'package:uts/components/input_component.dart';
import 'package:uts/models/user_model.dart';
import 'package:uts/styles/color_style.dart';
import 'package:uts/styles/input_style.dart';
import 'package:uts/respository/use_repository.dart';


class FormUserScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _FormUserState();
  }
}

class FormUser {
  int id;
  String name;
  // String username;
  // String password;
  String role;

  FormUser(this.id, this.name, this.role);
}

class _FormUserState extends State<FormUserScreen> {

  int id = 0;
  int totalData = 0;
  TextEditingController name      = new TextEditingController();
  TextEditingController username  = new TextEditingController();
  TextEditingController password  = new TextEditingController();

  List _roles = ["Admin", "Pegawai","Anggota"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentRole;

  void initState() {
    super.initState();

    _dropDownMenuItems = getDropDownMenuItems();
    _currentRole = _dropDownMenuItems[1].value;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String role in _roles) {
      print(role);
      items.add(new DropdownMenuItem(
          value: role,
          child: new Text(role)
      ));
    }
    return items;
  }

  saveUser() {
    final user = UserModel(
      id: id == 0 ? totalData + 1 : id,
      name: name.text,
      username: username.text,
      password: password.text,
      role: _currentRole
    );

    if (totalData != 0) {
      if (id == 0) {
        print('New Data');
        UserRepository().storeUser(user).then((result) {
          print(result);
          Navigator.pushReplacementNamed(context, '/user');
        });
      } else {
        print('Update Data');
        UserRepository().updateUser(user).then((result) {
          print(result);
          Navigator.pushReplacementNamed(context, '/user');
        });
      }
    }
  }

  deleteUser() {
    if (id != 0) {
      UserRepository().deleteUser(id).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/user');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserArguments args  = ModalRoute.of(context).settings.arguments;
    if (args.id != 0) {
      name.value        = TextEditingValue(text: args.name, selection: name.selection);
      username.value    = TextEditingValue(text: args.username, selection: username.selection);
      password.value    = TextEditingValue(text: args.password, selection: password.selection);

      this.setState(() {
        id              = args.id;
        _currentRole    = args.role;
        totalData       = args.totalData;
      });
    } else {
      this.setState(() {
        totalData       = args.totalData;
      });
    }

    return Scaffold(
      backgroundColor: ColorStyle.abu,
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 80.0),
              child: Padding(
                  padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    InputComponent(
                      controller: name,
                      style: InputStyle.roundPinkInput,
                      hint: name.text == '' ? 'Name' : '',
                      icon: Icons.people,
                    ),
                    InputComponent(
                      controller: username,
                      style: InputStyle.roundPinkInput,
                      hint: username.text == '' ? 'Username' : '',
                      icon: Icons.people,
                    ),
                    InputComponent(
                      controller: password,
                      style: InputStyle.roundPinkInput,
                      hint: password.text == '' ? 'Password' : '',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                          width: 400.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50.0)
                          ),
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              child: Theme(
                                data: ThemeData(
                                  canvasColor: ColorStyle.dark,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    value: _currentRole,
                                    style: TextStyle(color: Colors.white),
                                    hint: Text('Pilih Role'),
                                    items:_dropDownMenuItems,
                                    onChanged: (val) {
                                      this.setState(() {
                                        _currentRole  = val;
                                      });
                                    },
                                  ),
                                ),
                              )
                          )
                      ),
                    ),
                    ButtonComponent('Simpan', ColorStyle.white, ColorStyle.pink, () {
                      saveUser();
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: id != 0 ? ButtonComponent('Delete', Colors.redAccent, Colors.redAccent, () {
                        deleteUser();
                      }) : Container(),
                    )
                  ],
                ),
              ),
            ),
            HeaderComponent(title: 'Pengguna', gradient1: ColorStyle.abu, gradient2: ColorStyle.abu),
          ],
        ),
      )
    );
  }
  
}