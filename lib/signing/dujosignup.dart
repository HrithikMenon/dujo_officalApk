import 'package:dujo_offical_apk/create_profile.dart';
import 'package:dujo_offical_apk/signing/dujosigning.dart';
import 'package:flutter/material.dart';

import '../controllers/get_schoolList/dropdown-schoolList.dart';

const List<Widget> Schools = <Widget>[
  Text('Student'),
  Text('Parent'),
  Text('Teacher')
];

class DujoSignup extends StatefulWidget {
  const DujoSignup({super.key});

  @override
  State<DujoSignup> createState() => _DujoSignupState();
}

class _DujoSignupState extends State<DujoSignup> {
  final List<bool> _selectedSchools = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          // width: double.infinity,
          Container(
            width: screenSize.width * 0.8,
            margin: EdgeInsets.only(top: screenSize.width * 1 / 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                        Padding(
                          padding:
                              EdgeInsets.only(top: screenSize.width * 1 / 20),
                          child: Container(
                            height: screenSize.width * 1 / 7,
                            width: screenSize.width * 1 / 3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://storage.googleapis.com/scipro-bucket/lepton%20dujo.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(top: screenSize.width * 1 / 12),
                            width: screenSize.width / 3,
                            child: Divider(
                              color: Colors.red,
                              thickness: 3,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                height: screenSize.height * 0.7,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/leptondujobg.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenSize.width * 1),
                child: Container(
                  height: screenSize.width * 2,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    gradient: LinearGradient(
                      colors: [Color(0xFFD40469), Color(0xFF5F005B)],
                      //colors: [Colors.blue, Colors.blueGrey],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width * 0.005,
                  top: screenSize.width * 1.11,
                  //right: screenSize.width * 1/30
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 245, 162, 166),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ToggleButtons(
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _selectedSchools.length; i++) {
                              _selectedSchools[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1)),
                        selectedBorderColor: Colors.red[700],
                        selectedColor: Colors.black,
                        fillColor: Colors.white,
                        color: Colors.black,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 100.0,
                        ),
                        isSelected: _selectedSchools,
                        children: Schools,
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 15,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      child: Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 238, 238, 238)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Select Category",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18),
                            ),
                          ),
                          underline: const SizedBox(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.all(
                              13,
                            ),
                            child: Icon(Icons.arrow_drop_down,
                                size: 18, color: Colors.grey),
                          ),
                          isExpanded: true,
                          items: [
                            "School",
                            "College",
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              var yourVar = val.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 10,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      child: Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 238, 238, 238)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const GetSchoolListDropDownButton()
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 10,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      child: Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 238, 238, 238)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Select Class",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18),
                            ),
                          ),
                          underline: const SizedBox(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.all(
                              13,
                            ),
                            child: Icon(Icons.arrow_drop_down,
                                size: 18, color: Colors.grey),
                          ),
                          isExpanded: true,
                          items: [
                            "Class 1",
                            "Class 2",
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              var yourVar = val.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.width * 1 / 10,
                    ),
                    Container(
                      height: 60,
                      width: 250,
                      child: Container(
                        height: screenSize.width * 1 / 8,
                        width: screenSize.width * 1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromARGB(255, 238, 238, 238)),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: DropdownButton(
                          hint: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Select Name",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18),
                            ),
                          ),
                          underline: const SizedBox(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          icon: const Padding(
                            padding: EdgeInsets.all(
                              13,
                            ),
                            child: Icon(Icons.arrow_drop_down,
                                size: 18, color: Colors.grey),
                          ),
                          isExpanded: true,
                          items: [
                            "Name 1",
                            "Name 2",
                          ].map(
                            (val) {
                              return DropdownMenuItem<String>(
                                value: val,
                                child: Text(val),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              var yourVar = val.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Enter Mail ID',
                                prefixIcon: Icon(Icons.mail_lock_sharp),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: screenSize.width * 1 / 13),
                      child: Container(
                        height: screenSize.width * 1 / 6.8,
                        width: screenSize.width * 0.65,
                        decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Confirm Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                )),
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    SizedBox(height: screenSize.width * 1 / 15),
                    Container(
                      height: screenSize.width * 1 / 7,
                      width: screenSize.width * 1 / 1.5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(14)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.all(9.0),
                          textStyle: const TextStyle(fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Profile(),
                              ));
                        },
                        child: const Text('SIGN UP'),
                      ),
                    ),
                    SizedBox(height: screenSize.width * 1 / 100),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenSize.width * 1 / 8,
                          top: screenSize.width * 1 / 29),
                      child: Row(children: [
                        Text(
                          "Don't have an account ? ",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          child: Container(
                            child: Text(
                              "Sign IN",
                              style: TextStyle(
                                  fontSize: 19, color: Colors.yellowAccent),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  DujoLogin()),
                            );
                          },
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
