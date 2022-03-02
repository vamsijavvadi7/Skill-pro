import 'package:flutter/material.dart';
import 'eval_form.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';
class RecommendationsAlerBox extends StatelessWidget {
  const RecommendationsAlerBox({
    Key? key,
    required this.referenceReq,
  }) : super(key: key);

  final bool referenceReq;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Recommendations(),
      visible: referenceReq,
    );
  }
}

class Recommendations extends StatefulWidget {
  const Recommendations({
    Key? key,
  }) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  bool toggle1 = false;
  //bool toggle2 = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      title: Text(
        'Recommendations',
        style: GoogleFonts.poppins(fontSize: 15),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.auto_stories_rounded),
            // Icon(Icons.group_rounded),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Switch(
              value: toggle1,
              activeColor: secondaryColor,
              onChanged: (value) {
                setState(() {
                  toggle1 = !toggle1;
                });
              },
            ),
            // Switch(
            //   value: toggle2,
            //   activeColor: secondaryColor,
            //   onChanged: (value) {
            //     setState(() {
            //       toggle2 = !toggle2;
            //     });
            //   },
            // )
          ],
        )
      ],
    );
  }
}
