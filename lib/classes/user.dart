class User {
  String ciuser;
  String firstName;
  String lastName;
  String email;
  String fono;
  String username;
  String? secret;

  User({
    required this.ciuser,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.fono,
    required this.username,
    this.secret,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        ciuser: json['ciuser'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        fono: json['fono'],
        username: json['username'],
        secret: json['secret']);
  }
  //Object to JSON
  Map<String, dynamic> toJson() => {
        'ciuser': ciuser,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'fono': fono,
        'username': username,
        'secret': secret,
      };
}
