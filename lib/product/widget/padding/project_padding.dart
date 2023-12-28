import 'package:flutter/material.dart';

final class ProjectPadding extends EdgeInsets {
  const ProjectPadding._() : super.all(0);

  const ProjectPadding.smallAll() : super.all(8);
  const ProjectPadding.mediumAll() : super.all(16);
  const ProjectPadding.largeNormal() : super.all(20);
  const ProjectPadding.largeAll() : super.all(32);
}
