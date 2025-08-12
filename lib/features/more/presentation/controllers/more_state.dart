part of 'more_controller.dart';

class MoreState extends Equatable {
  final RequestStatus? status;

  final List<ContactModel> contacts;

  const MoreState({this.status, required this.contacts});

  MoreState copyWith({RequestStatus? status, List<ContactModel>? contacts}) {
    return MoreState(
      status: status ?? this.status,
      contacts: contacts ?? this.contacts,
    );
  }

  @override
  List<Object?> get props => [status, contacts];
}
