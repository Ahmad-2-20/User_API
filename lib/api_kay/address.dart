import 'package:users_api/api_kay/geo.dart';

class Address {
  String street;
  String city;
  String suite;
  String zipcode;
  var geo;

  Address({
    this.street = '',
    this.city = '',
    this.suite = '',
    this.zipcode = '',
    this.geo = Geo,
  });

  factory Address.fromJason(Map<String, dynamic> jason) {
    Address git = Address();

    git.street = jason['street'];
    git.city = jason['city'];
    git.suite = jason['suite'];
    git.zipcode = jason['zipcode'];
    git.geo = Geo.fromJason(jason['geo']);

    return git;
  }
}
