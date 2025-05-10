abstract class ProfileExpectedResponseHelper {
  static const Map<String, dynamic> fetchProfileWithInitialRecipes = {
    "success": true,
    "message": "User profile fetched successfully!",
    "profile": {
      "username": "Abdelrhman hegazy",
      "email": "abdelrhmanhegazy0120@gmail.com",
      "profilePicture":
          "https://res.cloudinary.com/dj3wmknwu/image/upload/v1746017577/chefio/mvh2sucdu4qm8gnzuikp.jpg",
      "followersCount": 0,
      "followingCount": 0,
      "isFollowing": "not_following",
      "recipes": {
        "totalRecipes": 9,
        "currentPage": 2,
        "totalPages": 9,
        "recipes": [
          {
            "_id": "680907f1934e126d7f72c2f2",
            "foodName": "مكرونه بالسجق",
            "recipePicture":
                "https://res.cloudinary.com/dj3wmknwu/image/upload/v1745422311/chefio/jxvrjti1qj9yhaohaogc.jpg",
            "cookingDuration": 30,
            "category": {
              "_id": "67bf9f6786ed186f039bc3c2",
              "name": "General Dishes"
            },
            "isLiked": false
          }
        ]
      }
    }
  };

  static const Map<String, dynamic> fetchChefRecipes = {
    "success": true,
    "message": "User recipes fetched successfully!",
    "recipes": {
      "totalRecipes": 9,
      "currentPage": 2,
      "totalPages": 9,
      "recipes": [
        {
          "_id": "680907f1934e126d7f72c2f2",
          "foodName": "مكرونه بالسجق",
          "recipePicture":
              "https://res.cloudinary.com/dj3wmknwu/image/upload/v1745422311/chefio/jxvrjti1qj9yhaohaogc.jpg",
          "cookingDuration": 30,
          "category": {
            "_id": "67bf9f6786ed186f039bc3c2",
            "name": "General Dishes"
          },
          "isLiked": false
        }
      ]
    }
  };

  static const Map<String, dynamic> fetchChefLikedRecipes = {
    "success": true,
    "message": "User liked recipes fetched successfully!",
    "recipes": {
      "totalLikedRecipes": 3,
      "currentPage": 2,
      "totalPages": 3,
      "recipes": [
        {
          "_id": "67d771a841da91e4f16a0658",
          "foodName": "مكرونه بالسجق",
          "recipePicture":
              "https://res.cloudinary.com/dj3wmknwu/image/upload/v1742172583/chefio/dpcrnkgegihbwvicjnh0.jpg",
          "cookingDuration": 30,
          "category": {
            "_id": "67bf9f6786ed186f039bc3c2",
            "name": "General Dishes"
          },
          "createdBy": {
            "_id": "67d2ebbe5b67e148c1d7cb4f",
            "username": "Abdelrhman hegazy",
            "profilePicture":
                "https://res.cloudinary.com/dj3wmknwu/image/upload/v1746017577/chefio/mvh2sucdu4qm8gnzuikp.jpg"
          },
          "isLiked": true
        }
      ]
    }
  };

  static const Map<String, dynamic> fetchChefFollowing = {
    "success": true,
    "following": [
      {
        "_id": "67ce1072413bba22b5ed790c",
        "username": "Lynn.Jerde",
        "profilePicture": "https://randomuser.me/api/portraits/men/0.jpg",
        "isFollowed": true
      }
    ]
  };
  static const Map<String, dynamic> fetchChefFollowers = {
    "success": true,
    "followers": [
      {
        "_id": "67da5afe0703bff9b1fe68fa",
        "username": "eslam",
        "isFollowed": true
      },
      {
        "_id": "67d2ebbe5b67e148c1d7cb4f",
        "username": "Abdelrhman hegazy",
        "profilePicture":
            "https://res.cloudinary.com/dj3wmknwu/image/upload/v1746017577/chefio/mvh2sucdu4qm8gnzuikp.jpg",
        "isFollowed": true
      }
    ]
  };
}
