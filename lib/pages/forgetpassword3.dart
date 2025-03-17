import 'package:enhud/widget/alertdialog/authdialog.dart';
import 'package:flutter/material.dart';

class Forgetpassword3 extends StatefulWidget {
  const Forgetpassword3({super.key});

  @override
  State<Forgetpassword3> createState() => _Forgetpassword3State();
}

class _Forgetpassword3State extends State<Forgetpassword3> {
  bool isObscured = true;
  bool isRemmberd = false;
  TextEditingController Confirmpassword = TextEditingController();
  TextEditingController password = TextEditingController();
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
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 110,
              left: 40,
              right: 35,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'Create new password ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset('images/noto_locked-with-key.png')
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Save the new password in a safe place.if you forget it then you have to do a forget password again.',
                    style: TextStyle(color: Color(0xFF898989), fontSize: 16),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " New Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextFormField(
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    obscureText: isObscured,
                    decoration: InputDecoration(
                        hintText: '',
                        hintStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility, // Toggle icon
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured =
                                  !isObscured; // Toggle password visibility
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 199, 191, 191),
                              width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFebebeb)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " Confirm Password",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  TextFormField(
                    controller: Confirmpassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                    obscureText: isObscured,
                    decoration: InputDecoration(
                        hintText: '',
                        hintStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility, // Toggle icon
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured =
                                  !isObscured; // Toggle password visibility
                            });
                          },
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 199, 191, 191),
                              width: 2.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFebebeb)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Checkbox(
                          value: isRemmberd,
                          onChanged: (value) {
                            isRemmberd = value!;
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (password.text != Confirmpassword.text) {
                          showDialog(
                            context: context,
                            builder: (context) => const AlertDialog(
                              content: Text('the password not the same'),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => const CustomDialog(
                              title: 'Welcome Back!',
                              text:
                                  'You have successfully reset and created a new password.',
                            ),
                          );
                        }
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
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
