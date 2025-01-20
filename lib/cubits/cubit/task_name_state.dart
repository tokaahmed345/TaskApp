part of 'task_name_cubit.dart';


abstract class TaskNameState {}

 class TaskNameInitial extends TaskNameState {



 }

 class Update extends TaskNameState{
  final List<Task>tasks;

  Update(this.tasks);

 }
