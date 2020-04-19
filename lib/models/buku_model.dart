class BukuModel {
  int id;
  String name;
  String tipe;
  String stock;

  BukuModel({ this.id, this.name, this.tipe, this.stock });

  factory BukuModel.fromMap(Map<String, dynamic> data) {
    print(data);
    return BukuModel(
      id: data['id'],
      name: data['name'],
      tipe: data['tipe'],
      stock: data['stock'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id'    :id,
      'name'  :name,
      'tipe' :tipe,
      'stock' :stock
    };
  }
}

class BukuArguments {
  int id;
  String name;
  String tipe;
  String stock;
  int totalData;

  BukuArguments({ this.id, this.name, this.tipe, this.stock, this.totalData });
}