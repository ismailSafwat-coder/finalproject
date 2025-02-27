import 'package:enhud/pages/forgetpassword1.dart';
import 'package:enhud/pages/homescreen.dart';
import 'package:enhud/pages/signup_page.dart';
import 'package:enhud/widget/mytextformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomForm extends StatefulWidget {
  final GlobalKey<FormState> formState;
  const CustomForm({super.key, required this.formState});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formState,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " E-mail",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return "Enter a valid email";
              }
              return null;
            },
            hintText: 'Example@gmail.com',
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " Password",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
          TextFormField(
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
                hintText: '*******',
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
                      isObscured = !isObscured; // Toggle password visibility
                    });
                  },
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFebebeb)),
                    borderRadius: BorderRadius.circular(20))),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forget Password?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF757575)),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Forgetpassword1()));
                },
                child: const Text(
                  'Reset-it',
                  style: TextStyle(fontSize: 15, color: Color(0xFF5f8cf8)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 1,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Or Login with'),
              ),
              Expanded(child: Divider(thickness: 1)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                height: 70,
                width: 70,
                child: SvgPicture.asset(
                  'images/google.svg',
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(
                  'images/linkedin.svg',
                  height: 70,
                  width: 70,
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(100)),
                height: 70,
                width: 70,
                child: SvgPicture.asset('images/facebook.svg'),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF609cf7),
            ),
            height: 50,
            width: 210,
            child: Center(
              child: TextButton(
                child: const Text('Login',
                    style: TextStyle(fontSize: 21, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t Have account?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF757575)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignupScreen1()));
                },
                child: const Text('Sign-up',
                    style: TextStyle(fontSize: 15, color: Color(0xFF5f8cf8))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
