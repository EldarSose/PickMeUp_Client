//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pickmeup/models/reviews.dart';
import 'package:pickmeup/models/user.dart';
import 'package:pickmeup/service/reviews_service.dart';
import 'package:pickmeup/service/user_service.dart';

import '../../models/taxi.dart';
import 'home_page.dart';
import 'package:collection/collection.dart';

class TaxiView extends StatefulWidget {
  final Taxi taxi;
  const TaxiView(this.taxi, {super.key});

  @override
  State<TaxiView> createState() => _TaxiViewState();
}

class _TaxiViewState extends State<TaxiView> {
  bool _customTileExpanded = false;
  double rating = 0;
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  double submitRating = 5;
  @override
  void initState() {
    getRating(widget.taxi.taxiId).then((rat) {
      setState(() {
        rating = rat;
      });
    });
    super.initState();
  }

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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder<User>(
                    future: getUser(widget.taxi.userId),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            Container(
                              height: 260,
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
                                  RatingBar.builder(
                                      initialRating: rating,
                                      ignoreGestures: true,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                      onRatingUpdate: (rating) {
                                        //print(rating);
                                      }),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: FloatingActionButton.extended(
                                      heroTag: null,
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      onPressed: () {},
                                      label: const Text('Order a taxi'),
                                      icon:
                                          const Icon(Icons.car_rental_rounded),
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
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${widget.taxi.startingPrice}KM",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
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
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "${widget.taxi.pricePerKilometer}KM",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return const CircularProgressIndicator();
                    }),
                ExpansionTile(
                  title: Text('Reviews',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  trailing: Icon(
                    color: Theme.of(context).primaryColor,
                    _customTileExpanded
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down,
                  ),
                  children: <Widget>[
                    FutureBuilder<dynamic>(
                        future: fetchReviewsByTaxi(widget.taxi.taxiId),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasData &&
                              snapshot.data!.isNotEmpty) {
                            final apartments = snapshot.data!;
                            return buildTaxi(apartments, context, widget.taxi);
                          } else {
                            return const Text("Reviews not found.");
                          }
                        }),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: FloatingActionButton.extended(
                        heroTag: null,
                        backgroundColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                alignment: Alignment.bottomCenter,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2),
                                ),
                                elevation: 5.0,
                                backgroundColor: Colors.white,
                                child: Form(
                                  key: _formKey,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.8, // 80% of screen width
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Leave a review for ${widget.taxi.taxiName}",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                            border:
                                                Border.all(color: Colors.black),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 10,
                                                offset: const Offset(0, 4),
                                              ),
                                            ],
                                          ),
                                          margin: const EdgeInsets.only(
                                              left: 16, right: 32),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16.0),
                                            child: TextFormField(
                                              minLines: 1,
                                              maxLines: 3,
                                              controller: _commentController,
                                              validator: (value) {
                                                if (value!.trim().isEmpty) {
                                                  return "Enter a comment";
                                                } else {
                                                  return value.trim().length < 3
                                                      ? 'Minimum character length is 3'
                                                      : null;
                                                }
                                              },
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                border: InputBorder.none,
                                                icon: Icon(
                                                  Icons.person,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                hintText: "Comment",
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20.0),
                                        RatingBar.builder(
                                            initialRating: 5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                            onRatingUpdate: (selectRat) {
                                              setState(() {
                                                submitRating = selectRat;
                                                print(submitRating);
                                              });
                                            }),
                                        const SizedBox(height: 20.0),
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          child: FloatingActionButton.extended(
                                            //heroTag: null,
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                var r = await reviewAdd(
                                                    _commentController.text,
                                                    submitRating,
                                                    widget.taxi.taxiId,
                                                    1);
                                                if (r >= 200 && r <= 300) {
                                                  _commentController.clear();
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.of(context).pop();
                                                }
                                              }
                                            },
                                            label:
                                                const Text('Submit a review'),
                                            icon:
                                                const Icon(Icons.add_outlined),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        label: const Text('Leave a review'),
                        icon: const Icon(Icons.add_outlined),
                      ),
                    ),
                  ],
                  onExpansionChanged: (bool expanded) {
                    setState(() => _customTileExpanded = expanded);
                  },
                ),
              ],
            ),
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
      physics: const ClampingScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];

        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  alignment: Alignment.bottomCenter,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2),
                  ),
                  elevation: 5.0,
                  backgroundColor: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.8, // 80% of screen width
                    height: MediaQuery.of(context).size.height * 0.5,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Review with rating of: ${review.rating}"),
                        const SizedBox(height: 20.0),
                        Text("${review.comment}"),
                        const SizedBox(height: 20.0),
                        RatingBar.builder(
                            initialRating: review.rating!.toDouble(),
                            ignoreGestures: true,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Theme.of(context).primaryColor,
                                ),
                            onRatingUpdate: (rating) {
                              //print(rating);
                            }),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
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
              title: Text("${review.comment}", overflow: TextOverflow.ellipsis),
              subtitle: Text(
                "Rating: ${review.rating}",
              ),
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
  List<Reviews> rev = await ReviewsService.getAllReviews();

  List<Reviews> reviews = rev.where((x) => x.taxiId == taxiId).toList();

  return reviews;
}

Future<double> getRating(taxiId) async {
  List<Reviews> rev = await ReviewsService.getAllReviews();

  List<Reviews> reviews = rev.where((x) => x.taxiId == taxiId).toList();

  double average = reviews.map((e) => e.rating!.toDouble()).average;

  return average;
}

Future<int> reviewAdd(commentController, rating, _taxiId, _userId) async {
  var rev = Reviews(
      reviewId: 0,
      taxiId: _taxiId,
      comment: commentController,
      userId: _userId);
  return await ReviewsService.addReviews(rev);
}
