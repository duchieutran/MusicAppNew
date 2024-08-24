import 'package:mobx/mobx.dart';
part 'bottom_navigator.g.dart';

class BottomNavigator = _BottomNavigator with _$BottomNavigator;

abstract class _BottomNavigator with Store {
  @observable
  int index = 0;

  @action
  void setIndex(int value) {
    index = value;
  }
}
