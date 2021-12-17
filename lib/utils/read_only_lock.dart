import 'package:flutter/widgets.dart';

class ReadOnlyLock with ChangeNotifier {
  bool locked;

  ReadOnlyLock(this.locked);
}
