enum LottieFiles { lottie_timer }

//Returns lottie file with path
extension LottieFilesExtension on LottieFiles {
  String get lottiePath => "assets/lottie/$name.json";
}
