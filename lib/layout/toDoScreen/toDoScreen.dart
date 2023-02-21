import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../shared/components/todo_components.dart';
import '../../shared/cuibt/cubit.dart';
import '../../shared/cuibt/states.dart';

class ToDoScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleContoller = TextEditingController();
  var dateContoller = TextEditingController();
  var timeContoller = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {
          if (state is InserttoDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          AppCubit getCubit = AppCubit.getCubit(context);

          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                '${getCubit.appBar[getCubit.currentIndex]}',
              ),
              backgroundColor: const Color(0xFFa15873),
            ),
            body: getCubit.screens[getCubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (getCubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    getCubit.insertToDatabase(
                      title: titleContoller.text,
                      date: dateContoller.text,
                      time: timeContoller.text,
                    );
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                            padding: const EdgeInsets.all(20),
                            height: 225,
                            width: double.infinity,
                            color: const Color(0xFFfbefe3),
                            child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    defaultTextFeild(
                                      prefix: Icons.title,
                                      text: 'Task Name',
                                      controller: titleContoller,
                                      type: TextInputType.name,
                                      validFunction: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'empty';
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    defaultTextFeild(
                                      prefix: Icons.calendar_month_rounded,
                                      text: 'Task Date',
                                      controller: dateContoller,
                                      type: TextInputType.datetime,
                                      validFunction: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'empty';
                                        }
                                      },
                                      onTap: () async {
                                        final DateTime? picked =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(2101));
                                        if (picked != null) {
                                          selectedDate = picked;
                                          dateContoller.text = DateFormat('yyyy-MM-dd').format(selectedDate).toString();
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    defaultTextFeild(
                                        prefix: Icons.watch_later_rounded,
                                        text: 'Task Time',
                                        controller: timeContoller,
                                        type: TextInputType.datetime,
                                        validFunction: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'empty';
                                          }
                                        },
                                        onTap: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then(
                                            (value) => timeContoller.text =
                                                value!
                                                    .format(context)
                                                    .toString(),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            )),
                      )
                      .closed
                      .then((value) {
                    getCubit.ChangeBottomSheet(isShow: false, icon: Icons.edit);
                  });
                  getCubit.ChangeBottomSheet(isShow: true, icon: Icons.add);
                }
              },
              mini: true,
              backgroundColor: const Color(0xFFa15873),
              child: Icon(
                getCubit.iconData,
                color: const Color(0xFFfbefe3),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFFa15873),
              currentIndex: getCubit.currentIndex,
              onTap: (index) {
                getCubit.ChangeBottomNavBar(index);
              },
              selectedItemColor: const Color(0xFFfbefe3),
              unselectedItemColor: const Color(0xFFfbefe3),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                    color: Color(0xFFfbefe3),
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.done_outline_rounded,
                    color: Color(0xFFfbefe3),
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_rounded,
                    color: Color(0xFFfbefe3),
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
