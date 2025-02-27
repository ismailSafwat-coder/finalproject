import 'package:enhud/pages/forgetpassword3.dart';
import 'package:flutter/material.dart';

class Forgetpassword2 extends StatelessWidget {
  const Forgetpassword2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'images/1.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 120,
                left: 40,
                right: 35,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'You\'ve got mail ',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset('images/mailbox.png')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'We have sent the OTP verification code to your email address. Check your email and enter the code below.',
                        style:
                            TextStyle(color: Color(0xFF898989), fontSize: 15),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const custoumtextform(),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Didn\'t receive email?',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'You can resend code in 55 s',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5f8cf8)),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Forgetpassword3()));
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
    );
  }
}

class custoumtextform extends StatelessWidget {
  const custoumtextform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 47,
          width: 55,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFebebeb)),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        SizedBox(
          height: 47,
          width: 55,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFebebeb)),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        SizedBox(
          height: 47,
          width: 55,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFebebeb)),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        SizedBox(
          height: 47,
          width: 55,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 199, 191, 191), width: 2.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFebebeb)),
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}
