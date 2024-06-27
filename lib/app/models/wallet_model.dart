class WalletModel {
  String? id;
  String? idUser;
  String? name;
  String? image;
  String? noRek;
  String? color;
  int? saldo;

  WalletModel(
      {this.id,
      this.idUser,
      this.name,
      this.image,
      this.saldo,
      this.noRek,
      this.color});

  factory WalletModel.fromJson(String? id, Map<String, dynamic> json) {
    return WalletModel(
        id: json['id'],
        idUser: json['id_user'],
        name: json['name'],
        image: json['image'],
        noRek: json['no_rek'],
        color: json['color'],
        saldo: json['saldo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'name': name,
      'image': image,
      'saldo': saldo,
      'no_rek': noRek,
      'color': color
    };
  }
}
