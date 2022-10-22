import 'package:app/Repository/data_provider.dart';

abstract class Bloc {

}


class EventsBloc implements Bloc {
  void add(text) =>  db.save(text);
  void remove(id) => db.delete(id);
}

