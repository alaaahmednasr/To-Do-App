import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_todo/shared/cuibt/cubit.dart';
import '../../shared/components/todo_components.dart';
import '../../shared/cuibt/states.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        AppCubit getCubit = AppCubit.getCubit(context);
        return Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFFAF3F3),
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    taskBody(getCubit.newTasks[index] , context),
                itemCount: getCubit.newTasks.length),);
      },
    );
  }
}
