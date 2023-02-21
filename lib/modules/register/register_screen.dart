import 'package:flutter/material.dart';
import '../../layout/toDoScreen/toDoScreen.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPassword = true;

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
                // 1- Welcome Text
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Container(
                    child: defaultText(
                      text: 'Register',
                    ),
                  ),
                ),

                // 2- Form Fields
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 35.0,
                    end: 35.0,
                    top: 35.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1- Email Text
                      defaultText(
                        text: 'Email',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 2- Email
                      defaultTextFeild(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        submitFunction: (value) {
                          return value ;
                        },
                        validFunction: (String? value) {
                          if (value!.isEmpty) {
                            return ('Email Address mustn\'t be empty');
                          }else if (!value.contains('@gmail.com')){
                            return ('Email Address must contain @gmail.com ');
                          }
                          else if (!value.contains(RegExp(r'[0-9]'))){
                            return ('Email Address must contain at least one number');
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(
                        height: 40,
                      ),
                      // 3-Password Text
                      defaultText(
                        text: 'Password',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 4- Password
                      defaultTextFeild(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: isPassword,
                          suffix: isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          submitFunction: (value) {
                                                      return value ;
                          },
                          validFunction: (String? value) {
                            if (value!.isEmpty) {
                              return ('Password mustn\'t be empty');
                            } else if (value.length < 10) {
                              return ('Password is too short');
                            } else if (!value.contains(RegExp(r'[A-Z]'))){
                            return ('Password must contain at least one upper char');
                          }else if (!value.contains(RegExp(r'[a-z]'))){
                            return ('Password must contain at least one lower char');
                          }
                            return null;
                          },
                          suffixFunction: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      // 5- Confirm Password Text
                      defaultText(
                        text: 'Confirm Password',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // 6- Confirm Password
                      defaultTextFeild(
                          controller: confirmPasswordController,
                          type: TextInputType.visiblePassword,
                          isPassword: isPassword,
                          suffix: isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          submitFunction: (value) {
                                                      return value ;
                          },
                          validFunction: (String? value) {
                            if (value!.isEmpty) {
                              return ('Password mustn\'t be empty');
                            } else if (passwordController.text !=
                                confirmPasswordController.text) {
                              return ('Password does\'t match');
                            }
                            return null;
                          },
                          suffixFunction: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          }),
                      const SizedBox(
                        height: 60,
                      ),
                      // 7- Register Button
                      Container(
                        alignment: Alignment.center,
                        child: defaultButton(
                          buttonFunction: () {
                            if (formKey.currentState!.validate()) {
                              print('Register');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ToDoScreen(),
                                ),
                              );
                            }
                          },
                          buttonText: 'Register',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // 8- Login Text Button
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 1- Text
                            defaultText(
                              text: 'Already have an account?',
                              fontSize: 18,
                              color: const Color(0xFFcb93a2),
                              fontWeight: FontWeight.w600,
                            ),
                            // 2- Text Button
                            defaultTextButton(
                              text: 'Log in',
                              color: const Color(0xFFa15873),
                              textFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                            ),
                          ],
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
