import 'package:flutter/widgets.dart';

class ReadOnlyLock with ChangeNotifier {
  bool _locked;

  ReadOnlyLock(bool locked) : _locked = locked;

  bool get locked => _locked;

  lock() {
    _locked = true;
    notifyListeners();
  }

  toggle() {
    _locked = !_locked;
    notifyListeners();
  }

  unlock() {
    _locked = false;
    notifyListeners();
  }
}
