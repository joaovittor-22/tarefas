import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Repository/data_provider.dart';
import 'package:bloc/bloc.dart';



class DataBloc //extends Cubit<List>
{
   List<Map<String,dynamic>> list = [];
 // DataBloc() : super([]);
 
 Future<List<dynamic>>   getRepo() async {
    //emit();
    return list = await db.getData();
  }
}
