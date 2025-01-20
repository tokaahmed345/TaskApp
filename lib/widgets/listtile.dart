import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/cubit/task_name_cubit.dart';
import 'package:todo/models/task.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.taskname,
    required this.ontoggel,
  });
  final bool? isaactive = false;
  final Task taskname;
  final VoidCallback ontoggel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskname.taskname,
          style: TextStyle(
            fontSize: 25,
            decorationThickness: 1.5,
            decorationColor: Color.fromARGB(255, 23, 55, 107),
            decoration: taskname.iscompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          )),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
              activeColor: Color.fromARGB(255, 23, 55, 107),
              value: taskname.iscompleted,
              onChanged: (value) {
                ontoggel();
              }),
          IconButton(
              onPressed: () {
                BlocProvider.of<TaskNameCubit>(context)
                    .deletetask(taskname.taskname);
              },
              icon: Icon(
                Icons.delete,
                size: 28,
                color: Color.fromARGB(255, 23, 55, 107),
              )),
        ],
      ),
    );
  }
}
