import 'package:flutter/material.dart';
import '../../shared/components/components.dart';
import '../login/login_screen.dart';
import '../register/register_screen.dart';

//0xFFFAEEE9
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFfbefe3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Making Photo Section
            Container(
              width: 400,
              child: const Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 45,
                  top: 30,
                ),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/WomanPhoto.png',
                  ),
                ),
              ),
            ),
            // Making Text
            // Padding(
            //   padding: const EdgeInsets.only(top: 30),
            //   child: Column(
            //     children: [
            //       // 1- Frist Text
            //       defaultText(
            //         text: 'Gets things done with ToDo',
            //         fontSize: 23,
            //         fontWeight: FontWeight.w900,
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       // 1- Second Text
            //       defaultText(
            //         text: 'Manage your work with ToDo',
            //         fontSize: 20,
            //         fontWeight: FontWeight.w600,
            //         color: const Color(0xFFcb93a2),
            //       ),
            //     ],
            //   ),
            // ),
            // Making Login And Registers Button
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 70,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1 - login
                  defaultButton(
                    buttonFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    buttonText: 'Log in',
                  ),

                  const SizedBox(
                    width: 30,
                  ),

                  // 2- register
                  defaultButton(
                    buttonFunction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    buttonText: 'Register',
                    buttonColor: const Color(0xFFfbefe3),
                    textColor: const Color(0xFFa15873),
                  ),
                ],
              ),
            ),
            // Making Login Text
            defaultText(
              text: 'log in or register with: ',
              fontSize: 20,
              color: const Color(0xFFcb93a2),
            ),
            const SizedBox(
              height: 25,
            ),
            // Making Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.facebook_rounded,
                  size: 50,
                  color: Color(0xFFa15873),
                ),
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 50,
                      color: Color(0xFFa15873),
                    ),
                    Icon(
                      Icons.apple_rounded,
                      size: 40,
                      color: Color(0xFFfbefe3),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 50,
                      color: Color(0xFFa15873),
                    ),
                    Icon(
                      Icons.g_mobiledata_rounded,
                      size: 50,
                      color: Color(0xFFfbefe3),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
