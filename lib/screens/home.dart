import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/cubit/task_name_cubit.dart';
import 'package:todo/screens/addtask.dart';
import 'package:todo/widgets/lcustom-list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 117, 118, 195),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask())));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: const Color.fromARGB(255, 23, 55, 107),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.playlist_add_check,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'ToDayDo',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )
              ],
            ),
            BlocBuilder<TaskNameCubit, TaskNameState>(
              builder: (context, state) {
                if (state is Update) {
                  return Text(
                    '${state.tasks.length} Tasks',
                    style: TextStyle(color: Colors.white),
                  );
                } else {
                  return Text(
                    '0 Tasks',
                    style: TextStyle(color: Colors.white),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: CustomListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
