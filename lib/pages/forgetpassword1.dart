import 'package:enhud/pages/forgetpassword2.dart';
import 'package:enhud/widget/mytextformfiled.dart';
import 'package:flutter/material.dart';

class Forgetpassword1 extends StatefulWidget {
  const Forgetpassword1({super.key});

  @override
  State<Forgetpassword1> createState() => _Forgetpassword1State();
}

class _Forgetpassword1State extends State<Forgetpassword1> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'images/1.png',
                  fit: BoxFit
                      .cover, // Ensures the image covers the entire screen
                ),
              ),
              Positioned(
                  top: 120,
                  left: 40,
                  right: 35,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Forget Password ',
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            Image.asset('images/Vector.png')
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Enter your email address to get an OTP code to reset your password .',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF898989)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " E-mail",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '* ',
                              style: TextStyle(color: Colors.red, fontSize: 20),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Mytextformfiled(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                          hintText: 'Example@gmail.com',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const Forgetpassword2()));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: const Color(0xFF5f8cf8),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 14),
                          ),
                          child: const Text(
                            'Coutinue',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
