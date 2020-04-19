import 'package:flutter/material.dart';
import 'package:uts/components/button_component.dart';
import 'package:uts/components/drawer_component.dart';
import 'package:uts/components/header_component.dart';
import 'package:uts/components/input_component.dart';
import 'package:uts/models/buku_model.dart';
import 'package:uts/respository/buku_repository.dart';
import 'package:uts/styles/color_style.dart';
import 'package:uts/styles/input_style.dart';

class FormBukuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FormBukuState();
  }
  
}

class _FormBukuState extends State<FormBukuScreen> {

  int id        = 0;
  int totalData = 0;

  TextEditingController name    = new TextEditingController();
  TextEditingController tipe   = new TextEditingController();
  TextEditingController stock   = new TextEditingController();

  saveBuku() {
    final buku = BukuModel(
      id    : id == 0 ? totalData + 1 : id,
      name  : name.text,
      tipe : tipe.text,
      stock : stock.text
    );

    if (id == 0) {
      BukuRepository().storeBuku(buku).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/buku');
        });
      });
    } else {
      BukuRepository().updateBuku(buku).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/buku');
        });
      });
    }
  }

  deleteBuku() {
    if (id != 0) {
      BukuRepository().deleteBuku(id).then((result) {
        Future.delayed(Duration(milliseconds: 2000), () {
          Navigator.pushReplacementNamed(context, '/buku');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final BukuArguments args  = ModalRoute.of(context).settings.arguments;
    if (args.id != 0) {
      name.value    = TextEditingValue(text: args.name, selection: name.selection);
      tipe.value   = TextEditingValue(text: args.tipe, selection: tipe.selection);
      stock.value   = TextEditingValue(text: args.stock, selection: stock.selection);
      this.setState(() {
        id              = args.id;
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
                      style: InputStyle.roundBlueInput,
                      hint: name.text == '' ? 'Nama Buku' : '',
                      icon: Icons.book,
                    ),
                    InputComponent(
                      controller: tipe,
                      style: InputStyle.roundBlueInput,
                      hint: tipe.text == '' ? 'Tipe Buku' : '',
                      icon: Icons.trip_origin,
                    ),
                    InputComponent(
                      controller: stock,
                      style: InputStyle.roundBlueInput,
                      hint: stock.text == '' ? 'Jumlah' : '',
                      icon: Icons.folder,
                    ),
                    ButtonComponent('Simpan', ColorStyle.blue, ColorStyle.green, () {
                      saveBuku();
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      child: id != 0 ? ButtonComponent('Delete', Colors.redAccent, Colors.redAccent, () {
                        deleteBuku();
                      }) : Container(),
                    )
                  ],
                ),
              ),
            ),
            HeaderComponent(title: 'Buku', gradient1: ColorStyle.abu, gradient2: ColorStyle.abu),
          ],
        ),
      )
    );
  }
  
}