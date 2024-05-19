import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pickmeup/ui/mobile/home_page.dart';
import 'package:pickmeup/ui/mobile/mobile_helper/background.dart';
import 'package:pickmeup/ui/mobile/mobile_register.dart';

class MobileLoginForm extends StatefulWidget {
  const MobileLoginForm({super.key});

  @override
  State<MobileLoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<MobileLoginForm> {
  static final _myBox = Hive.box("myBox");

  void saveDataToLocalStorage(data) async {
    _myBox.put(1, {
      "ime": data["ime"],
      "prezime": data["prezime"],
      "adresaKuce": data["adresaKuce"],
      'kucaId': data['kucaId']
    });
  }

  static dynamic readData() {
    return _myBox.get(1);
  }

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                margin: const EdgeInsets.only(
                  top: 150,
                  bottom: 150,
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 183, 27, 204),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(
                          right: 70,
                        ),
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
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 32,
                              ),
                              child: TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter Email";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 20),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.account_circle_rounded),
                                  hintText: "Email",
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
                                  hintStyle: TextStyle(fontSize: 22),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.lock),
                                  hintText: "********",
                                ),
                              ),
                            )
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
                              // var personDetails = await AuthService.login(
                              //      _usernameController, _passwordController);
                              var personDetails = 200;
                              var loginStatusCode = personDetails;

                              // var personDetailsConverted  =
                              //     json.decode(personDetails);

                              // saveDataToLocalStorage(personDetailsConverted);
                              // RoleUtil(readData());
                              _usernameController.clear();
                              _passwordController.clear();

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              //}
                              if (loginStatusCode == 400) {
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
                                                borderRadius: BorderRadius.all(
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
                                                        "The Password You Entered Is Incorrect. Please Try Again",
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
                              } else if (loginStatusCode == 404) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.transparent,
                                        elevation: 0.0,
                                        content: Stack(children: [
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 60,
                                            decoration: const BoxDecoration(
                                                color: Color(0xFFC72C41),
                                                borderRadius: BorderRadius.all(
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
                                                        "User does not exist",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, top: 24),
                    child: InkWell(
                      onTap: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MobileRegisterForm(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register",
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
