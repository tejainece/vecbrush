import "dart:math" as math;

/// Encapsulates a point in catersian coordinates
class Point extends math.Point<num> {
  Point({num x: 0, num y: 0}) : super(x, y);

  Vector vectorTo(Point other) => Vector(x: other.x - x, y: other.y - y);

  double slopeTo(Point other) => (other.y - y) / (other.x - x);
}

/// Encapsulates a line defined by 2 points [p1], [p2].
class Line2 {
  Point p1;
  Point p2;

  Line2({this.p1, this.p2});

  /// Returns if the given [point] is on the slope formed by [p1] and [p2].
  bool liesOnSlope(math.Point<num> point) =>
      p1.slopeTo(point) == p2.slopeTo(point);

  Vector get vector => p1.vectorTo(p2).normalize;

  double get length => p1.vectorTo(p2).length;

  double get slope => p1.slopeTo(p2);
}

class Vector {
  final num x;

  final num y;

  Vector({this.x, this.y});

  double _length;

  double get length => _length ??= math.sqrt((x * x) + (y * y));

  Vector get normalize {
    double len = length;
    return Vector(x: x / len, y: y / len);
  }

  Vector operator +(Vector other) => Vector(x: x + other.x, y: y + other.y);

  Vector operator -(Vector other) => Vector(x: x - other.x, y: y - other.y);
}

class Rect {
  final num left;

  final num top;

  final num width;

  final num height;

  Rect({this.left: 0, this.top: 0, this.width: 0, this.height: 0});

  Rect.fromBounds({num left, num right, num top, num bottom})
      : left = math.min(left, right),
        top = math.min(top, bottom),
        width = (right - left).abs(),
        height = (bottom - top).abs();

  double get area => width * height;

  num get right => left + width;

  num get bottom => top + height;

  Point get topLeft => Point(x: left, y: top);

  Point get topRight => Point(x: right, y: top);

  Point get bottomLeft => Point(x: left, y: bottom);

  Point get bottomRight => Point(x: right, y: bottom);

  String toString() =>
      "Rect(left: $left, top: $top, right: $right, bottom: $bottom)";
}
