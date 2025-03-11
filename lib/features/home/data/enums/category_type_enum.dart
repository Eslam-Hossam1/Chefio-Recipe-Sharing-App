enum CategoryType {
  all,
  food,
  drink,
}

extension CategoryTypeExtension on CategoryType {
  String get name {
    switch (this) {
      case CategoryType.all:
        return "aLL";
      case CategoryType.food:
        return "food";
      case CategoryType.drink:
        return "drink";
    }
  }
}
