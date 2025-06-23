class ProfileLocalization {
  const ProfileLocalization._();
  static const ProfileLocalization instance = ProfileLocalization._();
  final String chefHasNoFollwers = "profile.chef_has_no_followers";
  final String chefDidntFollowAnyChefYet =
      "profile.chef_didn't_follow_any_chef_yet";

  // Tab labels
  final String recipes = "profile.recipes";
  final String liked = "profile.liked";
  final String followers = "profile.followers";
  final String following = "profile.following";

  // Follow button states
  final String follow = "profile.follow";
  final String followed = "profile.followed";

  // Profile actions
  final String shareProfile = "profile.share_profile";
  final String editProfile = "profile.edit_profile";

  // Error messages
  final String tryAgain = "profile.try_again";
}
