import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 5.0),
            height: 60.0,
            width: 190.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Color(0xFF292937), Color(0xFF292937)],
                    begin: FractionalOffset(0.7, 0.0),
                    end: FractionalOffset(2.0, 0.8),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.link_rounded),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'LinkedIn',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 5.0),
            height: 60.0,
            width: 190.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Color(0xFF292937), Color(0xFF292937)],
                    begin: FractionalOffset(0.7, 0.0),
                    end: FractionalOffset(2.0, 0.8),
                    stops: [0.0, 0.6],
                    tileMode: TileMode.clamp)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_twilight_sharp),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Twitter',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
