enum Images { ic_onboard_1 }

extension ImagesExtension on Images {
  String get imagePath => "assets/images/$name.png";
}
