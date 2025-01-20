import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/cubits/cubit/task_name_cubit.dart';
import 'package:todo/screens/home.dart';

void main() async {
  await Hive.initFlutter();
   await Hive.openBox<String>('tasks');
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskNameCubit(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
