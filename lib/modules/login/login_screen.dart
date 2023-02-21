import 'package:flutter/material.dart';
import '../../layout/toDoScreen/toDoScreen.dart';
import '../../shared/components/components.dart';
import '../forgetPassword/forget_password.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                    bottom: 50,
                  ),
                  child: Container(
                    child: defaultText(
                      text: 'Welcome Back!',
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
                          return value;
                        },
                        validFunction: (String? value) {
                          if (value!.isEmpty) {
                            return ('Email Address mustn\'t be empty');
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
                            }
                            return null;
                          },
                          suffixFunction: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      // 5- Forget Text Button
                      Container(
                          alignment: Alignment.center,
                          child: defaultTextButton(
                            text: 'Forget your password ?',
                            textFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPasswordScreen(),
                                ),
                              );
                            },
                          )),
                      const SizedBox(
                        height: 60,
                      ),
                      // 6- Login Button
                      Container(
                        alignment: Alignment.center,
                        child: defaultButton(
                          buttonFunction: () {
                            if (formKey.currentState!.validate()) {
                              print('log in');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ToDoScreen(),
                                ),
                              );
                            }
                          },
                          buttonText: 'Log in',
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      // Register Text Button
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // 1- Text
                            defaultText(
                              text: 'Don\'t have an account?',
                              fontSize: 18,
                              color: const Color(0xFFcb93a2),
                              fontWeight: FontWeight.w600,
                            ),
                            // 2- Text Button
                            defaultTextButton(
                              text: 'Register',
                              color: const Color(0xFFa15873),
                              textFunction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterScreen(),
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
