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
    // var url = Uri.parse('${GlobalUrl.url}report/$id');
    // final response = await http.get(url);

    // if (response.statusCode == 200) {
    //   return Report.fromMap(json.decode(response.body));
    // } else {
    //   throw Exception("Unexpected error ocured");
    // }
    throw Exception("Not implemented");
  }

  Future<Taxi> addTaxi(Taxi taxi) async {
    // final response = await http.post(
    //   Uri.parse('${GlobalUrl.url}report/add'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, dynamic>{
    //     'title': report.title.toString(),
    //     'description': report.description.toString(),
    //     'madeBy': report.madeBy,
    //     'timeCreated': report.timeCreated.toString(),
    //     'timeFinished': report.timeFinished,
    //     'status': report.status,
    //     'closedBy': report.closedBy,
    //   }),
    // );
    // if (response.statusCode == 201) {
    //   return Report.fromMap(json.decode(response.body));
    // } else {
    //   throw Exception('Report loading failed!');
    // }
    throw Exception("Not implemented");
  }

  Future<Taxi> editTaxi(Taxi taxi) async {
    // final response = await http.put(
    //   Uri.parse('${GlobalUrl.url}report/edit/${report.id}'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, dynamic>{
    //     'title': report.title.toString(),
    //     'description': report.description.toString(),
    //     'madeBy': report.madeBy,
    //     'timeCreated': report.timeCreated.toString(),
    //     'timeFinished': report.timeFinished,
    //     'status': report.status,
    //     'closedBy': report.closedBy,
    //   }),
    // );

    // if (response.statusCode == 200) {
    //   return Report.fromMap(json.decode(response.body));
    // } else {
    //   throw Exception('Unexpected error occured');
    // }
    throw Exception("Not implemented");
  }
}
