import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';

class Mentoring extends StatefulWidget {
  const Mentoring({
    Key? key,
  }) : super(key: key);

  @override
  State<Mentoring> createState() => _MentoringState();
}

class _MentoringState extends State<Mentoring> {
  bool timepicked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
            child: Divider(
              height: 5,
              thickness: 2,
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1. Cheruku Vamsi - 18PA1A0531',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                  Checkbox(value: false, onChanged: (bool) {}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Competency: Competency Name',
                      style: GoogleFonts.poppins()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Asked on 25/Dec/20201', style: GoogleFonts.poppins()),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        timepicked = !timepicked;
                      });
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.alarm),
                        Text(
                          'Add Slot',
                          style: poppins,
                        )
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 20,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      primary: secondaryColor,
                    ),
                  ),
                ],
              ),
              Visibility(
                child: PickTime(),
                visible: timepicked,
              ),
              SizedBox(
                height: 25,
                child: Divider(
                  height: 5,
                  thickness: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PickTime extends StatelessWidget {
  const PickTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TimePickerDialog(
      helpText: 'Select available time slot',
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay.now(),
    );
  }
}
