import 'package:enhud/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AccountinfoPage extends StatefulWidget {
  const AccountinfoPage({super.key});

  @override
  State<AccountinfoPage> createState() => _AccountinfoPageState();
}

class _AccountinfoPageState extends State<AccountinfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //upper container
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF5f8cf8)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                          'https://c4.wallpaperflare.com/wallpaper/719/640/12/marvel-comics-the-avengers-spider-man-avengers-infinity-war-wallpaper-preview.jpg'),
                    ),
                    Text(
                      ' Hi, mahmoud',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                //line
                Text(
                  '  Come on, you can do it.',
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            thickness: 2,
          ),
          //else

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  ' Full name',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: 'Mahmoud Ahmed',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFededed)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),

                //

                const Text(
                  ' E-mail',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: 'Mahmoud@gmail.com',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFededed)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),

                //
                const Text(
                  ' Acdemic year',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: '3rd year',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFededed)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                //

                const Text(
                  ' Gender',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 70,
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: 'Male',
                        hintStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFededed)),
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottmbar(context),
    );
  }

  Container bottmbar(BuildContext context) {
    return Container(
      height: 60,
      color: const Color(0xFFd9d9d9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 0,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Home.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 1,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Timetable.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 2,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Add.svg')),
          InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) => const HomeScreen(
                            homeindex: 3,
                          )),
                  (route) => false,
                );
              },
              child: SvgPicture.asset('images/Exam.svg')),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('images/Settings.svg'),
              Container(
                padding: const EdgeInsets.all(0),
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF5f8cf8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
