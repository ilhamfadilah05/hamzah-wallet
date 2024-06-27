class TransactionModel {
  String? id;
  String? idUser;
  String? idWallet;
  String? message;
  String? nameWallet;
  int? price;
  String? type;
  DateTime? createdAt;

  TransactionModel(
      {this.id,
      this.idUser,
      this.idWallet,
      this.message,
      this.nameWallet,
      this.price,
      this.type,
      this.createdAt});

  factory TransactionModel.fromJson(String? id, Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      idUser: json['id_user'],
      idWallet: json['id_wallet'],
      message: json['message'],
      nameWallet: json['name_wallet'],
      price: json['price'],
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_user': idUser,
      'id_wallet': idWallet,
      'message': message,
      'name_wallet': nameWallet,
      'price': price,
      'type': type,
      'created_at': createdAt
    };
  }
}
