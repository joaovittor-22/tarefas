import 'package:app/States/manage_color.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/screen_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/States/manage_check.dart';
import 'package:app/Blocs/state_list.dart';
import 'package:app/Blocs/bloc.dart';
import 'package:app/Blocs/events_repository.dart';


class FirstScreen extends StatelessWidget {
  var text = '';

  @override
  Widget build(BuildContext context) {

  final MainBloc bloc = BlocProvider.of<MainBloc>(context); //inicia uma instancia do bloc 
  bloc.add(InitBloc()); // envia um evento inicial para buscar qualquer dado que estivesse salvo no db

    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*   const Text(
              'Seleção',
            ),
         BlocBuilder<CheckCubit, bool>(
              //escuta mudanças na tela e recria widget
              builder: (context, state) {
                return Checkbox(
                    value: state,
                    onChanged: (value) {
                      context.read<CheckCubit>().chage(
                          value); //quando valor do objeto muda é passado um novo change pro cubit do checkbox

                      value == true
                          ? context.read<ColorCubit>().chageColor(Colors.blue)
                          : context
                              .read<ColorCubit>()
                              .chageColor(Colors.yellow);
                      //mudança no state do cubit que gerencia cor do container
                    });
              },
            ),*/
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: (){
                   bloc.add(AddBloc(text: text)); //evento para adicionar  dados
                },
              )),
              onChanged: (value) {
                text = value;
              },
            ),
            BlocBuilder<MainBloc, List<dynamic>>(
              builder: (context, snapshot) {
              return Expanded(
                  child: ListView.builder(
                      itemCount: snapshot.length,
                      itemBuilder: ((context, index) {
                        return Row(
                          children: [
                          Text("${snapshot[index]?["name"]}"),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                               var id = snapshot[index]?["id"];
                               bloc.add(RemoveBloc(id: id)); // evento para remover item da lista
                                },
                                icon: Icon(Icons.delete))
                          ],
                        );
                      })
                  ));
            })
          ],
        ),
      ),
      /*   floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.navigate_next_sharp),
      ),*/
    );
  }
}
