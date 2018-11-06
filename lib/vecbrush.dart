import "dart:math";

import 'package:vecbruch/geometry.dart';

abstract class PathCmd {}

class MoveTo extends PathCmd {
  num x;

  num y;

  MoveTo({this.x, this.y});

  String toString() => "M$x $y";
}

class LineTo extends PathCmd {
  num x;

  num y;

  LineTo({this.x, this.y});

  String toString() => "L$x $y";
}

class ClosePath extends PathCmd {
  ClosePath();

  String toString() => "Z";
}

class Path {
  final _commands = <PathCmd>[];

  String toString() => _commands.join();

  void lineTo(num x, num y) {
    _commands.add(LineTo(x: x, y: y));
  }

  void moveTo(num x, num y) {
    _commands.add(MoveTo(x: x, y: y));
  }

  void closePath() {
    _commands.add(ClosePath());
  }

  Iterable<PathCmd> get commands => _commands;

  Path clone() {
    final ret = Path();
    ret._commands.addAll(_commands);
    return ret;
  }

  Path outset(double distance) {
    // TODO
  }

  Path inset(double distance) {
    // TODO
  }

  Path scale() {
    // TODO
  }
}
