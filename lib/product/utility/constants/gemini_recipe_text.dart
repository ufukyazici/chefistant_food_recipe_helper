class GeminiRectipeText {
  final String recipeName;

  GeminiRectipeText({required this.recipeName});

  String get recipeWithNavigationText =>
      'Aşağıda verdiğim json formatını $recipeName yemek tarifine göre doldurabilir misin Duration kısmı adımın ne kadar süre yapılacağını saniye cinsinden ifade etmelidir!? {"steps":[{"step": "","duration": }]}';
}
