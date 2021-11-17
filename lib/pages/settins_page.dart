import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  var val = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 60,
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Settings",
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
        titleSpacing: 30,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 15,
                  right: 0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                  trailing: Switch(
                    value: val,
                    onChanged: (bool) {
                      if (val) {
                        setState(() {
                          val = false;
                        });
                      } else {
                        setState(() {
                          val = true;
                        });
                      }
                    },
                  ),
                  title: Text(
                    "Notification",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 5,
                  right: 0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Share",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 5,
                  right: 0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Privacy and policy",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 5,
                  right: 0,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.receipt,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Terms and conditions",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  top: 5,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  title: Text(
                    "About",
                    style: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    showAboutDialog(
                      context: context,
                      applicationName: 'Musify',
                      applicationIcon: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image(
                          height: 50,
                          image: AssetImage("assets/icons/default.jpg"),
                        ),
                      ),
                      applicationVersion: '1.0.0',
                      children: [
                        Text('Offline music player'),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    "version",
                    style: GoogleFonts.rubik(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  "1.0.0",
                  style: GoogleFonts.rubik(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
