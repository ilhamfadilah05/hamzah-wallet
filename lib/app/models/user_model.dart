class UserModel {
  String? id;
  String? gender;
  String? name;
  String? profileImage;
  String? email;
  int? saldo;

  UserModel(
      {this.id,
      this.gender,
      this.name,
      this.profileImage,
      this.email,
      this.saldo});

  factory UserModel.fromJson(String? id, Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        gender: json['gender'],
        name: json['name'],
        email: json['email'],
        profileImage: json['profile_image'],
        saldo: json['saldo']);
  }

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'saldo': saldo
    };
  }
}
