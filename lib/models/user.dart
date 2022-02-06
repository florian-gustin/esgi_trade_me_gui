

class User {
  String email;
  String? password;
  DateTime? lastDate;

  User({required this.email, this.password, this.lastDate});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json["email"], password: json["password"], lastDate: json["last_date"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "email" : email,
      "password" : password,
      "last_date": lastDate
    };
  }
}