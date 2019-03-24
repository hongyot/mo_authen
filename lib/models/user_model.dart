class UserModel {

  // field
  int id;
  String  name, email, password;



  // Constructor
UserModel(this.id, this.name, this.email,this.password);

UserModel.fromJson(Map<String,dynamic> parseJSON){ //map รับค่าที่เหมือนเป็น array หรือก็คือค่า Json นั่นเอง Dynamic เป็นได้ทุก data type
  id = int.parse(parseJSON['id']);
  name =parseJSON['Name'];
  email =parseJSON['User'];
  password =parseJSON['Password'];

}

  
}