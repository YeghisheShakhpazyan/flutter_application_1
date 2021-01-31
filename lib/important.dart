import './tasks.dart';
import 'package:flutter/material.dart';

class Important extends StatefulWidget {
  static MaterialColor color = Colors.red;
  @override
  _ImportantState createState() => _ImportantState();
}

class _ImportantState extends State<Important> {
  var c = TextEditingController();
  var tasks = Tasks.tasks;
  var backColor = Colors.red;
  var isBackImageSetted = false;
  var backroundImage = null;

  void setBackColor(color) {
    setState(() {
      print("mainMathod");
      this.backColor = color;
      isBackImageSetted = false;
    });
  }

  void setBackImage(image) {
    setState(() {
      backroundImage = image;
      isBackImageSetted = true;
    });
  }

  void addTask(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: c,
                  decoration: InputDecoration(
                      hintText: "add task",
                      prefixIcon: Icon(Icons.remove_circle),
                      suffix: IconButton(
                        icon: Icon(Icons.arrow_upward),
                        onPressed: () {
                          Tasks.addImportantTask(c.text);
                          setState(() {});
                        },
                      )),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 160,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.calendar_today,
                            ),
                            Text("set date"),
                          ],
                        ),
                      ),
                      Container(
                        width: 160,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [Icon(Icons.notifications), Text("notify")],
                        ),
                      ),
                      Container(
                        width: 160,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.repeat,
                            ),
                            Text("repeat")
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: isBackImageSetted
            ? DecorationImage(
                image: AssetImage(backroundImage), fit: BoxFit.cover)
            : null,
      ),
      child: Scaffold(
        backgroundColor: isBackImageSetted ? Colors.transparent : backColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (ctx) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.subject,
                          color: Colors.grey,
                        ),
                        Text("sorting order"),
                      ],
                    ),
                    value: 0,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                        ),
                        Text("add icon"),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.color_lens,
                          color: Colors.grey,
                        ),
                        Text("set subject"),
                      ],
                    ),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(
                          Icons.offline_bolt,
                          color: Colors.grey,
                        ),
                        Text("show completed task"),
                      ],
                    ),
                    value: 3,
                  ),
                ];
              },
              onSelected: (value) =>
                  value == 2 ? setSubject(context) : print(2),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Important",
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
              Expanded(
                child: _body(context),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              addTask(context);
            },
            child: Icon(Icons.add)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Widget _body(ctx) {
    List<Widget> list = [];
    var c = ((MediaQuery.of(ctx).size.height - kToolbarHeight) / 70).round();
    for (int i = 0; i < c; i++) {
      list.add(Divider());
    }
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: list,
      ),
      ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                  ),
                  onPressed: () {
                    Tasks.deleteTask(tasks[index].id);

                    setState(() {});
                  }),
              title: Text(
                tasks[index].title,
              ),
              subtitle: Text("tasks"),
              trailing: Icon(
                Icons.star,
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: tasks.length,
      ),
    ]);
  }

  void setSubject(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctx) {
          return BottomSheet(
            changeColorCallBack: setBackColor,
            changBackroundImage: setBackImage,
          );
        });
  }
}

class BottomSheet extends StatefulWidget {
  final Function changeColorCallBack;
  final Function changBackroundImage;

  BottomSheet(
      {@required this.changeColorCallBack, @required this.changBackroundImage});

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  bool isColorSelected = true;
  bool isImagesSelected = false;
  var colors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.grey,
    Colors.pink,
    Colors.purple,
    Colors.amber
  ];

  var images = [
    "assets/image1.jpg",
    "assets/image2.jpg",
    "assets/images3.jpg",
    "assets/images4.jpg",
    "assets/images6.jpg",
    "assets/images7.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("choose subject", style: TextStyle(fontSize: 20)),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                isColorSelected = true;
                isImagesSelected = false;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isColorSelected ? Colors.red : Colors.white,
                ),
                child: Text(
                  "Colors",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                isColorSelected = false;
                isImagesSelected = true;
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isImagesSelected ? Colors.red : Colors.white,
                ),
                child: Text(
                  "Images",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
        isColorSelected ? colorsListView() : imagesListView()
      ],
    );
  }

  Widget colorsListView() {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Important.color = colors[index];
        });
      },
      child: Container(
        height: 50,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print("fromGesture");
                  widget.changeColorCallBack(colors[index]);
                },
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: colors[index],
                ),
              );
            },
            itemCount: colors.length),
      ),
    );
  }

  Widget imagesListView() {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                widget.changBackroundImage(images[index]);
              },
              child: Container(
                margin: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage(images[index]),
                  radius: 25,
                ),
              ),
            );
          },
          itemCount: images.length),
    );
  }
}
