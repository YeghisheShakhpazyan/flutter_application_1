import 'package:flutter/material.dart';
import './important.dart';
import './myDayScreen.dart';
import './planned.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var flag = true;
  void toogleFlag() {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(toogleFlag, flag),
      bottomNavigationBar: flag ? _bottomBar() : null,
      body: flag ? _mainActionsList() : settingsList(),
    );
  }

  Widget _mainActionsList() {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.wb_sunny),
          title: Text("My Day"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return MyDayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.star_border),
          title: Text("important"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return Important();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.calendar_today),
          title: Text("planned"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return Planned();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text("appointed by you"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return MyDayScreen();
                },
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("tasks"),
          trailing: Text("0"),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) {
                  return MyDayScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget settingsList() {
    return Container(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.add),
            title: Text("add profile"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return MyDayScreen();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("control profiles"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return MyDayScreen();
                  },
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("setting"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return MyDayScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _appBar(toogleFlag, bool flag) {
    var appBarElements = [
      CircleAvatar(
        backgroundColor: Colors.blue[200],
        radius: flag ? 15 : 30,
        child: Text("JL"),
      ),
      flag
          ? SizedBox(
              width: 10,
            )
          : SizedBox(
              height: 15,
            ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                "John Lenon",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(flag ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
            ],
          ),
          Text("johnLenon@gmail.com")
        ],
      )
    ];
    return PreferredSize(
      child: GestureDetector(
        onTap: () {
          toogleFlag();
          print("appbar");
        },
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).padding.top + 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              flag
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: appBarElements,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: appBarElements,
                    ),
              flag
                  ? IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.blue[200],
                      ),
                      onPressed: () {
                        print("search");
                      },
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.blue[200],
                      ),
                      onPressed: () {
                        toogleFlag();
                      },
                    )
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(200),
    );
  }

  Widget _bottomBar() {
    return BottomAppBar(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print("createList");
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.blue[200],
                    size: 35,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Create List",
                    style: TextStyle(
                        color: Colors.blue[200],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("hello");
              },
              child: Icon(
                Icons.add_box,
                color: Colors.blue[200],
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
