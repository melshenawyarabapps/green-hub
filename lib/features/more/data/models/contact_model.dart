import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:gold/core/enums/other_enums.dart';

class ContactModel extends Equatable {
  final ContactType type;

  final String url;

  const ContactModel({required this.type, required this.url});

  static ContactModel? fromJson(MapEntry json) {
    final type = ContactType.values.firstWhereOrNull(
      (element) => element.name == json.key,
    );
    if (type == null || json.value == null || json.value.isEmpty) return null;
    if (type == ContactType.whatsapp) {
      json = MapEntry(json.key, 'https://wa.me/${json.value}');
    }
    return ContactModel(type: type, url: json.value);
  }

  @override
  List<Object?> get props => [type, url];
}
