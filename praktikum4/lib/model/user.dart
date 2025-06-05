class UserModel {
  final int userId;
  final int id;
  final String title;

  UserModel({required this.userId, required this.id, required this.title});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      id: json['id'],
      title: json['title'],
    );
  }
}
