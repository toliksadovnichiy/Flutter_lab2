import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Hero(
                tag: 'profile_photo',
                child: Image.asset('assets/images/scroll.jpg'))),
      ));
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(
            'Twitter',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {},
            ),
          ]),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        8,
                        (index) => Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade50,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            padding: EdgeInsets.all(13),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Screen1()),
                                  );
                                },
                                child: Hero(
                                  tag: 'profile_photo',
                                  child: CircleAvatar(
                                    radius: 19,
                                    backgroundImage:
                                        AssetImage("assets/images/scroll.jpg"),
                                  ),
                                )))),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                      children: List.generate(
                          8,
                          (index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  tweetAvatar(),
                                  tweetBody(),
                                  Divider(color: Colors.grey.shade200),
                                ],
                              ))),
                ),
              ])),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail_outline), label: "message")
          ],
          unselectedItemColor: Colors.grey.shade600,
          currentIndex: counter,
          fixedColor: Colors.blue,
          onTap: (int intIndex) {
            setState(() {
              counter = intIndex;
            });
          }),
    );
  }

  Widget tweetAvatar() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/scroll.jpg"),
      ),
    );
  }

  Widget tweetBody() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5.0),
                child: Text(
                  'Nickname',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '@nickname',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  size: 14.0,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            overflow: TextOverflow.clip,
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment, color: Colors.grey.shade600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share, color: Colors.grey.shade600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite, color: Colors.grey.shade600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
