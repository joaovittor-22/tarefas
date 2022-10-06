import 'package:app/States/manage_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/States/manage_check.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final cor = context.watch<ColorCubit?>();
 // final ativo = context.watch<CheckCubit?>();

        return Scaffold(
      appBar: AppBar(
      title: Text("App"),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          color: cor!.state,
        /*  child:  Checkbox(
                value:ativo!.state,
               onChanged: (value){
              context.read<CheckCubit>().chage(value); //quando valor do objeto muda é passado um novo change pro cubit do checkbox
             
              value == true ? context.read<ColorCubit>().chageColor(Colors.blue)  :  context.read<ColorCubit>().chageColor(Colors.yellow); 
               //mudança no state do cubit que gerencia cor do container
               }),*/
        )
         /* BlocBuilder<ColorCubit, Color>( //blocbuilder que escuta mudanças no container
          builder: (context, color) {
            return  Container(
          width: 400,
          height: 400,
          color: color,
        );
          },
        ),*/
          
      ),
    );
  }
}