import 'package:app/Blocs/bloc.dart';
import 'package:app/Screens/screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'States/manage_check.dart';
import 'States/manage_color.dart';
import 'Blocs/state_list.dart';


void main() {
WidgetsFlutterBinding.ensureInitialized();
  runApp( 
    MultiBlocProvider(
  providers: [
    BlocProvider<CheckCubit>(
      create: (BuildContext context) => CheckCubit(),
    ),
    BlocProvider<ColorCubit>(
      create: (BuildContext context) => ColorCubit(),
    ),
    BlocProvider<MainBloc>(
      create: (BuildContext context) => MainBloc(),
    ),
  ],
  child: const MyApp(),
)
    
   );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  FirstScreen() ,
    );
  }
}



