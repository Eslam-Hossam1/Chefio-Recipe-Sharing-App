class Sender {
  String? id;
  String username;
  String? profilePicuture;
  Sender({required this.id,required this.username, this.profilePicuture});

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        id: json['_id'] as String,
        username: json['username'] as String,
        profilePicuture: json['profilePicture'] as String? ,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'username': username,
        'profilePicture':profilePicuture
      };
}
