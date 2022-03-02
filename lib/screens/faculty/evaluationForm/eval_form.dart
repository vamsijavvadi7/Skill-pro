import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firstskillpro/styling.dart';
import 'recommendations.dart';
import 'header_details.dart';

class EvaluationForm extends StatefulWidget {
  const EvaluationForm({Key? key}) : super(key: key);

  @override
  _EvaluationFormState createState() => _EvaluationFormState();
}

class _EvaluationFormState extends State<EvaluationForm> {
  int value = 0;
  bool referenceReq = false;
  bool isButtonOn = false;

  late ScrollController controller;
  bool fabIsVisible = true;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(() {
      setState(() {
        fabIsVisible =
            controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Evaluation Form",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(controller: controller, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Details of the competency...
                Details(),

                SizedBox(
                  height: 20,
                  child: const Divider(
                    height: 5,
                    thickness: 2,
                  ),
                ),

                // List of criterias and their details

                Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: <Widget>[
                            Text('1. Recording case history:',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            Switch(
                                value: isButtonOn,
                                activeColor: secondaryColor,
                                onChanged: (value) {
                                  setState(() {
                                    referenceReq = !referenceReq;
                                    isButtonOn = !isButtonOn;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        for (int i = 0; i < 3; i++)
                          ListTile(
                            title: Text('$i'),
                            leading: Radio(
                              value: i,
                              groupValue: value,
                              onChanged: (value1) => setState(() {
                                value = i;
                              }),
                            ),
                          ),
                        RecommendationsAlerBox(referenceReq: referenceReq),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
        floatingActionButton: AnimatedOpacity(
          child: FloatingActionButton.extended(
            onPressed: () {
              
            },
            label: Text(
              'Add mentoring?',
              style: poppins,
            ),
            backgroundColor: secondaryColor,
          ),
          duration: Duration(milliseconds: 300),
          opacity: fabIsVisible ? 1 : 0,
        ),
      ),
    );
  }
}
