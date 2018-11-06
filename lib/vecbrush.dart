import "dart:math";
import 'path.dart';

import 'package:vecbrush/geometry.dart';

export 'path.dart';

class Document {
  num width;

  num height;

  List<Layer> layers;
}

class Layer {
  // TODO blend modes

  bool isVisible = true;

  // TODO implement groups
  List<Path> paths;
}
