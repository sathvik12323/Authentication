import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

//import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  //const signup({super.key});
  late Box b1;
  late Box b2;
  signup(userbox, box2) {
    b1 = userbox;
    b2 = box2;
  }

  @override
  State<signup> createState() => _signupState(b1, b2);
}

class _signupState extends State<signup> {
  bool value = false;
  GlobalKey<FormState> fkey = GlobalKey();
  String? name;
  String? pass;
  String? pass1;
  String? email;
  late String? phoneno;
  late Box userbox;
  late Box b2;
  _signupState(userbox, b2) {
    this.userbox = userbox;
    this.b2 = b2;
  }

  double screenWidth(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).width - reducedBy) / dividedBy;
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fkey = GlobalKey();
    return Scaffold(
        appBar: AppBar(
          title: Text('signup screen'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
            child: Form(
                key: fkey,
                child: Container(
                    color: Colors.grey,
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Container(
                                        width:
                                            screenWidth(context, dividedBy: 2),
                                        color: Colors.red,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.red),
                                          child: Text("LOGIN"),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: ((context) =>
                                                        login())));
                                          },
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                        width:
                                            screenWidth(context, dividedBy: 2),
                                        color: Color.fromARGB(255, 255, 10, 6),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(
                                                    255, 255, 255, 255)
                                                .withOpacity(0),
                                          ),
                                          child: Text("signup"),
                                          onPressed: () {},
                                        )),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: 60),
                      Container(
                          width: 700,
                          height: 800,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            children: [
                              Text("Create an Account"),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: 'Name',
                                      hintText: 'sathvik',
                                      suffixIcon: Icon(Icons.person)),
                                  validator: (value) {
                                    if (value == "") {
                                      return "id can't be empty";
                                    }
                                    if (userbox.containsKey(value)) {
                                      return "user Alredy exist";
                                    }
                                  },
                                  onChanged: (value) => name = value,
                                ),
                              ),
                              SizedBox(height: 30),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == "") {
                                        return "id can't be empty";
                                      }
                                    },
                                    onChanged: ((value) => email = value),
                                    decoration: InputDecoration(
                                      labelText: 'email',
                                      hintText: 'email@gmail.com',
                                      suffixIcon: Icon(Icons.email),
                                    ),
                                  )),
                              SizedBox(height: 30),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == "") {
                                        return "number can't be empty";
                                      }
                                    },
                                    onChanged: ((value) => phoneno = value),
                                    decoration: InputDecoration(
                                        labelText: 'conatact number',
                                        hintText: '9121485636',
                                        suffixIcon: Icon(Icons.phone)),
                                  )),
                              SizedBox(height: 30),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: TextFormField(
                                    validator: ((value) {
                                      if ((value!.length) < 8) {
                                        return "length should be greater than 7";
                                      }
                                    }),
                                    obscureText: true,
                                    obscuringCharacter: '*',
                                    onChanged: ((value) => pass = value),
                                    decoration: InputDecoration(
                                        labelText: 'Password',
                                        hintText: 'password',
                                        suffixIcon: Icon(Icons.lock)),
                                  )),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Checkbox(
                                    value: this.value,
                                    onChanged: (boovalue) {
                                      setState(() {
                                        this.value = value;
                                      });
                                    },
                                  ),
                                  Center(
                                      child: Text.rich(
                                    textAlign: TextAlign.center,
                                    TextSpan(
                                      text: 'I agree with ',
                                      style: TextStyle(fontSize: 15),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: 'term & conditions',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Colors.red)),
                                        // can add more TextSpans here...
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: Row(
                                children: [
                                  Text("alredy have an account"),
                                  TextButton(
                                      onPressed: () {},
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text('forgot password'))),
                                ],
                              )),
                              SizedBox(height: 50),
                              Container(
                                  width: 350,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 250, 7, 7),
                                    ),
                                    child: Text("register"),
                                    onPressed: () {
                                      if (fkey.currentState!.validate()) {
                                        //  userbox.put(name, pass);
                                        userbox.put(email,
                                            [name, email, phoneno, pass]);
                                        b2.put(email, pass);
                                        Navigator.of(context).pop();
                                        print(b2);
                                      }
                                    },
                                  ))
                            ],
                          ))
                    ])))));
  }
}
