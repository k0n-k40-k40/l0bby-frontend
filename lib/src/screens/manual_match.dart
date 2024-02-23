import 'package:flutter/material.dart';
import '../components/navigation_bar.dart';

class ManualMatchScreen extends StatelessWidget {
  const ManualMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildSearch(),
          Container(
            height: 160.0,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(),
                Material(
                  elevation: 3.0,
                  child: Container(
                    height: 100.0,
                    margin: EdgeInsets.only(left: 150.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Room 1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 150.0,
                    height: 130.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://img.freepik.com/premium-vector/football-soccer-logo_609550-353.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

buildAppBar() {
  return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      title: const Text('Manual Match',
          style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {},
        ),
      ]);
}

Padding buildSearch() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: <Widget>[
        Expanded(
            child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 17.0),
            prefixIcon: Icon(Icons.search),
          ),
        )),
        IconButton(icon: Icon(Icons.filter_list), onPressed: () {}),
      ],
    ),
  );
}
