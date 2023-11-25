class User {
  final int userId;
  final String nickname;
  final String email;
  bool selected;

  User({
     this.userId = 0,
    required this.nickname,
    required this.email,
    this.selected = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['id'] as int,
        nickname: json['nickname'] as String,
        email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickname': nickname,
      'email': email,
    };
  }
}
