// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavigator on _BottomNavigator, Store {
  late final _$indexAtom =
      Atom(name: '_BottomNavigator.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_BottomNavigatorActionController =
      ActionController(name: '_BottomNavigator', context: context);

  @override
  void setIndex(int value) {
    final _$actionInfo = _$_BottomNavigatorActionController.startAction(
        name: '_BottomNavigator.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_BottomNavigatorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
