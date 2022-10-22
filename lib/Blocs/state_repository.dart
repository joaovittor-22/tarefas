import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Repository/data_provider.dart';

class DataBloc extends Cubit<List> {
  DataBloc() : super([]);

  _update() async {
    var list = await db.getData();
    return list;
  }

  void getRepo() async {
    emit(await _update());
  }
}
