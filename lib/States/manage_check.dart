import 'package:flutter_bloc/flutter_bloc.dart';


class CheckCubit extends Cubit<bool> {
  CheckCubit() : super(false);
  
  void chage(value) => emit(value);
}