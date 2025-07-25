class ChatUser {
  final String id;
  final String phone;
  final String? name;
  final String? avatarUrl;

  ChatUser({
    required this.id,
    required this.phone,
    this.name,
    this.avatarUrl,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'] as String,
      phone: json['phone'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'avatar_url': avatarUrl,
    };
  }
}