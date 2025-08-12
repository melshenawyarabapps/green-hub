enum ContactType {
  whatsapp,
  telegram,
  instagram,
  facebook,
  tiktok,
  twitter,
}

extension ContactTypeExtension on ContactType {
  String get image {
    return 'assets/icons/$name.png';
  }
}
