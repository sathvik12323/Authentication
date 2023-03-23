import 'package:flutter/material.dart';

class card1 extends StatefulWidget {
  const card1({super.key});

  @override
  State<card1> createState() => _card1State();
}

class _card1State extends State<card1> {
  final List<String> names = <String>[
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  int counter = 2;
  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('search'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: counter,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 150,
                    child: Card(
                        margin: EdgeInsets.all(10),
                        color: Color.fromARGB(255, 231, 232, 233),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Row(
                                children: [
                                  Column(children: [
                                    SizedBox(height: 10, width: 10),
                                    Column(
                                      children: [
                                        Text('2 hours ago BBc News'),
                                        SizedBox(height: 20),

                                        // alignment: Alignment.center,

                                        Text(
                                          'Apple admits slowing down older iphones',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Container(
                                            child: RichText(
                                                text: TextSpan(
                                          text:
                                              'Customers have long suspected iphones slow down over time,\nNow,Apple has confirmedsome models d0',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.blue,
                                          ),
                                        ))),
                                      ],
                                    ),
                                  ]),
                                  SizedBox(width: 500, height: 20),
                                  Column(children: [
                                    IconButton(
                                      onPressed: () {
                                        //action coe when button is pressed
                                      },
                                      icon: Icon(Icons.image, size: 90),
                                    ),
                                    SizedBox(width: 500, height: 20),
                                    FloatingActionButton(
                                        onPressed: decrement,
                                        tooltip: 'decrement',
                                        child:
                                            const Icon(Icons.delete_outline)),
                                  ])
                                ],
                              ),
                            ],
                          ),
                        )));
              }),
          floatingActionButton: FloatingActionButton(
              onPressed: increment,
              tooltip: 'Increment',
              child: const Icon(Icons.add)),
        ));
  }
}
