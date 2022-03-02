import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';

class FacultyReferences extends StatefulWidget {
  const FacultyReferences({
    Key? key,
  }) : super(key: key);

  @override
  State<FacultyReferences> createState() => _FacultyReferencesState();
}

class _FacultyReferencesState extends State<FacultyReferences> {
  bool referencePicked = false;
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
                        referencePicked =! referencePicked;
                      });
                    },
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text(
                          'Add Reference',
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
                child: AddReferences(),
                visible: referencePicked,
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

class AddReferences extends StatelessWidget {
  const AddReferences({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.link_rounded,),
        Icon(Icons.text_fields_rounded),
        Icon(Icons.file_copy_rounded)
      ],
    );
  }
}
