class Geo {
  String lat;
  String lng;

  Geo({
    this.lat = '',
    this.lng = '',
  });

  factory Geo.fromJason(Map<String, dynamic> jason) {
    Geo git = Geo();

    git.lat = jason['lat'];
    git.lng = jason['lng'];

    return git;
  }
}
