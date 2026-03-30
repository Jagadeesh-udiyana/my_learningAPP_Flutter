class UserModel {
  String id;
  String name;
  String email;
  String? gender;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'gender': gender,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
    );
  }
}
