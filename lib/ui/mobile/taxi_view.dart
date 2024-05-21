import 'package:flutter/material.dart';
import 'package:pickmeup/models/reviews.dart';
import 'package:pickmeup/models/user.dart';
import 'package:pickmeup/service/reviews_service.dart';
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
            child: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Text(
            "${widget.taxi.taxiName}",
          ),
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
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            color: Color.fromARGB(0, 0, 0, 0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.taxi.taxiName.toString(),
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "Adresa: ${widget.taxi.address.toString()}",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "Vlasnik: ${snapshot.data?.firstName} ${snapshot.data?.lastName}",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
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
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                      ),
                                      right: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      "Početna cijena: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${widget.taxi.startingPrice}KM",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    color: Color.fromARGB(0, 0, 0, 0),
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      "Cijena po km: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "${widget.taxi.pricePerKilometer}KM",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
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
                            Center(
                              child: FutureBuilder<dynamic>(
                                  future:
                                      fetchReviewsByTaxi(widget.taxi.taxiId),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const CircularProgressIndicator();
                                    } else if (snapshot.hasData &&
                                        snapshot.data!.isNotEmpty) {
                                      final apartments = snapshot.data!;
                                      return buildTaxi(
                                          apartments, context, widget.taxi);
                                    } else {
                                      return const Text(
                                          "Apartments not found.");
                                    }
                                  }),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  child: FloatingActionButton(
                                    heroTag: null,
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    onPressed: () {
                                      /*Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ));*/
                                    },
                                    child: const Icon(Icons.add_outlined),
                                  ),
                                ),
                              ],
                            ),
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

Widget buildTaxi(List<Reviews> reviews, dynamic context, Taxi taxi) =>
    ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];
        print(reviews[index].comment);

        return InkWell(
          /*onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppartmentView(apartment, building)));
          },*/
          child: Card(
            child: ListTile(
              shape: RoundedRectangleBorder(
                  side:
                      BorderSide(width: 2, color: Colors.grey.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20)),
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text("${review.comment}"),
              subtitle: Text("Rating: ${review.rating}"),
              trailing: Icon(
                Icons.arrow_forward,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );
      },
    );

Future<List<Reviews>> fetchReviewsByTaxi(taxiId) async {
  return await ReviewsService.getAllReviews();
}
