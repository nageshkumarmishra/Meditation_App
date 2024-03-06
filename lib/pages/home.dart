import 'package:flutter/material.dart';
import 'package:meditation_app/pages/dashboard.dart';
import 'package:meditation_app/widgets/rectangle_button.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:meditation_app/mantra.dart';
import 'package:meditation_app/pages/mantraListPage.dart';


class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/meditation.png"),
              const Text(
                "Time to DivyaJapa",
                style: kLargeTextStyle,
                textAlign: TextAlign.center,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Take a breath,\nand ease your mind",
                  style: kMeduimTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RectangleButton(
                onPressed: () =>
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                     // builder: (context) =>  MantraListPage(deityName: 'Shiva'),

                    ),),
                child: const Text(
                  "Let's get started",
                  style: kButtonTextStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
