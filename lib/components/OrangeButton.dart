import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_internationalization/screens/home.dart';

class OrangeButton extends StatelessWidget {
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
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                  colors: [Color(0xFFF04E13), Color(0xFFF04E13)],
                  begin: FractionalOffset(0.7, 0.0),
                  end: FractionalOffset(2.0, 0.8),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.getStarted,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
