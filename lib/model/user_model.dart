class UserModel{
  int id = 0;
  String token = '';
  String username = '';
  String password = '';
  String supplier = '';
  UserModel(this.id,this.token,this.username,this.password,this.supplier);
  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    token = json['token'];
    username = json['username'];
    password = json['password'];
    supplier = json['supplier'];
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = Map<String,dynamic>();
    data['id'] = id;
    data['token'] = token;
    data['username'] = username;
    data['password'] = password;
    data['supplier'] = supplier;
    return data;
  }
}