// ignore_for_file: file_names

enum MyCategoryType {
  phones,
  laptops,
  fragrance,
  groceries,
  skincare,
  homeDecoration
}

String parseCategoryToString(MyCategoryType filter) {
  switch (filter) {
    case MyCategoryType.phones:
      return "Smartphones";
    case MyCategoryType.laptops:
      return "Laptops";
    case MyCategoryType.fragrance:
      return "Fragrances";
    case MyCategoryType.groceries:
      return "Groceries";
    case MyCategoryType.skincare:
      return "SkinCare";
    case MyCategoryType.homeDecoration:
      return "Home-Decorations";
    default:
      return "Smartphones";
  }
}

String parseCategoryToUrl(MyCategoryType filter) {
  switch (filter) {
    case MyCategoryType.phones:
      return "smartphones";
    case MyCategoryType.laptops:
      return "laptops";
    case MyCategoryType.fragrance:
      return "fragrances";
    case MyCategoryType.groceries:
      return "groceries";
    case MyCategoryType.skincare:
      return "skincare";
    case MyCategoryType.homeDecoration:
      return "home-decoration";
    default:
      return "smartphones";
  }
}
