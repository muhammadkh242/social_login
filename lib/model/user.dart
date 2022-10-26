class User {
  String? name;
  String? email;
  String? avatarUrl;
  SocialPlatform socialPlatform;

  User({
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.socialPlatform,
  });
}

enum SocialPlatform {
  google,
  facebook,
  linkedin,
  twitter,
  instagram,
}
