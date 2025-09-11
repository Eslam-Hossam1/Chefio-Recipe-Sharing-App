import 'package:chefio_app/core/api/api_keys.dart';

enum FollowingState {
  notFollowing,
  following,
  me;

  factory FollowingState.fromJson(String? value) {
    switch (value) {
      case ApiKeys.apiTrue:
        return FollowingState.following;
      case ApiKeys.apiFalse:
        return FollowingState.notFollowing;
      case ApiKeys.me:
        return FollowingState.me;
      default:
        return FollowingState.notFollowing;
    }
  }

  String toJson() {
    switch (this) {
      case FollowingState.following:
        return ApiKeys.apiTrue;
      case FollowingState.me:
        return ApiKeys.me;
      case FollowingState.notFollowing:
        return ApiKeys.apiFalse;
    }
  }
}
