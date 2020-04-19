import 'package:flutter/material.dart';
import 'package:uts/components/drawer_component.dart';
import 'package:uts/components/header_component.dart';
import 'package:uts/screens/buku/form_buku_screen.dart';
import 'package:uts/styles/color_style.dart';
import 'package:uts/models/buku_model.dart';
import 'package:uts/respository/buku_repository.dart';
class BukuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _BukuState();
  }
  
}

class _BukuState extends State<BukuScreen> {

  List bukus = new List();

  void initState() {
    super.initState();
  
    getBukus();
  }

  getBukus() async {
    BukuRepository().getAllBuku().then((result) {
      this.setState(() {
        result.forEach((buku) {
          // print(buku);
          bukus.add(BukuModel.fromMap(buku));
        });
      });
    });
  }

  Widget CardList(id, name,tipe, stock) {
    return Card(
      color: ColorStyle.dark,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormBukuScreen(),
              settings: RouteSettings(
                arguments: BukuArguments(
                  id: id,
                  name: name,
                  tipe:tipe,
                  stock: stock,
                  totalData: bukus.length
                ),
              ),
            ),
          );
        },
        child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(name, style: TextStyle(color: Colors.white, fontSize: 18.0),),
                Text('Tipe : $tipe', style: TextStyle(color: Colors.white24),),
                 Text('Stok Buku : $stock', style: TextStyle(color: Colors.white24),)
              ],
            ),
            Icon(
                    Icons.edit,
                    color: Colors.white30,
                  )
          ],
        ),
      ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.abu,
      drawer: DrawerComponent(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 65.0),
              child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: bukus != null ? bukus.length : 0,
                          itemBuilder: (BuildContext context, int index){
                            return CardList(bukus[index].id, 
                              bukus[index].name, bukus[index].tipe, 
                              bukus[index].stock);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
            )
          ),
          HeaderComponent(title: 'Buku', gradient1: ColorStyle.abu, gradient2: ColorStyle.abu),
        ],
      ),
      floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormBukuScreen(),
              // Pass the arguments as part of the RouteSettings. The
              // ExtractArgumentScreen reads the arguments from these
              // settings.
              settings: RouteSettings(
                arguments: BukuArguments(
                  id: 0,
                  totalData: bukus != null ? bukus.length : 0
                ),
              ),
            ),
          );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: ColorStyle.blue,
                ),
    );
  }
  
}