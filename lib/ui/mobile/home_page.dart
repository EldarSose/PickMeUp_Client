// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:pickmeup/models/taxi.dart';
import 'package:pickmeup/service/taxi_service.dart';
import 'package:pickmeup/ui/mobile/taxi_view.dart';

import 'mobile_helper/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Home page"),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Taxi>>(
        future: getTaxi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return buildTaxiUI(taxi: snapshot.data![index]);
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Text("Loading...");
        },
      ),
      bottomNavigationBar: const NavigationBarPage(
        index: 1,
      ),
    );
  }

  Future<List<Taxi>> getTaxi() {
    return TaxiService().getAllTaxi();
  }
}

// ignore: camel_case_types
class buildTaxiUI extends StatelessWidget {
  final Taxi taxi;
  const buildTaxiUI({
    Key? key,
    required this.taxi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          PageTransition(
            child: TaxiView(taxi),
            type: PageTransitionType.fade,
            duration: const Duration(
              milliseconds: 300,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 30,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(120, 0, 0, 0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: Text(
                  taxi.taxiName.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Starting price:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${taxi.startingPrice}KM",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Price per km:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${taxi.pricePerKilometer}KM",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Address:",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${taxi.address}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
