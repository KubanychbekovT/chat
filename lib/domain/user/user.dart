class User {
  final int id;
  final String nickname;
  final String email;
  final String role;
  bool selected;

  User({
     this.id = 0,
    required this.nickname,
    required this.email,
     this.role = '',
    this.selected = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] as int,
        nickname: json['nickname'] as String,
        email: json['email'] as String,
        role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'email': email,
      'role': role,
    };
  }
}
