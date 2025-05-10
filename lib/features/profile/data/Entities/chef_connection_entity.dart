class ChefConnectionEntity {
  final String chefId;
  final String chefUsername;
  final String? chefProfilePicture;
  bool isFollowing;

  ChefConnectionEntity({required this.chefId, required this.chefUsername, required this.chefProfilePicture, required this.isFollowing});
}
