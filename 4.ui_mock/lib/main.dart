import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ui Mock',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF191b1a),
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chiang Mai"),
        leading:
            const Icon(Icons.chevron_left, size: 40, color: Color(0xFFe2b1b0)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(Icons.ios_share_sharp, color: Color(0xFFe2b1b0)),
                SizedBox(width: 15),
                Icon(Icons.favorite_border)
              ],
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Stack(
            children: [
              Column(
                children: const [
                  HotelImage(),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Info(),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: const Color(0xFFafcdef),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black54,
                                spreadRadius: 4,
                                blurRadius: 4)
                          ]),
                      child: const Text("Select a room",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HotelImage extends StatelessWidget {
  const HotelImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              "https://images.trvl-media.com/lodging/2000000/1810000/1803100/1803009/7cff0cd8.jpg?impolicy=resizecrop&rw=670&ra=fit",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 8,
            child: SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.circle, size: 7),
                  for (int i = 0; i < 4; i++) const Icon(Icons.circle, size: 5)
                ],
              ),
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.photo_library_outlined, size: 14),
                    SizedBox(width: 5),
                    Text("61", style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Header(),
      Container(
          margin: const EdgeInsets.only(top: 60, bottom: 30),
          child: const Review()),
      const PopularAmenities(),
      Container(
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: AspectRatio(
          aspectRatio: 11 / 1,
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTinIaF9WUyNaF1DpzBTqJn4ztCeRiYKR7t4Bzu72LSSnuE-Xro9xMkmg1qfqUaALN3geE&usqp=CAU",
              fit: BoxFit.fill),
        ),
      )
    ]);
  }
}

class PopularAmenities extends StatelessWidget {
  const PopularAmenities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Popular amenities",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Amenities(),
      ],
    );
  }
}

class Amenities extends StatelessWidget {
  const Amenities({Key? key}) : super(key: key);
  final firstCol = const [
    Amenity(icon: Icons.wifi, label: "Free WiFi"),
    Amenity(icon: Icons.ac_unit, label: "Air conditioning"),
    Amenity(icon: Icons.fitness_center, label: "Gym"),
  ];
  final secondcol = const [
    Amenity(icon: Icons.pool, label: "Pool"),
    Amenity(icon: Icons.directions_car, label: "Free parking"),
    Amenity(icon: Icons.thermostat_outlined, label: "Refrigerator"),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AminitiesCol(widgets: firstCol),
        const SizedBox(width: 25),
        AminitiesCol(widgets: secondcol)
      ],
    );
  }
}

class AminitiesCol extends StatelessWidget {
  const AminitiesCol({
    Key? key,
    required this.widgets,
  }) : super(key: key);
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets),
    );
  }
}

class Amenity extends StatelessWidget {
  const Amenity({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white70),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.white70))
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "9.0/10 Superb",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          "1,000 verified Hotels.com guest reviews",
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        SizedBox(height: 7),
        ReviewScore()
      ],
    );
  }
}

class ReviewScore extends StatelessWidget {
  const ReviewScore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "See all 1,000 reviews",
          style: TextStyle(fontSize: 16, color: Color(0xFFaac7e9)),
        ),
        SizedBox(width: 5),
        Icon(Icons.chevron_right, size: 16, color: Color(0xFFaac7e9))
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("UNESCO Sustainable Travel Pledge",
            style: TextStyle(fontSize: 12, color: Colors.white70)),
        SizedBox(height: 4),
        Text(
          "Shangri-La Chiang Mai",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        HeaderStar(),
        Text("Luxury hotel with free water park, near Chiang Mai Night Bazaar",
            style: TextStyle(fontSize: 18, color: Colors.white70))
      ],
    );
  }
}

class HeaderStar extends StatelessWidget {
  const HeaderStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          const Icon(
            Icons.star,
            color: Colors.white60,
            size: 16,
          )
      ],
    );
  }
}
