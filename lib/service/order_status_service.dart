import 'dart:convert';

import 'package:pickmeup/models/order_status.dart';

class OrderStatusService {
  Future<List<OrderStatus>> getAllOrderStatus() async {
    // var url = Uri.parse('${GlobalUrl.url}report');
    // final response = await http.get(url);

    // if (response.statusCode == 200) {
    //   List jsonResponse = json.decode(response.body);
    //   return jsonResponse.map((report) => Report.fromMap(report)).toList();
    // } else {
    //   throw Exception('Unexpected error occured');
    // }
    throw Exception("Not implemented");
  }

  Future<OrderStatus> getOrderStatusById(int id) async {
    // var url = Uri.parse('${GlobalUrl.url}report/$id');
    // final response = await http.get(url);

    // if (response.statusCode == 200) {
    //   return Report.fromMap(json.decode(response.body));
    // } else {
    //   throw Exception("Unexpected error ocured");
    // }
    throw Exception("Not implemented");
  }

  Future<OrderStatus> addOrderStatus(OrderStatus orderStatus) async {
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

  Future<OrderStatus> editOrderStatus(OrderStatus orderStatus) async {
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
