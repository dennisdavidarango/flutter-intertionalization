import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_internationalization/screens/home.dart';

class WhiteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          height: 60.0,
          width: 150.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.next,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: 'pro',
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.navigate_next, color: Colors.black)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
