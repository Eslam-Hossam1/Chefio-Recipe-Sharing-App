enum CategoryType { all, food, drink }

extension CategoryTypeExtension on CategoryType {
  String get name {
    switch (this) {
      case CategoryType.all:
        return "ALL";
      case CategoryType.food:
        return "Food";
      case CategoryType.drink:
        return "Drink";
    }
  }
}
