import 'dart:html';
import 'dart:svg';

import 'package:vecbruch/vecbrush.dart';

void main() {
  PathElement p = querySelector('#path1');
  p.attributes['d'] = (Path()
        ..moveTo(10, 10)
        ..lineTo(20, 10)
        ..lineTo(20, 20)
        ..closePath())
      .toString();
}
