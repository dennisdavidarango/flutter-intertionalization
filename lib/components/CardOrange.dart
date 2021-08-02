import 'package:flutter/material.dart';

class CardOrange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
          height: 70.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  colors: [Color(0xFFFF4D00), Color(0xFFFF4D00)],
                  begin: FractionalOffset(0.7, 0.0),
                  end: FractionalOffset(2.0, 0.8),
                  stops: [0.0, 0.6],
                  tileMode: TileMode.clamp)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                child: Icon(Icons.monetization_on, size: 40),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 10),
                    child: Text(
                      'Finance & Insurace',
                      style: TextStyle(
                          fontFamily: 'pro',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4),
                    child: Text('Accounting, Banking, Insurance',
                        style: TextStyle(fontSize: 13)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 50, bottom: 8),
                child: Icon(Icons.info_outline, size: 28.0),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 22, bottom: 8),
                child: Icon(Icons.check, size: 28.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
