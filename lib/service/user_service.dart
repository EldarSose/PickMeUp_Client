import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pickmeup/models/user.dart';

import '_global_url.dart';

class UserService {
  Future<List<User>> getAllUsers() async {
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

  Future<User> getUserById(int id) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }
    var u = Uri.parse('${url}User/GetById?id=$id');
    final response = await http.get(u);

    if (response.statusCode == 200) {
      return User.fromMap(json.decode(response.body));
    } else {
      throw Exception("Unexpected error ocured");
    }
  }

  Future<User> addUser(User user) async {
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

  Future<User> editUser(User user) async {
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
