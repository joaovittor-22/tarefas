import 'package:app/Repository/data_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
abstract class BlocEvent {
}

class InitBloc implements BlocEvent {
}


class AddBloc implements BlocEvent {
  String text;

  AddBloc({
    required this.text,
  });

  void add(text) =>// text.isNotEmpty? db.save(text) : 
  null;
}

class RemoveBloc implements BlocEvent {
     int id;

  RemoveBloc({
    required this.id,
  });
  void remove(id) => null;
  // db.delete(id); 
}

class ListImagesEvent implements BlocEvent {

}

class GetImageEvent implements BlocEvent {
getImage()async{
  final XFile? image = await  ImagePicker().pickImage(source: ImageSource.gallery);
return image;
}


}