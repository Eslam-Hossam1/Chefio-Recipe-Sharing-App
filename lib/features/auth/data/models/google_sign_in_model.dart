class GoogleSignInModel {
  final String googleId;
  final String email;
  final String username;
  final String profilePicture;
  final bool verified = true;

  GoogleSignInModel({
    required this.googleId,
    required this.email,
    required this.username,
    required this.profilePicture,
  });
  Map<String, dynamic> toJson() {
    return {
      "googleId": googleId,
      "email": email,
      "username": username,
      "profilePicture": profilePicture,
      "verified": verified
    };
  }
}
