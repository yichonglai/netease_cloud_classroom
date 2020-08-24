import 'package:flutter/material.dart';
import './entry.dart';
import './example.dart';
import './tutor.dart';
import './major.dart';


class MicroSpecialty extends StatefulWidget {
  @override
  _MicroSpecialtyState createState() => _MicroSpecialtyState();
}

class _MicroSpecialtyState extends State<MicroSpecialty> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Entry(),
            Example(),
            Tutor(),
            Major(),
          ],
        ),
      ),
    );
  }
}
