import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/cubit/task_name_cubit.dart';
import 'package:todo/widgets/listtile.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskNameCubit, TaskNameState>(
      builder: (context, state) {
        if (state is Update) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return CustomListTile(
                taskname: state.tasks[index],
                ontoggel: () {
                  BlocProvider.of<TaskNameCubit>(context)
                      .toggleTaskCompletion(index);
                },
              );
            },
          );
        } else {
          return Container(
            width: double.infinity,
          );
        }
      },
    );
  }
}
