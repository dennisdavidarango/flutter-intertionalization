import 'dart:ui';
import 'package:flutter/material.dart';

class CardTransparent extends StatelessWidget {
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
              color: const Color(0xFF000000)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
                child: Icon(Icons.account_balance, size: 40),
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
                child: Icon(Icons.add, size: 28.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
