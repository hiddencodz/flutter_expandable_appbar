import 'package:flutter/material.dart';

import '../utils/constants.dart';

class DarggableAppBarProvider with ChangeNotifier {
  double height = collapsableHeight;

  get getHeight => height;

  dragDown() {
    if (height < expandedHeight) height = height + 3;
    notifyListeners();
  }

  dragUp() {
    if (height > collapsableHeight) height = height - 3;
    notifyListeners();
  }
}
