import 'package:flutter/material.dart';
import 'package:new_todo/shared/cuibt/cubit.dart';

Widget defaultTextFeild({
  required TextEditingController controller,
  required TextInputType type,
  Function(String?)? submitFunction,
  required String? Function(String?) validFunction,
  void Function()? suffixFunction,
  void Function()? onTap,
  IconData? suffix,
  IconData? prefix,
  Color suffixIconColor = const Color(0xFFa15873),
  bool isPassword = false,
  required String text,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submitFunction,
      validator: validFunction,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: '$text',
        labelStyle: const TextStyle(
          color: Color(0xFFa15873),
          fontWeight: FontWeight.bold,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        prefixIcon: Icon(
          prefix,
          color: const Color(0xFFa15873),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(
                  suffix,
                  color: suffixIconColor,
                ),
                onPressed: suffixFunction,
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFa15873),
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFa15873),
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red[400],
          backgroundColor: const Color(0xFFf5c6c0),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      onTap: onTap,
      cursorColor: const Color(0xFFa15873),
      style: const TextStyle(
        color: Color(0xFFcb93a2),
      ),
    );

Widget taskBody(Map tasks, context) => Dismissible(
      key: Key(tasks['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFFcb93a2),
              child: Text(
                '${tasks['time']}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${tasks['title']}',
                      style: const TextStyle(
                        color: Color(0xFFa15873),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '${tasks['date']}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 187, 187, 187),
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.getCubit(context)
                    .updateData(status: 'done', id: tasks['id']);
              },
              icon: const Icon(
                Icons.check_box_outline_blank_rounded,
              ),
            ),
            IconButton(
              onPressed: () {
                AppCubit.getCubit(context)
                    .updateData(status: 'archived', id: tasks['id']);
              },
              icon: const Icon(
                Icons.archive_outlined,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.getCubit(context).deleteData(id: tasks['id']);
      },
    );
