import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verzeo_task3/address.dart';

class Myaccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(),
            Text("data"),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  labelStyle: GoogleFonts.lato()),
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your Email",
                  labelStyle: GoogleFonts.lato()),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAddress()));
              },
              child: Text(
                "ADD ADDRESS",
                style: GoogleFonts.oswald(),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
