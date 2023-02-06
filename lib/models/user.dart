class User{
  late int id;
  late String login;
  late String token;
  late String tokentype;

  User({required int id, required String login,required token,required tokentype});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json['user_id'] as int,
      login: json['user_login'] as String,
      token: json['access_token'] as String,
      tokentype: json['token_type'] as String,
    );
  }
}