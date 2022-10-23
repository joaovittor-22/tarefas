import 'package:app/Repository/data_provider.dart';
import 'package:flutter/cupertino.dart';

abstract class BlocEvent {
}

class InitBloc implements BlocEvent {
}


class AddBloc implements BlocEvent {
  String text;

  AddBloc({
    required this.text,
  });

  void add(text) => text.isNotEmpty? db.save(text) : null;
}

class RemoveBloc implements BlocEvent {
     int id;

  RemoveBloc({
    required this.id,
  });
  void remove(id) => db.delete(id); 
}

class UpdateBloc implements BlocEvent {

}