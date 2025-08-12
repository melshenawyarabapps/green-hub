import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/features/more/data/models/contact_model.dart';
import 'package:gold/features/more/data/repos/more_repo.dart';

part 'more_state.dart';

class MoreController extends Cubit<MoreState> {
  MoreController(this._moreRepo)
    : super(const MoreState(status: RequestStatus.initial, contacts: []));

  final MoreRepo _moreRepo;

  Future<void> getContacts() async {
    if (state.status.isLoading == true || state.contacts.isNotEmpty) {
      return;
    }

    emit(state.copyWith(status: RequestStatus.loading));
    final result = await _moreRepo.getContacts();
    result.fold(
      (l) {
        emit(state.copyWith(status: RequestStatus.error));
      },
      (contacts) {
        emit(state.copyWith(status: RequestStatus.loaded, contacts: contacts));
      },
    );
  }
}
