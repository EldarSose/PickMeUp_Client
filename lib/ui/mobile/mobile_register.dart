import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pickmeup/service/user_service.dart';
import 'package:pickmeup/ui/mobile/mobile_login.dart';

import 'mobile_helper/background.dart';

class MobileRegisterForm extends StatefulWidget {
  const MobileRegisterForm({Key? key}) : super(key: key);

  @override
  State<MobileRegisterForm> createState() => _MobileRegisterFormState();
}

class _MobileRegisterFormState extends State<MobileRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _genderController = TextEditingController();
  final _taxiCompanyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          const Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 100, top: 100),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 183, 27, 204),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 300,
                  child: Stack(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: const EdgeInsets.only(right: 70),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(100),
                              bottomRight: Radius.circular(100),
                            ),
                            border: Border.all(
                              color: const Color.fromARGB(255, 84, 5, 98),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                  controller: _firstNameController,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter First Name";
                                    } else {
                                      return value.trim().length < 3
                                          ? 'Minimum character length is 3'
                                          : null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person),
                                    hintText: "First Name",
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                  controller: _lastNameController,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter Last Name";
                                    } else {
                                      return value.trim().length < 3
                                          ? 'Minimum character length is 3'
                                          : null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.person),
                                    hintText: "Last Name",
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                  controller: _usernameController,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter Username";
                                    } else {
                                      return value.trim().length < 5
                                          ? 'Minimum character length is 5'
                                          : null;
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.account_circle_rounded),
                                    hintText: "Username",
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                  controller: _passwordController,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Enter Password";
                                    } else {
                                      return value.trim().length < 5
                                          ? 'Minimum character length is 5'
                                          : null;
                                    }
                                  },
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(fontSize: 16),
                                    border: InputBorder.none,
                                    icon: Icon(Icons.lock),
                                    hintText: "Password",
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 16, right: 32),
                                child: TextFormField(
                                    controller: _dateController,
                                    // ignore: body_might_complete_normally_nullable
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "Enter Date";
                                      }
                                    },
                                    decoration: const InputDecoration(
                                      hintStyle: TextStyle(fontSize: 16),
                                      border: InputBorder.none,
                                      icon: Icon(Icons.date_range),
                                      hintText: "Select Date",
                                    ),
                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now());

                                      if (pickedDate != null) {
                                        setState(() {
                                          _dateController.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                        });
                                      }
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 15),
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green[200]!.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color.fromARGB(255, 183, 27, 204),
                                Color.fromARGB(255, 136, 34, 226),
                              ],
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                var statusCode = await UserService.addUser(
                                    _firstNameController,
                                    _lastNameController,
                                    _usernameController,
                                    _dateController,
                                    _phoneNumberController,
                                    _passwordController,
                                    _genderController,
                                    _taxiCompanyController);

                                if (statusCode >= 200 && statusCode < 300) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const MobileLoginForm(),
                                  ));
                                } else if (statusCode == 409) {
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.transparent,
                                          elevation: 0.0,
                                          content: Stack(children: [
                                            Container(
                                              padding: const EdgeInsets.all(16),
                                              height: 80,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xFFC72C41),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Row(
                                                children: [
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: const [
                                                        Text(
                                                          "Registration failed. The username is already taken.",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])));
                                }
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 24),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MobileLoginForm(),
                          ),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 183, 27, 204),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
