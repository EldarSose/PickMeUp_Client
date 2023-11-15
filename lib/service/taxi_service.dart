// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:pickmeup/models/taxi.dart';
import 'package:pickmeup/service/_global_url.dart';

class TaxiService {
  Future<List<Taxi>> getAllTaxi() async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }
    var u = Uri.parse('${url}Taxi/GetAll');
    final response = await http.get(u);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((taxi) => Taxi.fromMap(taxi)).toList();
    } else {
      throw Exception('Unexpected error occured');
    }
    //throw Exception("Not implemented");
  }

  Future<Taxi> getTaxiById(int id) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }
    var u = Uri.parse('${url}Taxi/GetById?=$id');
    final response = await http.get(u);

    if (response.statusCode == 200) {
      return Taxi.fromMap(json.decode(response.body));
    } else {
      throw Exception("Unexpected error ocured");
    }
    //throw Exception("Not implemented");
  }

  Future<Taxi> addTaxi(Taxi taxi) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }

    final response = await http.post(
      Uri.parse('${url}Taxi/TaxiAdd'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'taxiName': taxi.taxiName.toString(),
        'userId': taxi.userId.toString(),
        'startingPrice': taxi.startingPrice.toString(),
        'pricePerKilometer': taxi.pricePerKilometer.toString(),
        'address': taxi.address.toString()
      }),
    );
    if (response.statusCode == 201) {
      return Taxi.fromMap(json.decode(response.body));
    } else {
      throw Exception('Report loading failed!');
    }
    //throw Exception("Not implemented");
  }

  Future<Taxi> editTaxi(Taxi taxi) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    } 

    final response = await http.put(
      Uri.parse('${url}Taxi/TaxiEdit?=${taxi.taxiId}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'taxiName': taxi.taxiName.toString(),
        'userId': taxi.userId.toString(),
        'startingPrice': taxi.startingPrice.toString(),
        'pricePerKilometer': taxi.pricePerKilometer.toString(),
        'address': taxi.address.toString()
      }),
    );

    if (response.statusCode == 200) {
      return Taxi.fromMap(json.decode(response.body));
    } else {
      throw Exception('Unexpected error occured');
    }
    //throw Exception("Not implemented");
  }
}
