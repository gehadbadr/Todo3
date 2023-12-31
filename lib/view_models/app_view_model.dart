

import 'package:flutter/material.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = <Task>[];
  User user = User("Gehad Badr");

  Color clrv1 = Colors.purple.shade100;
  Color clrv2 = Colors.purple.shade200;
  Color clrv3 = Colors.purple.shade400;
  Color clrv4 = Colors.purple.shade600;

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }

  int get numTasks => tasks.length;

  int get NumRemainingTasks => tasks.where((tasks)=>!tasks.complete).length;

  String getTaskTitle(int taskIndex){
    return  tasks[taskIndex].title ;
  }

  bool getTaskValue(int taskIndex){
    return  tasks[taskIndex].complete ;
  }

  void setTaskValue(int taskIndex,bool taskValue){
   tasks[taskIndex].complete  = taskValue;
   notifyListeners();
  }

  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void deleteAllTasks(){
    tasks.clear();
    notifyListeners();
  }
  void deleteCompletedTasks(){
    tasks = tasks.where((tasks)=>!tasks.complete).toList();
    notifyListeners();
  }

  void updateUsername(String username){
    user.username = username;
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView ,BuildContext context){
    showModalBottomSheet(
        shape :RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: ((context){return bottomSheetView;})
    );
  }

}