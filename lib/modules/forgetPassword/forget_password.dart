import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../forgetPasswordCode/forget_password_code.dart';
class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfbefe3),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1- Icon Button And Welcome Text
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      // 1- Icon Button
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 25),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: const Color(0xFFa15873),
                          icon: const Icon(
                            Icons.arrow_circle_left_sharp,
                            size: 30,
                          ),
                        ),
                      ),
                      // 2- Text
                      defaultText(
                        text: 'Recover your password',
                      ),
                    ],
                  ),
                ),

                // 2- Form Fields
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1- Email Text
                      defaultText(
                        text: 'Enter your email address',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 2- Email
                      defaultTextFeild(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        submitFunction: (String? value) {
                          return value ;
                        },
                        validFunction: (String? value) {
                          if (value!.isEmpty) {
                            return ('Email Address mustn\'t be empty');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 3- Text
                      defaultText(
                        text: 'A code will be send to your',
                        fontSize: 18,
                        color: const Color(0xFFcb93a2),
                        fontWeight: FontWeight.w600,
                      ),
                      defaultText(
                        text: 'email address',
                        fontSize: 18,
                        color: const Color(0xFFcb93a2),
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      // 7- Send Code Button
                      Container(
                        alignment: Alignment.center,
                        child: defaultButton(
                          buttonFunction: () {
                            if (formKey.currentState!.validate()) {
                              print('send code');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordCodeScreen(),
                                ),
                              );
                            }
                          },
                          buttonText: 'Send code',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
