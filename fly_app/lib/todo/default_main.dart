import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fly_app/todo/bloc/todo_bloc.dart';
import 'package:fly_app/todo/home.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
    );
    runApp(const TodoMainApp());
}

class TodoMainApp extends StatelessWidget {
  const TodoMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
    theme: ThemeData(
  colorScheme: const ColorScheme.light(),
  backgroundColor: Colors.white,
  // onBackground: Colors.black,
  primaryColor: Colors.yellowAccent,
  // primaryAccent : Colors.black,
  secondaryHeaderColor: Colors.lightGreen,
  // onSecondary: Colors.white,
),
home: BlocProvider(
  create: (context) => TodoBloc()..add(
    TodoStarted()
  ),
  child: HomeTodo(),
  ),

    );
  }
}