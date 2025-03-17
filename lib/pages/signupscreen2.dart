import 'package:enhud/pages/loginpage.dart';
import 'package:enhud/widget/alertdialog/authdialog.dart';
import 'package:enhud/widget/custombuttom1.dart';
import 'package:enhud/widget/mytextformfiled.dart';
import 'package:flutter/material.dart';

class Signupscreen2 extends StatefulWidget {
  const Signupscreen2({super.key});

  @override
  State<Signupscreen2> createState() => _Signupscreen2State();
}

class _Signupscreen2State extends State<Signupscreen2> {
  double toppadding = 40;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController acdamicyearcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isObscured = true;
  String? selectedGender;
  DateTime selectedDate = DateTime.now();
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
                bottom: toppadding,
                right: 40,
                left: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 110,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 11),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF5F8CF8), width: 2),
                        ),
                        child: const Center(
                            child: Text(
                          'Back',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF5b86ed)),
                        )),
                      ),
                    ),
                    Custombuttom1(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            if (selectedGender == null) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: Text('select gender'),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => const CustomDialog(
                                  text:
                                      'You have successfully created an account .',
                                  title: 'Welcome Mahmoud ^_^',
                                ),
                              );
                            }
                          } else {
                            toppadding = 0;
                            setState(() {});
                          }
                        },
                        text: 'Finish')
                  ],
                ),
              ),
              Positioned(
                top: 80,
                left: 20,
                right: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Full Name",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
                    Mytextformfiled(validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Full name is required";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " E-mail",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
                      height: 10,
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Acdamic year",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
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
                    Mytextformfiled(validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Acdamic year is required";
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          " Brith Date",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '    *',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 210),
                      child: TextField(
                        onTap: () async {
                          final DateTime today = DateTime.now();
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1950),
                            lastDate:
                                today, // Ensure lastDate is today (or earlier)
                            initialDate: selectedDate.isAfter(today)
                                ? today
                                : selectedDate,
                          );

                          if (dateTime != null) {
                            setState(() {
                              selectedDate = dateTime;
                            });
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.date_range),
                            hintText:
                                '${selectedDate.year} -${selectedDate.month} -${selectedDate.day}',
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
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          " Gender",
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '          *',
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 210),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        hint: const Text("Select",
                            style: TextStyle(color: Colors.grey)),
                        value: selectedGender,
                        items: ["Male", "Female"]
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
