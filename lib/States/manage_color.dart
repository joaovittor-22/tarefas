import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.yellow);

  void chageColor(color) => emit(color);
}