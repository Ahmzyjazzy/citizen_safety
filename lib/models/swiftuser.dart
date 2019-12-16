class User {
  final dynamic data;

  User({
    this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      data: json['DATA'],
    );
  }

  Map<String, dynamic> toJson() { //covert to Map
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DATA'] = this.data;
    return data;
  }
}
