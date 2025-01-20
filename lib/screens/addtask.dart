import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/cubit/task_name_cubit.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Add Task',
            style: TextStyle(
                color: Colors.indigo[400],
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
            onSubmitted: (newText) {
              if (newText.isNotEmpty) {
                addtaskname(context, newText);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 23, 55, 107),
              ),
              onPressed: () {
                addtaskname(context, controller.text);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 28),
              ))
        ],
      ),
    );
  }

  void addtaskname(BuildContext context, String newText) {
    BlocProvider.of<TaskNameCubit>(context).addtask(newText);
    controller.clear();
    Navigator.pop(context);
  }
}
