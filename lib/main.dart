import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final List<String> nav = ['Список 1', 'Список 2'];
  // final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, List<String>> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Homework example'),
          bottom: TabBar(
            tabs: data.keys
                .map((String name) => Tab(
                      text: name,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: data.keys.map((name) {
            return ListView.builder(
              key: PageStorageKey(name),
              itemCount: data[name].length,
              itemBuilder: (context, index) => Container(
                height: 200,
                margin:
                    const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5.0),
                color: Color.fromARGB(255, 39, 133, 211),
                padding: const EdgeInsets.all(8.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading-33.gif',
                  image: data[name].elementAt(index),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
