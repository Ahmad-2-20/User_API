import 'package:flutter/material.dart';
import 'package:users_api/api/data_api.dart';
import 'package:users_api/api_kay/data.dart';
import 'package:users_api/my_app/user.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Data> git = [];
  Data api = Data();

  @override
  void initState() {
    ApiData().format().then((value) {
      setState(() {
        git = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          accentColor: Colors.white,
        ),
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: appBar(),
              title: text(),
            ),
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.yellow,
                  Colors.orange,
                  Colors.red,
                  Colors.pink
                ])),
                child: listVwe())));
  }

  Widget text() {
    return Text('User API',
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ));
  }

  Widget listVwe() {
    return ListView.builder(
      itemCount: git.length,
      itemBuilder: (context, index) {
        api = git[index];
        return InkWell(
          child: Card(
              margin: EdgeInsetsDirectional.all(50),
              elevation: 15,
              child: container()),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => User(
                      data: git[index],
                    )),
              ),
            );
          },
        );
      },
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.yellow,
        Colors.orange,
        Colors.red,
      ])),
    );
  }

  Widget container() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.yellow,
        Colors.orange,
        Colors.red,
      ])),
      padding: EdgeInsetsDirectional.all(20),
      child: Center(
        child: Column(
          children: [
            SafeArea(child: Icon(Icons.person)),
            Text(
              api.name,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
