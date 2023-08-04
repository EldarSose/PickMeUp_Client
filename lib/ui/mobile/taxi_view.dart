import 'package:flutter/material.dart';
import 'package:pickmeup/models/user.dart';
import 'package:pickmeup/service/user_service.dart';

import '../../models/taxi.dart';
import 'home_page.dart';

class TaxiView extends StatefulWidget {
  final Taxi taxi;
  const TaxiView(this.taxi, {super.key});

  @override
  State<TaxiView> createState() => _TaxiViewState();
}

class _TaxiViewState extends State<TaxiView> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()))),
        title: Center(
            child: Text(
          "${widget.taxi.taxiName}",
        )),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FutureBuilder<User>(
                future: getUser(widget.taxi.userId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            color: const Color.fromARGB(120, 0, 0, 0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.taxi.taxiName.toString(),
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Adresa: ${widget.taxi.address.toString()}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Vlasnik: ${snapshot.data?.firstName} ${snapshot.data?.lastName}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      right: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    color: const Color.fromARGB(120, 0, 0, 0),
                                  ),
                                  child: ListTile(
                                    title: const Text(
                                      "Početna cijena: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${widget.taxi.startingPrice}KM",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    color: const Color.fromARGB(120, 0, 0, 0),
                                  ),
                                  child: ListTile(
                                    title: const Text(
                                      "Cijena po km: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${widget.taxi.pricePerKilometer}KM",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ExpansionTile(
                          //TODO PROSJECNA OCJENA
                          title: Text('Reviews',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                          trailing: Icon(
                            color: Theme.of(context).primaryColor,
                            _customTileExpanded
                                ? Icons.arrow_drop_down_circle
                                : Icons.arrow_drop_down,
                          ),
                          children: <Widget>[
                            // TODO
                            //   Center(
                            //     child: FutureBuilder<dynamic>(
                            //         future: fetchReviewsByTaxi(),
                            //         builder: (context, snapshot) {
                            //           if (snapshot.connectionState ==
                            //               ConnectionState.waiting) {
                            //             return const CircularProgressIndicator();
                            //           } else if (snapshot.hasData &&
                            //               snapshot.data!.isNotEmpty) {
                            //             final apartments = snapshot.data!;
                            //             return buildApartments(
                            //                 apartments, context);
                            //           } else {
                            //             return const Text(
                            //                 "Apartments not found.");
                            //           }
                            //         }),
                            //   ),
                            //   Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Container(
                            //         margin: const EdgeInsets.all(10),
                            //         child: FloatingActionButton(
                            //           heroTag: null,
                            //           backgroundColor: const Color(0xfff8a55f),
                            //           onPressed: () {
                            //             Navigator.of(context).push(
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         const SearchForm()));
                            //           },
                            //           child: const Icon(Icons.add_outlined),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                          ],
                          onExpansionChanged: (bool expanded) {
                            setState(() => _customTileExpanded = expanded);
                          },
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}

Future<User> getUser(id) async {
  return await UserService().getUserById(id);
}
