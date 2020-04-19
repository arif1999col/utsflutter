class UserModel {
 int id;
 String username;
 String name;
 String password;
 String role;

  UserModel({this.id, this.name, this.username, this.password, this.role});

  factory UserModel.fromDatabaseJson(Map<String, dynamic> data) => UserModel(
      id        : data['id'],
      name      : data['name'],
      username  : data['username'],
      password  : data['password'],
      role      : data['role']
  );

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id        : data['id'],
      name      : data['name'],
      username  : data['username'],
      password  : data['password'],
      role      : data['role']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id'        : id,
      'username'  : username,
      'name'      : name,
      'password'  : password,
      'role'      : role
    };
  }
}

class UserArguments {
  int id;
  String username;
  String name;
  String password;
  String role;
  int totalData;

  UserArguments({this.id, this.name, this.username, this.password, this.role, this.totalData});
}