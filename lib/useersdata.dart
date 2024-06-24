class UsersData {
  String? name;
  String? password;
  String? email;
  String? title;

  UsersData(
      {required this.password,
      required this.email,
      required this.name,
      required this.title});

  Map<String, dynamic> ToMap() {
    return {
      "name": name,
      "password": password,
      "email": email,
      "tilte": title,
    };
  }
}
