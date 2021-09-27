class Company {
  String name;
  String catchphrase;
  String bs;

  Company({this.name = '', this.catchphrase = '', this.bs = ''});

  factory Company.fromJason(Map<String, dynamic> jason) {
    Company git = Company();

    git.name = jason['name'];
    git.catchphrase = jason['catchPhrase'];
    // git.bs = jason['bs'];

    return git;
  }
}
