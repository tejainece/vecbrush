import 'package:vecbrush/geometry.dart';

abstract class PathCmd {}

abstract class PointedPathCmd implements PathCmd {
  Point get point;
}

class MoveTo implements PathCmd, PointedPathCmd {
  num x;

  num y;

  MoveTo({this.x, this.y});

  Point get point => Point(x: x, y: y);

  String toString() => "M$x $y";
}

class LineTo implements PathCmd, PointedPathCmd {
  num x;

  num y;

  LineTo({this.x, this.y});

  Point get point => Point(x: x, y: y);

  String toString() => "L$x $y";
}

class ClosePath extends PathCmd {
  ClosePath();

  String toString() => "Z";
}