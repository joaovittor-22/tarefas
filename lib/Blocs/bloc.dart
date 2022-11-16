import 'package:flutter/foundation.dart';
import './events_repository.dart';
import 'state_list.dart';
import 'package:bloc/bloc.dart';
import 'package:app/Repository/data_provider.dart';
import 'package:image_picker/image_picker.dart';


  class MainBloc extends Bloc<BlocEvent, List<dynamic>>  {  
       final _listRepo = DataBloc();

    MainBloc() : super([]){
    // _inputClientController.stream.listen(_mapEventToState);
    

    on<GetImageEvent>(
      (event, emit)async{
       // event.add(event.text);

          XFile img = await event.getImage();  
          String name = img.name;
          Uint8List bytes = await img.readAsBytes();
        await  db.addImage(bytes,name);
       var res = await db.getImages();
        emit(res); 
        // emit(await _listRepo.getRepo()); 
      },
    );

    on<ListImagesEvent>(
       (event, emit) async{
       //  event.remove(event.id);
       var res = await db.getImages();
        emit(res); 
       },
    );



  /*  on<InitBloc>(
       (event, emit)async {
         emit(await _listRepo.getRepo()); 
       },
    );
*/
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


  