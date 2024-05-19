enum Images { ic_onboard_1 }

//Returns local image with path
extension ImagesExtension on Images {
  String get imagePath => "assets/images/$name.png";
}
