import 'package:flutter/material.dart';

class Exampage extends StatelessWidget {
  const Exampage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //text

                const Text(
                  'Generate Exams and  Exercises ',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                  // textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),

                //image
                Image.asset(
                  'images/Exam.png',
                  height: 400,
                  width: 400,
                  fit: BoxFit.fill,
                ),
                //first row
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    const Text(
                      'Generate Exercises :  ',
                      style: TextStyle(fontSize: 19),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF5f8cf8), width: 1),
                        ),
                        child: const Center(
                            child: Text(
                          'Start',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF5b86ed)),
                        )),
                      ),
                    ),
                    Image.asset('images/wpf_books.png')
                  ],
                ),
                //secound row
                const SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    const Text(
                      'Generate Exams :  ',
                      style: TextStyle(fontSize: 19),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 80,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF5f8cf8), width: 1),
                        ),
                        child: const Center(
                            child: Text(
                          'Start',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF5b86ed)),
                        )),
                      ),
                    ),
                    Image.asset('images/edit-file.png')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
