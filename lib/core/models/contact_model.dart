import 'dart:io';

class ContactModel {
  final File? image;
  final String name;
  final String email;
  final String phone;

  ContactModel({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
  });
}
