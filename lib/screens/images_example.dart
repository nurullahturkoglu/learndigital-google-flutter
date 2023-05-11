import 'package:flutter/material.dart';

class ImagesExampleClass extends StatefulWidget {
  String imgUrl;
  ImagesExampleClass({super.key, required this.imgUrl});

  @override
  State<ImagesExampleClass> createState() => _ImagesExampleClassState();
}

class _ImagesExampleClassState extends State<ImagesExampleClass> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(image: AssetImage(widget.imgUrl))),
    );
  }
}
