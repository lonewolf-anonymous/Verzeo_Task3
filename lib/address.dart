import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verzeo_task3/account.dart';

class MyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: "Enter your Name",
                    labelStyle: GoogleFonts.lato()),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "House No./Building No.",
                    hintText: "Enter your house No.",
                    labelStyle: GoogleFonts.lato()),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Locality",
                    hintText: "Enter your Locality",
                    labelStyle: GoogleFonts.lato()),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "City",
                    hintText: "Enter your City Name",
                    labelStyle: GoogleFonts.lato()),
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Pincode",
                    hintText: "Enter your area Pincode",
                    labelStyle: GoogleFonts.lato()),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Myaccount()));
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
      ),
    );
  }
}
