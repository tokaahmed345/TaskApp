import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/task.dart';

part 'task_name_state.dart';

class TaskNameCubit extends Cubit<TaskNameState> {
  TaskNameCubit() : super(TaskNameInitial()) {
    loaddata();
  }
  List<Task> list = [];

  void loaddata() {
    var box = Hive.box<String>('tasks');
    list = box.values.map((element) => Task(taskname: element)).toList();
    emit(Update(list));
  }

  void addtask(String task) {
    final taskname = Task(taskname: task);
    list.add(taskname);
    var box = Hive.box<String>('tasks');
    box.add(task);
    emit(Update(list));
  }

  void toggleTaskCompletion(int index) {
    list[index].iscompleted = !list[index].iscompleted;

    emit(Update(list));
  }

  void deletetask(String taskName) {
    list.removeWhere(
        (task) => task.taskname == taskName); // Remove task from list
    var box = Hive.box<String>('tasks');
    final taskIndex = box.values.toList().indexOf(taskName);
    if (taskIndex != -1) {
      box.deleteAt(taskIndex); // Remove task from Hive
    }
    emit(Update(list)); // Emit the updated list
  }

  // void delete(String taskname) {
  //   list.removeWhere((task) => task.taskname == taskname);
  //   var box = Hive.box<String>('tasks');
  //   final index = box.values.toList().indexOf(taskname);
  //   box.deleteAt(index);
  // }
}
