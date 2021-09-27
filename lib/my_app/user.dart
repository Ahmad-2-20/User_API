import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:users_api/api_kay/data.dart';

class User extends StatelessWidget {
  var data;
  User({this.data});

  @override
  Widget build(BuildContext context) {
    Data gitData = this.data as Data;

    Widget username =
        list('username: ${gitData.username}', icons: Icons.person);
    Widget email = list('email: ${gitData.email}', icons: Icons.email);
    Widget address = _address();

    Widget phone = list('phone: ${gitData.phone}', icons: Icons.phone);
    Widget website =
        list('website: ${gitData.company}', icons: Icons.web_stories);
    Widget comp = compny();

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(gitData.name),
          actions: [Icon(Icons.person)],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.yellow,
              Colors.orange,
              Colors.red,
            ])),
          )),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.yellow,
            Colors.orange,
            Colors.red,
            Colors.pink
          ])),
          child: ListView(
            children: [username, email, address, phone, website, comp],
          )),
    );
  }

  Widget list(String text, {icons}) {
    return ListTile(
      title: Text(text),
      leading: Icon(icons),
    );
  }

  Widget expansionTile(
    String text, {
    name,
    catchphrase,
    bs,
  }) {
    return Container(
      child: ExpansionTile(
        title: Text('compny $text'),
        children: [list(''), list('catchphrase$catchphrase'), list('bs$bs')],
      ),
    );
  }

  Widget compny() {
    Data gitData = this.data as Data;

    return Container(
      child: ExpansionTile(
        title: Text('compny: ${gitData.company}'),
        children: [
          list('name: ${gitData.company.name}'),
          list('catchphrase: ${gitData.company.catchphrase}'),
          // list('bc: ${gitData.company.bc}')
        ],
      ),
    );
  }

  Widget _address() {
    Data gitData = this.data as Data;
    return Container(
      child: ExpansionTile(
        title: Text('address: ${gitData.address}'),
        children: [
          list('street: ${gitData.address.street}'),
          list('city: ${gitData.address.city}'),
          list('suite: ${gitData.address.suite}'),
          list('zipcode: ${gitData.address.zipcode}'),
          geo()
        ],
      ),
    );
  }

  Widget geo() {
    Data gitData = this.data as Data;

    return Container(
      child: ExpansionTile(
        title: Text('geo: ${gitData.address.geo}'),
        children: [
          list('lat: ${gitData.address.geo.lat}'),
          list('lng: ${gitData.address.geo.lng}'),
        ],
      ),
    );
  }
}
