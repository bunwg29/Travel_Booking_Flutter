import 'dart:convert';

class RequetsUpdateCustomer {
  int? idUser;
  String? username;
  String? phone;
  String? img;

  RequetsUpdateCustomer({
    this.idUser,
    this.username,
    this.phone,
    this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      if (idUser != null) 'idUser': idUser,
      if (username != null) 'username': username,
      if (phone != null) 'phone': phone,
      if (img != null) 'img': img,
    };
  }

  factory RequetsUpdateCustomer.fromMap(Map<String, dynamic> map) {
    return RequetsUpdateCustomer(
      idUser: map['idUser'] != null ? map['idUser'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RequetsUpdateCustomer.fromJson(String source) =>
      RequetsUpdateCustomer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequetsUpdateCustomer(idUser: $idUser,  username: $username, phone: $phone, img: $img)';
  }
}
