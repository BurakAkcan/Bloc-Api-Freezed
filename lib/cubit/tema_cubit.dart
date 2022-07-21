import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_state.dart';

class TemaCubit extends Cubit<ThemeData> {
  TemaCubit() : super(_dark);

  static final _brightness = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
  );

  static final _dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
  );

  void changeTheme() {
    emit(state.brightness == Brightness.dark ? _brightness : _dark);
  }
}
