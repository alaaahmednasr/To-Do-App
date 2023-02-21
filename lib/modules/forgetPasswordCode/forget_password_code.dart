import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import 'package:pinput/pinput.dart';

class ForgetPasswordCodeScreen extends StatefulWidget {
  const ForgetPasswordCodeScreen({Key? key}) : super(key: key);

  @override
  ForgetPasswordCodeScreenState createState() =>
      ForgetPasswordCodeScreenState();
}

class ForgetPasswordCodeScreenState extends State<ForgetPasswordCodeScreen> {
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

                // 2- PinPut Fields
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1- Code Text
                      defaultText(
                        text: 'Please enter the code',
                        fontSize: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // 2- Code PinPut
                      Pinput(
                        length: 5,
                        defaultPinTheme: PinTheme(
                          width: 56,
                          height: 64,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Color(0xFFcb93a2),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFa15873),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: Colors.white.withOpacity(0.7),
                          ),
                        ),
                        errorTextStyle: TextStyle(
                          color: Colors.red[400],
                          backgroundColor: const Color(0xFFf5c6c0),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return ('Please enter code');
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      // 3- Submit Code Button
                      Container(
                        alignment: Alignment.center,
                        child: defaultButton(
                          buttonFunction: () {
                            if (formKey.currentState!.validate()) {
                              print('submit code');
                            }
                          },
                          buttonText: 'Submit',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // 4- Resend Code Button
                      Container(
                        alignment: Alignment.center,
                        child: defaultButton(
                          buttonFunction: () {},
                          buttonText: 'Resend',
                          buttonColor: const Color(0xFFfbefe3),
                          textColor: const Color(0xFFa15873),
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
