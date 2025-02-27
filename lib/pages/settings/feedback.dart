import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'We would love to hear your thoughts,      suggestions,concerns or problems with anything so we can improve!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('*  How likely will you recommend us to your friends?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              Row(
                children: [
                  Radio(
                    value: false,
                    groupValue: 'groupValue',
                    onChanged: (val) {},
                  ),
                  const Text(
                    'Absolutely not!',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Radio(
                    value: false,
                    groupValue: 'groupValue',
                    onChanged: (val) {},
                  ),
                  const Text(
                    ' Definitely',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('*  What did you enjoy most about the application ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: 'Type here ......',
                    hintStyle: const TextStyle(color: Color(0xFFcccccc)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Color(0xFFededed)))),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text('*  Any suggestions or comments !!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              TextField(
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: 'Type here ......',
                    hintStyle: const TextStyle(color: Color(0xFFcccccc)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Color(0xFFededed)))),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Thank you!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color(0xFF5f8cf8),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 7),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
