import 'package:flutter/material.dart';

class card2 extends StatefulWidget {
  const card2({super.key});

  @override
  State<card2> createState() => _card1State();
}

class _card1State extends State<card2> {
  List<String> names = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  TextEditingController editingController = TextEditingController();
  //int s = names.length;
  final duplicateItems = List<String>.generate(
      50, (i) => "Apple admits slowing down older iphones,$i");
  int counter = 2;

  get i => null;
  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      counter--;
    });
  }

  var items = <String>[];
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResult(String query) {
    List<String> dummySearchList = <String>[];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = <String>[];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('list'),
              //automaticallyImplyLeading: false,
            ),
            body: Container(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      onChanged: (value) {
                        filterSearchResult(value);
                      },
                      controller: editingController,
                      decoration: InputDecoration(
                          labelText: "search",
                          hintText: "search",
                          prefixIcon: Icon(Icons.search)))),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 150,
                            child: Card(
                                margin: EdgeInsets.all(10),
                                color: Colors.grey,
                                child: Row(children: [
                                  Text('${items[index]}'),
                                  SizedBox(width: 500, height: 20),
                                  Column(children: [
                                    IconButton(
                                      onPressed: () {
                                        //action coe when button is pressed
                                      },
                                      icon: Icon(Icons.image, size: 90),
                                    ),
                                    SizedBox(width: 200, height: 20),
                                    FloatingActionButton(
                                        onPressed: decrement,
                                        tooltip: 'decrement',
                                        child:
                                            const Icon(Icons.delete_outline)),
                                  ])
                                ])));
                      }))
            ]))));
  }
}
