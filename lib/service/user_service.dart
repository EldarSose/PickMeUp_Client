import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
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

  static Future addUser(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController usernameController,
      TextEditingController dateController,
      TextEditingController phoneNumberController,
      TextEditingController passwordController,
      TextEditingController genderController,
      TextEditingController taxiCompanyController) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }
    final response = await http.post(
      Uri.parse('${url}User/Add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'firstName': firstNameController.text.toString(),
        'lastName': lastNameController.text.toString(),
        'dateOfBirth': dateController.text,
        'genderID': 1, //genderController.text,
        'phoneNumber': '063799704', //phoneNumberController.text.toString(),
        'taxiCompanyID': null, // taxiCompanyController.text,
        'email': usernameController.text.toString(),
        'password': passwordController.text.toString()
      }),
    );

    return response;
    /*
    if (response.statusCode == 200) {
      return User.fromMap(json.decode(response.body));
    } else {
      throw Exception("Unexpected error ocured");
    }
    */
  }

  static Future login(TextEditingController usernameController,
      TextEditingController passwordController) async {
    var url;
    if (Platform.isAndroid || Platform.isIOS) {
      url = GlobalUrl.mobileUrl;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      url = GlobalUrl.desktopUrl;
    }
    final personDetails = await http.post(Uri.parse('$url/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': usernameController.text.toString(),
          'password': passwordController.toString(),
        }));

    return personDetails;
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
