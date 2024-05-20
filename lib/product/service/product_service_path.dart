enum ProductServicePath {
  recipes('recipes'),
  recipeDetails('recipe-details'),
  recipeNavigation('recipe-navigation'),
  recipeComments('recipe-comments');

  final String value;
  const ProductServicePath(this.value);
}
