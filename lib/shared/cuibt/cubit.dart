// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo/modules/archived_screen/archived_screen.dart';
import 'package:new_todo/modules/done_screen/done_screen.dart';
import 'package:new_todo/modules/taskes_screen/tasks_screen.dart';
import 'package:new_todo/shared/cuibt/states.dart';
import 'package:sqflite/sqflite.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(IntialState());

  static AppCubit getCubit(Context) => BlocProvider.of(Context); 

  int currentIndex = 0;
  IconData iconData = Icons.edit;
  bool isBottomSheetShown = false;
  Database? database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];

  List<Widget> screens = [
    TaskScreen(),
    DoneScreen(),
    ArchivedScreen(),
  ];

  List<String> appBar = [
    'New Tasks',
    'Done Tasks',
    'Archined Tasks',
  ];

  void ChangeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  void ChangeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShown = isShow;
    iconData = icon;
    emit(ChangeBottomSheetState());
  }

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      print('database created');
      database
          .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT ,time TEXT, status TEXT)')
          .then((value) => print('table created'))
          .catchError((error) => print('$error is error'));
    }, onOpen: (database) {
      getFromDatabase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(CreateDatabaseState());
    });
  }

  void insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database?.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(InserttoDatabaseState());
        getFromDatabase(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archiveTasks.add(element);
        }
      });
      emit(GetFromDatabaseState());
    });
  }

  void deleteData(
    {
    required int id,
    }
  )async {
    database
    !.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
    getFromDatabase(database);
    emit(DeleteDataState());
  }

  void updateData({
    required String status,
    required int id,
  }) {
    database!.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getFromDatabase(database);
      emit(UpdateDataState());
    });
  }
}
