import 'package:app/States/manage_color.dart';
import 'package:flutter/material.dart';
import 'package:app/Screens/screen_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/States/manage_check.dart';
import 'package:app/Blocs/manage_repository.dart';
import 'package:app/Blocs/state_repository.dart';


class FirstScreen extends StatelessWidget {
final EventsBloc bloc = EventsBloc();
  var text = '';

  @override
  Widget build(BuildContext context) {
    context.read<DataBloc>().getRepo();
  
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
                onPressed: () async {
                  text.isNotEmpty ? bloc.add(text) : null;
                  context.read<DataBloc>().getRepo();

                },
              )),
              onChanged: (value) {
                text = value;
              },
            ),
            BlocBuilder<DataBloc, List>(
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
                                onPressed: () async{
                                var id = snapshot[index]?["id"];
                                 bloc.remove(id);
                                 context.read<DataBloc>().getRepo();
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
