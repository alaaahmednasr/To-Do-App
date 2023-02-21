import 'dart:ui';

import 'package:flutter/material.dart';

Widget defaultButton({
  required void Function() buttonFunction,
  required String buttonText,
  Color buttonColor = const Color(0xFFa15873),
  Color borderColor = const Color(0xFFa15873),
  Color textColor = const Color(0xFFFFFFFF),
  double buttonwidth = 150,
  double borderRadius = 15,
  double borderwidth = 2,
  double fontSize = 20,
}) =>
    Container(
      height: 50,
      width: buttonwidth,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        border: Border.all(
          color: borderColor,
          width: borderwidth,
        ),
      ),
      child: MaterialButton(
        onPressed: buttonFunction,
        child: Text(
          '${buttonText}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultText({
  required String text,
  double fontSize = 25,
  Color color = const Color(0xFFa15873),
  FontWeight fontWeight = FontWeight.bold,
  TextDecoration decoration = TextDecoration.none,
}) =>
    Text(
      '${text}',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      ),
      maxLines: 1,
    );

Widget defaultTextFeild({
  required TextEditingController controller,
  required TextInputType type,
  String? labelText,
  String? Function(String?)? submitFunction,
  required String? Function(String?) validFunction,
  void Function()? suffixFunction,
  void Function()? onTapFunction,
  IconData? suffix,
  Color suffixIconColor = const Color(0xFFa15873),
  bool isPassword = false,
  bool readOnly = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: submitFunction,
      validator: validFunction,
      obscureText: isPassword,
      onTap: onTapFunction,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
        labelStyle: const TextStyle(
          color: Color(0xFFa15873),
        ),
      ),
      cursorColor: const Color(0xFFa15873),
      
    );

Widget defaultTextButton({
  required String text,
  required void Function() textFunction,
  double fontSize = 18,
  Color color = const Color(0xFFcb93a2),
  FontWeight fontWeight = FontWeight.w600,
  TextDecoration decoration = TextDecoration.underline,
}) =>
    TextButton(
      onPressed: textFunction,
      child: defaultText(
        text: text,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
      ),
    );

Widget defaultListVeiwBody(Map tasks) => Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 25,
            end: 25,
            top: 30,
            bottom: 10,
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFDEB6AB),
                width: 2,
              ),
              borderRadius: const BorderRadiusDirectional.only(
                topEnd: Radius.circular(
                  15,
                ),
                bottomEnd: Radius.circular(
                  15,
                ),
                topStart: Radius.circular(
                  7,
                ),
                bottomStart: Radius.circular(
                  7,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFDEB6AB),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        '${tasks['title']}',
                        style: const TextStyle(
                          color: Color(0xFFa15873),
                          fontSize: 23,
                        ),
                      ),
                      Text(
                        '${tasks['time']}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.circle_outlined,
                    color: Color(0xFFa15873),
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(
                    Icons.archive_outlined,
                    color: Color(0xFFa15873),
                  ),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
