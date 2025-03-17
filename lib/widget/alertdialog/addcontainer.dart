import 'package:flutter/material.dart';

class Addcontainer extends StatelessWidget {
  final double height;
  final TextEditingController titlecontroler;
  final TextEditingController Descriptioncontroller;
  const Addcontainer(
      {super.key,
      required this.height,
      required this.titlecontroler,
      required this.Descriptioncontroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: height * 0.13,
      width: double.infinity,
      color: const Color(0xffffa45b),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            titlecontroler.text,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            children: [
              Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                Descriptioncontroller.text,
                maxLines: 3,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
