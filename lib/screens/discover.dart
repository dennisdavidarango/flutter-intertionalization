import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

class Discover extends StatelessWidget {
  final double initialRadius = 25.0;
  final double radiusIncrement = 25.0;
  final int maxNumberOfPlanets = 8;
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
          Container(
            height: 750,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Color(0xFF040412),
                ),
                _StarsBackground(),
                CustomPaint(
                  painter: OllusCirclePath(
                    radius: initialRadius,
                    radiusIncrement: radiusIncrement,
                    numberOfPlanets: maxNumberOfPlanets,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                ...planetsBuilder(),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> planetsBuilder() {
    double newRadius = initialRadius;
    final List<Widget> planetsList = [];

    for (int i = 0; i < maxNumberOfPlanets; i++) {
      planetsList.add(PlanetWidget(
        initialRadius: newRadius,
        index: i,
      ));
      newRadius += radiusIncrement;
    }

    return planetsList;
  }
}

class PlanetWidget extends StatefulWidget {
  final double initialRadius;
  final int index;

  const PlanetWidget({
    Key? key,
    required this.initialRadius,
    required this.index,
  }) : super(key: key);

  @override
  _PlanetWidgetState createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {
  final colors = const [
    Color(0xffb58668),
    Color(0xffF3B3B3),
    Color(0xff6DCAEC),
    Color(0xffDD4530),
    Colors.purple,
    Color(0xffFEF49D),
    Color(0xff57A0FF),
    Color(0xff2A52B5),
  ];

  static const _mercury = 47.4;
  final orbitVelocities = <double>[
    _mercury / 47.4, //mercury
    _mercury / 35.0, //venus
    _mercury / 29.8, //Earth
    _mercury / 24.1, //Mars
    _mercury / 13.1, //Jupiter
    _mercury / 9.7, //Saturn
    _mercury / 6.8, //Uranus
    _mercury / 5.4, //Neptune
  ];

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: (2000 * orbitVelocities[widget.index]).toInt()),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.addListener(() {
      /*if(_controller.status == AnimationStatus.completed){
        _controller.re
      }*/
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) => Transform.translate(
          offset: Offset(0.0, widget.initialRadius),
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: colors[widget.index],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class OllusCirclePath extends CustomPainter {
  final double radius;
  final double radiusIncrement;
  final int numberOfPlanets;

  OllusCirclePath({
    required this.radius,
    required this.radiusIncrement,
    required this.numberOfPlanets,
  });

  final Paint myPaint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    double newRadius = radius;
    for (int i = 0; i < numberOfPlanets; ++i) {
      path.addOval(
        Rect.fromCircle(
          center: Offset(0, 0),
          radius: newRadius,
        ),
      );

      newRadius += radiusIncrement;
    }

    canvas.drawPath(path, myPaint);
  }

  @override
  bool shouldRepaint(CustomPainter customPainter) {
    return true;
  }
}

class _StarsBackground extends StatelessWidget {
  final int numberStars = 50;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: getStars(context),
      ),
    );
  }

  List<Widget> getStars(BuildContext context) {
    final List<Widget> stars = [];

    for (int i = 0; i < numberStars; ++i) {
      final xy = getRandomXY(context);
      final widget = Transform.translate(
        offset: Offset(xy[0], xy[1]),
        child: Container(
          width: 2.5,
          height: 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );

      stars.add(widget);
    }

    return stars;
  }

  List<double> getRandomXY(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double x = size.width * (math.Random().nextDouble() - 1 / 2);
    double y = size.height * (math.Random().nextDouble() - 1 / 2);

    return [x, y];
  }
}
