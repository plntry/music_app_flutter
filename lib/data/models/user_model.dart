class User {
  final String firstName;
  final String lastName;
  final String email;
  final String thumbnail;
  final String largePicture;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.thumbnail,
    required this.largePicture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final picture = json['picture'];

    return User(
      firstName: name['first'],
      lastName: name['last'],
      email: json['email'],
      thumbnail: picture['thumbnail'],
      largePicture: picture['large'],
    );
  }
}
