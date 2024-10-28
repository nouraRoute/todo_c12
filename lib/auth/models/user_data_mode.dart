class UserDataModel {
  String? name;
  String? email;
  String? id;
  UserDataModel({
    this.name,
    this.email,
    this.id,
  });
  UserDataModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          name: json['name'],
        );

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'id': id};
  }
}
