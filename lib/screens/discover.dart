import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Discover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBar(
            backgroundColor: Color(0xFF040412),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)!.skipForNow,
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
