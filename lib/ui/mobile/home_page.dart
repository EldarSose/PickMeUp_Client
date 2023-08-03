import 'package:flutter/material.dart';
import 'package:pickmeup/models/taxi.dart';
import 'package:pickmeup/service/taxi_service.dart';

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
                  return Text("${snapshot.data![index].address}");
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
