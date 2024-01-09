enum LottieFiles { lottie_timer }

extension LottieFilesExtension on LottieFiles {
  String get lottiePath => "assets/lottie/$name.json";
}
