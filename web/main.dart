import 'dart:html';
import 'dart:svg';

import 'package:vecbrush/vecbrush.dart';

void renderPath(Path path) {
  PathElement el = querySelector('#${path.name}');
  // Path
  el.attributes['d'] = path.toString();
  // Fill
  if(path.fill == null) {
    el.attributes['fill'] = 'none';
  } else {
    throw Exception('Unknown fill!');
  }
  // Stroke
  el.attributes['stroke'] = path.stroke.color.toString();
  el.attributes['stroke-width'] = path.stroke.width.toString();
}

void renderBoundBox(Path path) {
  RectElement rect = querySelector('#path1-bbox');
  rect.attributes['x'] = path.boundedBox.left.toString();
  rect.attributes['y'] = path.boundedBox.top.toString();
  rect.attributes['width'] = path.boundedBox.width.toString();
  rect.attributes['height'] = path.boundedBox.height.toString();
}

void main() {
  Path path1 = Path("path1")
    ..moveTo(10, 10)
    ..lineTo(50, 10)
    ..lineTo(50, 50)
    ..closePath();

  renderPath(path1);
  renderBoundBox(path1);
}
