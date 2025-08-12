import 'package:dartz/dartz.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/map_extensions.dart';
import 'package:gold/core/utils/end_points.dart';
import 'package:gold/features/more/data/models/contact_model.dart';
import 'package:gold/core/services/api/api_errors.dart';
import 'package:gold/core/services/api/api_service.dart';

class MoreRepo {
  final ApiService _apiService;

  MoreRepo(this._apiService);

  Future<Either<Failure, List<ContactModel>>> getContacts() async {
    try {
      /*
              "whatsapp": "01000000000",
        "instagram": "www.instagram.com/etst",
        "facebook": "www.facebook.com/yourpage",
        "youtube": "www.youtube.com/yourpage",
        "tiktok": "www.tiktok.com/yourpage4",
        "twitter": null
       */
      final response = await _apiService.get(
        endPoint: EndPoints.instance.contacts,
      );
      final data = response['data'] as Map<dynamic, dynamic>;
      final List<ContactModel> list = [];
      for (var entry in data.entries) {
        final contact = ContactModel.fromJson(entry);
        if (contact != null) {
          list.add(contact);
        }
      }

      return Right(list);
    } catch (e) {
      return Left(ServerFailure.generalException(e));
    }
  }
}
