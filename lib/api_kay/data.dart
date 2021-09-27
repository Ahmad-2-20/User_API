import 'package:users_api/api_kay/address.dart';

import 'company.dart';

class Data {
  String name;
  String username;
  String email;
  var address; //
  String phone;
  String website;
  var company; //

  Data({
    this.name = '',
    this.username = '',
    this.email = '',
    this.address = Address,
    this.phone = '',
    this.website = '',
    this.company = Company,
  });

  factory Data.fromJason(Map<String, dynamic> jason) {
    Data git = Data();

    git.name = jason['name'];
    git.username = jason['username'];
    git.email = jason['email'];
    git.address = Address.fromJason(jason['address']);
    git.phone = jason['phone'];
    git.website = jason['website'];
    git.company = Company.fromJason(jason['company']);

    return git;
  }
}
