import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_1/card.dart';
import 'card2.dart';
//import 'signup.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // var directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);

  //await Firebase.initializeApp();
  await Hive.initFlutter();
  runApp(const MaterialApp(
    home: login(),
    debugShowCheckedModeBanner: false,
  ));
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  bool isChecked = false;

  double screenWidth(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return (screenSize(context).width - reducedBy) / dividedBy;
  }

  late Box box;
  late Box donbox;
  late Box reqbox;
  late Box userbox;

  @override
  initState() {
    db();
  }

  db() async {
    box = await Hive.openBox('login');
    //  donbox = await Hive.openBox('donate');
    //  reqbox = await Hive.openBox('request');
    userbox = await Hive.openBox('user');
    // reqbox.put('data',"Requesting data: ");
    // donbox.put('data'," ");
    // reqbox.deleteAt(1);
    // print('login data :');
    // print(box.keys);
    // print(box.values);

    print(box.values);
    String? s;
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    //box.put("vij", "1234");
    // print(box);
    GlobalKey<FormState> fkey = GlobalKey();
    late String? name;
    late String? pass;
    return Scaffold(
        appBar: AppBar(
          title: Text('login page'),
          backgroundColor: Colors.red,
        ),
        body: Form(
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
                                    width: screenWidth(context, dividedBy: 2),
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
                                    width: screenWidth(context, dividedBy: 2),
                                    color: Color.fromARGB(255, 255, 10, 6),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary:
                                            Color.fromARGB(255, 255, 255, 255)
                                                .withOpacity(0),
                                      ),
                                      child: Text("signup"),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            new MaterialPageRoute(
                                                builder: ((context) =>
                                                    signup(userbox, box))));
                                      },
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 60),
                  Container(
                      width: 700,
                      height: 500,
                      //color: Color.fromARGB(255, 184, 186, 184),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          const Text("Sign into your Account ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              validator: (value) {
                                if (value == "") return "Can't be empty";
                                if (!(box.containsKey((value)))) {
                                  return "user not exist";
                                }
                              },
                              onChanged: ((value) => name = value),
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'johndoe@gmail.com',
                                  suffixIcon: Icon(Icons.mail)),
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == "") return "Enter";
                                  String? t = box.get(name);
                                  if (!(value == t)) return "incorrect";
                                },
                                onChanged: ((value) => pass = value),
                                obscureText: true,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                    labelText: 'password',
                                    hintText: 'password',
                                    suffixIcon: Icon(Icons.lock)),
                              )),
                          SizedBox(height: 40),
                          TextButton(
                              onPressed: () {},
                              child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text('forgot password'))),
                          SizedBox(height: 40),
                          Text('login with',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )),
                          Container(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Container(
                                      alignment: Alignment.center,
                                      //decoration: BoxDecoration(),
                                      height: 25,
                                      width: 30,
                                      child: Image.asset('img/google1.jpg',
                                          fit: BoxFit.fitWidth)),
                                  SizedBox(width: 40),
                                  Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 30,
                                      //alignment: Alignment.center,
                                      child: Image.asset('img/download.jpg',
                                          fit: BoxFit.fitWidth)),
                                ],
                              )),
                          Center(
                              child: Row(
                            children: [
                              Text(
                                "Dont have an account?",
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text('forgot password')))
                            ],
                          )),
                          SizedBox(height: 40),
                          Container(
                            width: 350,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 223, 18, 18),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20))),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 250, 7, 7),
                              ),
                              child: Text("login"),
                              onPressed: () {
                                if (fkey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: ((context) => card2())));
                                }
                              },
                            ),
                            //fillColor: Colors.red,
                          ),
                        ],
                      )),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RawMaterialButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const card1())));
                          }))),
                ]))));
  }
}
