import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:verzeo_task3/account.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.indigo),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                        ),
                        Text("data"),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Myaccount()));
                            },
                            icon: Icon(Icons.arrow_forward))
                      ],
                    )),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("Brief History", style: GoogleFonts.lato()),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text("Help & Support", style: GoogleFonts.lato()),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.update),
                  title: Text("Updates", style: GoogleFonts.lato()),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("logout", style: GoogleFonts.lato()),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("Logout", style: GoogleFonts.lato()),
                          content: Text(
                            "Do you want to LogOut ?",
                            style: GoogleFonts.lato(),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  exit(0);
                                },
                                child: Text(
                                  "Logout",
                                  style: GoogleFonts.oswald(),
                                )),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.oswald(),
                                )),
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
