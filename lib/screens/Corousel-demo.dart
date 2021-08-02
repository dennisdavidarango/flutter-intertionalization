import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_internationalization/screens/start-screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "CarouselDemo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  int _current = 0;
  List imgList = [
    'https://images.unsplash.com/photo-1502117859338-fd9daa518a9a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1554321586-92083ba0a115?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1536679545597-c2e5e1946495?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1543922596-b3bbaba80649?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
    'https://images.unsplash.com/photo-1502943693086-33b5b1cfdf2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80'
  ];

  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070417),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 450.0,
                      aspectRatio: 19 / 9,
                      viewportFraction: 1.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  items: imgList.map((imgUrl) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: 450.0,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                        ),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      );
                    });
                  }).toList(),
                  carouselController: buttonCarouselController,
                ),
              ),
              Container(
                width: double.infinity,
                height: 450.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.black12, Color(0xFF040412)]),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.white : Colors.white38),
              );
            }).toList(),
          ),
          this.login(context)
        ],
      ),
    );
  }

  Widget login(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Email",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            )),
        Container(
          margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StartScreen()));
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
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
          child: Center(
            child: Text(AppLocalizations.of(context)!.or_sign_up),
          ),
        ),
        Row(
          children: [
            Container(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 10.0, right: 5.0),
                      height: 50.0,
                      width: 150.0,
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
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin:
                          EdgeInsets.only(top: 20.0, left: 10.0, right: 5.0),
                      height: 50.0,
                      width: 150.0,
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
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
