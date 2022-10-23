import './events_repository.dart';
import 'state_list.dart';
import 'package:bloc/bloc.dart';


  class MainBloc extends Bloc<BlocEvent, List<dynamic>>  {  
       final _listRepo = DataBloc();

    MainBloc() : super([]){
    // _inputClientController.stream.listen(_mapEventToState);
    

    on<AddBloc>(
      (event, emit)async{
        event.add(event.text);
         emit(await _listRepo.getRepo()); 
      },
    );

    on<RemoveBloc>(
       (event, emit) async{
         event.remove(event.id);
        emit(await _listRepo.getRepo()); 
       },
    );

    on<InitBloc>(
       (event, emit)async {
         emit(await _listRepo.getRepo()); 
       },
    );

  }

/*
    onEvent(event)async{ // escuta qualquer evento
            emit(await _listRepo.getRepo()); // busca uma nova lista no db e atualiza o estado quando um evento é enviado
    }
*/
  /*@override
  Stream <DataBloc> mapEventToState(BlocEvent event) async* {
    if (event is AddBloc) {
      //  
            print("add");
            yield DataBloc()..list;
    } 
    else if (event is RemoveBloc) {
    //    RemoveBloc().remove("text");
       print("remove");
     //  event..remove(event.text);
          yield DataBloc()..list;
    }
     // uma alternativa seria utilizar o stream builder para monitorar o estado
      e atualizar o db, mas o projeto ja estava com package do bloc entao utilizei o package para facilitar
  }*/


  }