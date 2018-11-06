import 'path_cmd.dart';

export 'path_cmd.dart';

import 'geometry.dart';

class Color {
  final int r;

  final int g;

  final int b;

  final int a;

  const Color({this.r = 0, this.g = 0, this.b = 0, this.a = 0});

  String _intToHex(int v) {
    String ret = v.toRadixString(16);
    final int len = ret.length;
    if (len == 1) return "0" + ret;
    if (len == 2) return ret;
    throw Exception("Invalid component!");
  }

  String toString() =>
      "#${_intToHex(r)}${_intToHex(g)}${_intToHex(b)}${_intToHex(a)}";
}

abstract class Colors {
  static const transparent = Color();
  static const white = Color(r: 255, g: 255, b: 255, a: 255);
  static const black = Color(r: 0, g: 0, b: 0, a: 255);
}

abstract class Fill {}

class Stroke {
  num width = 1;

  Color color = Colors.black;

  // TODO style

  void copy(Stroke other) {
    width = other.width;
    color = other.color;
    // TODO style
  }
}

class Path {
  String name;

  final _commands = <PathCmd>[];

  Fill fill;

  final stroke = Stroke();

  Path(this.name);

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

  Path clone(String newName) {
    final ret = Path(newName);
    ret._commands.addAll(_commands);
    return ret;
  }

  Rect get boundedBox {
    // TODO compute also the curves
    num left;
    num right;
    num top;
    num bottom;
    for (final PathCmd cmd in _commands) {
      if (cmd is PointedPathCmd) {
        Point p = cmd.point;
        if (left == null) {
          left = right = p.x;
          top = bottom = p.y;
        }
        if (p.x < left) left = p.x;
        if (p.x > right) right = p.x;
        if (p.y < top) top = p.y;
        if (p.y > bottom) bottom = p.y;
      }
    }

    if (left == null) throw Exception("Could not find the bounding box!");

    return Rect.fromBounds(left: left, right: right, top: top, bottom: bottom);
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
